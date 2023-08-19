require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

import "function"
activity.setTheme(R.Theme_Teal)
layout=
{
  LinearLayout;
  orientation='vertical';
  layout_width='fill';
  layout_height='fill';
  gravity='center';
  BackgroundColor="0xFFF7E7B6",
  {
    GridView,
    numColumns=15,
    layout_height='100%w',
    layout_width='100%w',
    id="grid",
  },
}
activity.setContentView(loadlayout(layout))
activity.ActionBar.hide()
状态栏()


import "com.androlua.LuaDrawable"
import "android.graphics.Paint"

w=activity.width
ItemWH=w/15


item={
  TextView,
  layout_width=ItemWH,
  layout_height=ItemWH,
  TextSize="0",
  Gravity="center",
  id="tv",
}

data={}
adp=LuaAdapter(activity,data,item)
grid.setAdapter(adp)


pos={}
for i=0,15*15-1 do
  table.insert(data,{tv=""})
  local x=i%15
  local y=i//15
  table.insert(pos,{
    x=x,
    y=y,
    x1=x+y,--斜坐标
    y1=x-y,
    value="0",
  })
end


--给五子棋画个UI框

InitBoardDrawable=LuaDrawable(function(mCanvas,mPaint,mDrawable)

  mPaint1 = Paint();
  mPaint1.setStrokeWidth(2)
  mPaint1.setAntiAlias(true)
  mPaint1.setStyle(Paint.Style.STROKE)
  mPaint1.setColor(0x88000000)
  mPaint1.setTextSize(20)

  zby={" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "}

  mCanvas.drawColor(0xFFF7E7B6)

  for i=0,14 do
    --横线
    mCanvas.drawLine(ItemWH/2,ItemWH/2+i*ItemWH,w-ItemWH/2,ItemWH/2+i*ItemWH,mPaint1)
    --竖线
    mCanvas.drawLine(ItemWH/2+i*ItemWH,ItemWH/2,ItemWH/2+i*ItemWH,w-ItemWH/2,mPaint1)


    mCanvas.drawText(zby[i+1],ItemWH/3-8,ItemWH/2+i*ItemWH+8,mPaint1)
  end

  mPaint1.setStyle(Paint.Style.FILL)
  mCanvas.drawCircle(w/2, w/2, ItemWH/8, mPaint1)
  mCanvas.drawCircle(ItemWH/2+3*ItemWH, ItemWH/2+3*ItemWH, ItemWH/8, mPaint1)
  mCanvas.drawCircle(ItemWH/2+11*ItemWH, ItemWH/2+3*ItemWH, ItemWH/8, mPaint1)
  mCanvas.drawCircle(ItemWH/2+3*ItemWH, ItemWH/2+11*ItemWH, ItemWH/8, mPaint1)
  mCanvas.drawCircle(ItemWH/2+11*ItemWH, ItemWH/2+11*ItemWH, ItemWH/8, mPaint1)
end)

grid.background=InitBoardDrawable

--黑棋子背景
BlackPieceDrawable=LuaDrawable(function(mCanvas,mPaint,mDrawable)
  mPaint1 = Paint();
  mPaint1.setStrokeWidth(25)
  mPaint1.setAntiAlias(true)
  mPaint1.setStyle(Paint.Style.FILL)
  mPaint1.setColor(0xFF120F0C)
  mCanvas.drawCircle(ItemWH/2, ItemWH/2, ItemWH/2.5, mPaint1)
end)


WhitePieceDrawable=LuaDrawable(function(mCanvas,mPaint,mDrawable)
  mPaint1 = Paint();
  mPaint1.setStrokeWidth(25)
  mPaint1.setAntiAlias(true)
  mPaint1.setStyle(Paint.Style.FILL)
  mPaint1.setColor(0xFFFFFFFF)
  mCanvas.drawCircle(ItemWH/2, ItemWH/2, ItemWH/2.5, mPaint1)
end)

function 判断是否五子连珠(p)
  x=p%15
  y=p//15
  x1=x+y
  y1=x-y
  strx=""
  stry=""
  strx1=""
  stry1=""
  for k,v in pairs(pos)
    if v.x==x then
      strx=strx..v.value
    end
    if v.y==y then
      stry=stry..v.value
    end
    if v.x1==x1 then
      strx1=strx1..v.value
    end
    if v.y1==y1 then
      stry1=stry1..v.value
    end
  end
  if string.find(strx,"11111")~=nil or string.find(stry,"11111")~=nil or string.find(strx1,"11111")~=nil or string.find(stry1,"11111")~=nil then
    return 1
  end
  if string.find(strx,"22222")~=nil or string.find(stry,"22222")~=nil or string.find(strx1,"22222")~=nil or string.find(stry1,"22222")~=nil then
    return 2
  end
  return 0
end

a=true--黑子先行

grid.onItemClick=function(l,v,p,i)
  if pos[i].value=="0" then
    if a then--如果是黑子
      pos[i].value="1"
      v.background=BlackPieceDrawable
     else--如果是白子
      pos[i].value="2"
      v.background=WhitePieceDrawable
    end
    a=not(a)
    判断=判断是否五子连珠(p)
    if 判断==1 then
      确认事件="activity.recreate()"
      取消事件="activity.finish()"
      弹窗UI("提示","黑子胜利！",确认事件,取消事件,"退出","重新开始",高度)
    end
    if 判断==2 then
      确认事件="activity.recreate()"
      取消事件="activity.finish()"
      弹窗UI("提示","白子胜利！",确认事件,取消事件,"退出","重新开始",高度)
    end
   else
  end
end