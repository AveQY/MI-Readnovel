require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo_Light)
activity.setContentView(loadlayout({
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
  orientation="horizontal";
  id="back";
  {
    AbsoluteLayout;
    layout_height="fill";
    layout_width="25%w";
    --  orientation="vertical";
    id="road1";
  };
  {
    AbsoluteLayout;
    layout_height="fill";
    layout_width="25%w";
    --  orientation="vertical";
    id="road2";
  };
  {
    AbsoluteLayout;
    layout_height="fill";
    layout_width="25%w";
    -- orientation="vertical";
    id="road3";
  };
  {
    AbsoluteLayout;
    layout_height="fill";
    layout_width="30%w";
    -- orientation="vertical";
    id="road4";
  };
}))

--小绵羊出品



难度=10
fps=15
speed=4*难度
speedquack=4000*(1/难度)
fans=0

quack=loadlayout(
{
  Button;
  layout_width="22%w";
  id="quacks",
  layout_height="20%h";
  background="#000000";
})

roadn={
  [1]=road1,
  [2]=road2,
  [3]=road3,
  [4]=road4,
}
quack.onClick=function(v)
  roadn[last].removeView(v)
end

back.onClick=function(v)
  --  gametick.stop()
  -- addtick.stop()
  -- Toast.makeText(activity,tostring("得分:"..tointeger(fans).."  "),Toast.LENGTH_SHORT).show()

end

newquack=math.random(1,4)
last=newquack
--loadstring("road"..tostring(newquack)..".addView(quack)")()


gametick=Ticker()
gametick.Period=1000/fps
gametick.onTick=function()


  function foreach(v)
    for i=0, v.getChildCount() do
      local child=v.getChildAt(i)

      if pcall(function() child.getChildCount() end) then
        foreach(child)
       else
        --print(type(child))
        switch(type(child))
         case "android.widget.Button"
          if child.getY()>activity.getHeight() then
            if child.getText()~=" " then
              --gametick.stop()
              -- addtick.stop()
              --Toast.makeText(activity,"游戏结束.",Toast.LENGTH_SHORT).show()
              --Toast.makeText(activity,tostring("得分:"..tointeger(fans).."  "),Toast.LENGTH_SHORT).show()
             else

            end
          end
          child.setY(child.getY()+speed)
        end

      end
    end
  end

  foreach(back)
end
n=0
quacktab={}
addtick=Ticker()
addtick.Period=speedquack
addtick.onTick=function()


  quacktab=loadlayout(
  {
    Button;
    layout_width="22%w";
    onClick=function(v)
      fans=fans+speed/10
      v.setText(" ")
      v.getParent().removeView(v)
    end,
    id="quacks",
    layout_height="20%h";
    background="#000000";
  })

  quacktab.setY(-0.05*activity.getHeight())

  n=n+1


  newquack=math.random(1,4)
  while newquack==last do
    newquack=math.random(1,4)
  end
  last=newquack
  roadn[newquack].addView(quacktab)
end


gametick.start()
addtick.start()

function onDestroy()
  gametick.stop()
  addtick.stop()
end



