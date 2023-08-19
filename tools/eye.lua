require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
function 示(内容)
  Toast.makeText(activity,内容,Toast.LENGTH_LONG).show()
end

layout={
  LinearLayout,
  orientation="vertical",
  layout_width="fill",
  layout_height="fill",
}

aa={
  GridLayout;
  layout_width="wrap";
  layout_height="wrap";
  columnCount="6",
};


function vv(a)
  i= {
    Button;
    background="#FFFFFFFF";
    id=a;
    layout_width="16%w";
    layout_height="50dp";
    layout_margin="3";
    textSize="12sp";
  };
  table.insert(aa,i)
end
for i=1,42,1 do
  vv("ee"..i)
end

activity.setContentView(loadlayout(aa))
idd={ee1,ee2,ee3,ee4,ee5,ee6,
  ee7,ee8,ee9,ee10,ee11,ee12,
  ee13,ee14,ee15,ee16,ee17,ee18,
  ee19,ee20,ee21,ee22,ee23,ee24,
  ee25,ee26,ee27,ee28,ee29,ee30,
  ee31,ee32,ee33,ee34,ee35,ee36}
ff=0
bo=true
正确=0
错误=0
提示=5
function 随机颜色()
  f1=Integer.toHexString(155+正确)
  f2=Integer.toHexString(math.random(22,255))
  f3=Integer.toHexString(math.random(22,255))
  f4=Integer.toHexString(math.random(22,255))
  f5="ff"..f2..f3..f4
  f6=f1..f2..f3..f4
  for i=1,#idd do
    idd[i].BackgroundColor=tonumber(f5,16)
  end
  ff=math.random(1,36)
  idd[ff].BackgroundColor=tonumber(f6,16)
  return ff
end
时间=0
ti=Ticker()
ti.Period=1000
ti.onTick=function()
  时间=时间+1
  ee40.setText("时间\n"..时间)
  if 时间==100 then
    ti.stop()
    示("已结束")
    ee42.setText("评分\n"..正确-错误+(提示-5))
    ee39.setClickable(false)
    for i=1,36 do
      idd[1].setClickable(false)
      idd[i].BackgroundColor=0xFFFFFFFF
    end
  end
end

ti.start()
随机颜色()

for i=1,#idd do
  idd[i].onClick=function(x)
    s=tostring(x)
    s= s:sub(#s-2,#s-1)
    s=tonumber(s,16)+1
    idd[i].setText("")
    if s==ff then
      随机颜色()
      正确=正确+1
      ee42.setText("评分\n"..正确-错误+(提示-5))
      ee37.setText("正确"..tostring(正确))
      bo=true
     else
      错误=错误+1
      ee42.setText("评分\n"..正确-错误+(提示-5))
      ee38.setText("错误\n"..错误)
      if 错误==5 then
        ti.stop()
        示("已结束")
        ee42.setText("评分\n"..正确-错误+(提示-5))
        ee39.setClickable(false)
        for i=1,36 do
          idd[i].setClickable(false)
          idd[i].BackgroundColor=0xFFFFFFFF
        end
      end
    end
  end
end
ee37.setText("正确\n"..正确)
ee38.setText("错误\n"..错误)
ee39.setText("提示\n"..提示)
ee40.setText("时间\n"..时间)
ee41.setText("重新\n".."开始")
ee42.setText("评分\n".."0")

ee39.onClick=function(x)
  if bo then
    if 提示>0 then
      提示=提示-1
      idd[ff].setText("^_^")
      ee42.setText("评分\n"..正确-错误+(提示-5))
      ee39.setText("提示\n"..提示)
      bo=false
     else
      示("提示次数已用完")
    end
   else
    示("已提示,请操作")
  end
end

ee41.onClick=function(x)
  activity.recreate()
end

function onDestroy()
  ti.stop()
end


