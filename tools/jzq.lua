require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

activity.setTheme(R.Theme_Blue)
layout={
  LinearLayout;
  orientation='vertical';
  layout_width='fill';
  layout_height='fill';
  gravity='center';
  {
    GridView,
    numColumns=3,
    layout_height='100%w',
    layout_width='100%w',
    id="grid",
  },
}
activity.setContentView(loadlayout(layout))
activity.ActionBar.hide()
状态栏()

import "android.graphics.Paint"
import "com.androlua.LuaDrawable"

w=activity.width
item={
  TextView,
  layout_width=w/3,
  layout_height=w/3,
  TextSize="50",
  Gravity="center",
  id="tv",
}

data={}
adp=LuaAdapter(activity,data,item)
grid.setAdapter(adp)

for i=1,9 do
  table.insert(data,{tv=""})
end

myLuaDrawable=LuaDrawable(function(mCanvas,mPaint,mDrawable)

  mPaint1 = Paint();
  mPaint1.setStrokeWidth(20)
  mPaint1.setAntiAlias(true)
  mPaint1.setStyle(Paint.Style.STROKE)
  mPaint1.setColor(0xD6000000)

  mCanvas.drawLine(0,w/3,w,w/3,mPaint1)
  mCanvas.drawLine(0,w*2/3,w,w*2/3,mPaint1)
  mCanvas.drawLine(w/3,0,w/3,w,mPaint1)
  mCanvas.drawLine(w*2/3,0,w*2/3,w,mPaint1)

end)

grid.background=myLuaDrawable

a=true

grid.onItemClick=function(l,v,p,i)
  if v.Text=="" then
    if a==true then
      v.Text="✔"
      a=false
     else
      v.Text="✘"
      a=true
    end
   else
  end

  function 判断三棋连珠(x,y,z)
    if x==y and y==z and x==z then
      if x=="" and y=="" and z=="" then
       elseif x=="✔" and y=="✔" and z=="✔" then
        确认事件="activity.recreate()"
        取消事件="activity.finish()"
        弹窗UI("提示","✔胜利！",确认事件,取消事件,"退出","重新开始",高度)
       elseif x=="✘" and y=="✘" and z=="✘" then
        确认事件="activity.recreate()"
        取消事件="activity.finish()"
        弹窗UI("提示","✘胜利！",确认事件,取消事件,"退出","重新开始",高度)
      end
    end
  end

  for i=0,8 do
    if i%3 == 0 then
      x=grid.getChildAt(i)
      y=grid.getChildAt(i+1)
      z=grid.getChildAt(i+2)
      判断三棋连珠(x.Text,y.Text,z.Text)
    end

    if i<=2 then
      x=grid.getChildAt(i)
      y=grid.getChildAt(i+3)
      z=grid.getChildAt(i+6)
      判断三棋连珠(x.Text,y.Text,z.Text)
    end
  end

  x=grid.getChildAt(0)
  y=grid.getChildAt(4)
  z=grid.getChildAt(8)
  判断三棋连珠(x.Text,y.Text,z.Text)

  x=grid.getChildAt(2)
  y=grid.getChildAt(4)
  z=grid.getChildAt(6)
  判断三棋连珠(x.Text,y.Text,z.Text)
end