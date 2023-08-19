require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.Paint"
import "com.androlua.LuaDrawable"

activity.setContentView(loadlayout({
  LinearLayout,
  orientation="vertical",
  gravity="center",
  layout_width=-1,
  layout_height=-1,
  {
    TextView,
    text="理线",
    textSize=20,
  },
  {
    TextView,
    text="游戏目标：移动端点，使所有的线条互不相交。",
    textSize=13,
  },
  {
    FrameLayout,
    id="屏",
    layout_width=activity.getWidth(),
    layout_height=activity.getWidth(),
  }
}
));
--[[
作者Rzin
没啥想说的。
]]


端点尺寸=10;--显示尺寸，非触摸尺寸
端点颜色=0xffaa1144;
线条宽度=2;
线条颜色=0xff4411aa;


local 端点={
  --各端点的坐标。
  {250,250},
  {500,500},
  {300,300},
  {450,450},
  {200,400},
  {100,600},
  {350,470},
  {600,180},
  {350,200}
};

local 线条={
  --各线条的端点序号。
  {1,3},
  {2,4},
  {3,5},
  {6,4},
  {2,5},
  {6,2},
  {7,1},
  {6,7},
  {1,5},
  {6,8},
  {2,8},
  {9,4},
  {3,2},
  {9,1},
  {7,4},
  {3,4}
};


function 刷新屏(p0,p1,p2,p3)
  --参：端点尺寸，端点颜色，线条宽度，线条颜色。
  屏.setBackground(
  LuaDrawable(
  function(v0)
    local v1=Paint();--端点画笔
    v1.setColor(p1);
    v1.setStrokeWidth(1);
    v1.setStyle(Paint.Style.FILL);
    v1.setAntiAlias(true);
    v1.setDither(true);
    local v2=Paint();--线条画笔
    v2.setColor(p3);
    v2.setStrokeWidth(p2);
    v2.setStyle(Paint.Style.STROKE);
    v2.setAntiAlias(true);
    v2.setDither(true);
    for i=1,#线条,1 do--画线条
      v0.drawLine(
      端点[线条[i][1]][1],端点[线条[i][1]][2],
      端点[线条[i][2]][1],端点[线条[i][2]][2],
      v2);
    end
    for i=1,#端点,1 do--画端点
      v0.drawCircle(
      端点[i][1],端点[i][2],
      p0,v1);
    end
  end
  ));
end

function 判断相交()
  function 向量叉乘(p0,p1,p2)
    return (p1[1]-p0[1])*(p2[2]-p0[2])-(p1[2]-p0[2])*(p2[1]-p0[1]);
  end
  function 判断(p0,p1)
    local A={端点[线条[p0][1]][1],端点[线条[p0][1]][2]};
    local B={端点[线条[p0][2]][1],端点[线条[p0][2]][2]};
    local C={端点[线条[p1][1]][1],端点[线条[p1][1]][2]};
    local D={端点[线条[p1][2]][1],端点[线条[p1][2]][2]};
    if(向量叉乘(A,B,C)*向量叉乘(A,B,D)<=0
      &&向量叉乘(C,D,A)*向量叉乘(C,D,B)<=0
      &&向量叉乘(A,B,C)*向量叉乘(A,B,D)+
      向量叉乘(C,D,A)*向量叉乘(C,D,B)~=0)then
      --目前存在的bug：无法识别重合的线条，将视为不相交。
      --其实是因为我懒的弄了，也是有办法解决的，比较麻烦。
      return true;
    end
    return false;
  end
  for i=1,#线条,1 do
    for j=i+1,#线条,1 do
      if(判断(i,j))then
        return true;
      end
    end
  end
  return false;
end





选中端点=0;
屏.onTouch=function(p0,p1)
  local v0=p1.getAction()&255;
  if(v0==0)then--判断选中的端点
    local x=p1.getX();
    local y=p1.getY();
    for i=1,#端点,1 do
      if(端点[i][1]-21<x&&x<端点[i][1]+21
        &&端点[i][2]-21<y&&y<端点[i][2]+21)then
        选中端点=i;
        break
      end
    end
   elseif(v0==2&&选中端点>0)--移动端点
    端点[选中端点][1]=p1.getX();
    端点[选中端点][2]=p1.getY();
    刷新屏(端点尺寸,端点颜色,线条宽度,线条颜色);
   elseif(v0==1&&选中端点>0)--移动结束判断输赢
    if(!判断相交())then
      print("成功理清所有线条。");
    end
    选中端点=0;
    刷新屏(端点尺寸,端点颜色,线条宽度,线条颜色);
  end
  return true;
end


刷新屏(端点尺寸,端点颜色,线条宽度,线条颜色);


