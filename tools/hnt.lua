require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.Color"


activity.setContentView(loadlayout({
  FrameLayout,
  layout_width="fill",
  layout_height="fill",
  id="mFrameLayout",
}))
activity.setRequestedOrientation(0)


AINDEX = ... or 3



--开发者:DIFFFFFFT
--QQ:672228275
--描述:这是一款小游戏,名字叫汉诺塔小游戏
--基本没啥bug了,优化下UI和音效效果会更好
--代码没啥规范，写的有点烂


--官网:http://www.hannuota.cn/
--汉诺塔游戏规则:你要将所有的盒子从TOWER 1移动到TOWER 3
--你每次只能移动一个盒子。
--游戏最重要的规则是大的盒子不能放在小的盒子上面

--听说牛逼的人直接挑战第九关

function bu()
  window = activity.getWindow();
  window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN|View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
  window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
  xpcall(function()
    lp = window.getAttributes();
    lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
    window.setAttributes(lp);
  end,
  function(e)
  end)
end

bu()








SCREEN_WIDTH = activity.getHeight()
SCREEN_HEIGHT = activity.getWidth()

MAX_A = SCREEN_WIDTH/3
MAX_B = SCREEN_WIDTH/3
MAX_C = SCREEN_WIDTH/3

COLOR_TABLE = {
  "#FF800020",
  "#FF854F18",
  "#FF858500",
  "#FF1B850C",
  "#FF008585",
  "#FF002185",
  "#FF640085",
  "#FF850064",
  "#FFC00090",
  "#FFC02711",
}




function dp2px(dp)
  local TypedValue= import "android.util.TypedValue"
  local a,b=dp:match("^(%-?[%.%d]+)(%a%a)$")
  return TypedValue.applyDimension(1,tonumber(a),activity.getResources().getDisplayMetrics())
end



function A(AINDEX)
  local class = {}


  local views = {}
  local num = 0

  class.AINDEX=AINDEX

  class.addView=function()

    num = num + 1
    item_w = (SCREEN_WIDTH/3)-dp2px("20dp")*(num-1)
    item_x = (SCREEN_WIDTH/3-item_w)/2
    item_y = (SCREEN_HEIGHT)-dp2px("40dp")*num

    local item = loadlayout({
      TextView,
      gravity="center",
      layout_width=item_w,
      layout_height="40dp",
      x=item_x,
      y=item_y,
      tag=0,
      text="",
      textSize=0,
      backgroundColor=COLOR_TABLE[num],
    })

    mFrameLayout.addView(item)
    class.onTouch(item)
    table.insert(views,item)

    if num == AINDEX then
      item.Text = "first"
    end

  end


  class.a2a=function(item)
    item.setX((SCREEN_WIDTH/3-item.getWidth())/2)
    item.setY((SCREEN_HEIGHT)-dp2px("40dp")*(#views))
  end
  class.a2b=function(item)
    if BQ.a2b(item) then
      return
    end
    table.remove(views,table.find(views,item))
    if #views~=0 then
      views[#views].Text="first"
    end
  end
  class.a2c=function(item)
    if CQ.a2c(item) then
      return
    end
    table.remove(views,table.find(views,item))
    if #views~=0 then
      views[#views].Text="first"
    end
    if CQ.win() then
      return true
    end
  end



  class.b2a=function(item)
    if #views~=0 then
      if item.getWidth() >= views[#views].getWidth() then
        BQ.b2b(item)
        return true
      end
    end

    BQ.b2a(item)

    item.setX((SCREEN_WIDTH/3-item.getWidth())/2)
    item.setY((SCREEN_HEIGHT)-dp2px("40dp")*(#views+1))
    item.tag = 0

    if #views~=0 then
      views[#views].Text=""
    end
    table.insert(views,item)
  end

  class.b2b=function(item)
    BQ.b2b(item)
  end
  class.b2c=function(item)
    BQ.b2c(item)
    if CQ.win() then
      return true
    end
  end



  class.c2a=function(item)
    if #views~=0 then
      if item.getWidth() >= views[#views].getWidth() then
        CQ.c2c(item)
        return true
      end
    end

    CQ.c2a(item)

    item.setX((SCREEN_WIDTH/3-item.getWidth())/2)
    item.setY((SCREEN_HEIGHT)-dp2px("40dp")*(#views+1))
    item.tag = 0

    if #views~=0 then
      views[#views].Text=""
    end
    table.insert(views,item)
  end
  class.c2b=function(item)
    CQ.c2b(item)
  end
  class.c2c=function(item)
    CQ.c2c(item)
    if CQ.win() then
      return true
    end
  end


  class.onTouch=function(item)

    item.onTouch=function(view,event)
      ACTION = event.getAction()
      if ACTION == MotionEvent.ACTION_DOWN then

       elseif ACTION == MotionEvent.ACTION_MOVE then
        sx = event.getRawX()
        sy = event.getRawY()
        l = view.getLeft()
        t = view.getTop()

        if item.Text == "first" then
          view.setX(sx+l-(view.getWidth()/2))
          view.setY(sy+t-(view.getHeight()/2))
        end

       elseif ACTION == MotionEvent.ACTION_UP then

        if item.Text ~= "first" then
          return false
        end

        lastx = event.getRawX()
        lasty = event.getRawY()

        if lastx >= 0 and lastx <= SCREEN_WIDTH/3 then
          tag = 0
         elseif lastx >= SCREEN_WIDTH/3 and lastx <= SCREEN_WIDTH*2/3 then
          tag = 1
         else
          tag = 2
        end

        if item.tag==0 and tag==0 then
          class.a2a(item)
         elseif item.tag==0 and tag==1 then
          class.a2b(item)
         elseif item.tag==1 and tag==0 then
          class.b2a(item)
         elseif item.tag==1 and tag==1 then
          class.b2b(item)
         elseif item.tag==0 and tag==2 then
          class.a2c(item)
         elseif item.tag==2 and tag==0 then
          class.c2a(item)
         elseif item.tag==2 and tag==2 then
          class.c2c(item)
         elseif item.tag==1 and tag==2 then
          class.b2c(item)
         elseif item.tag==2 and tag==1 then
          class.c2b(item)
        end

      end
      return true
    end

  end



  for i=1,AINDEX do
    class.addView()
  end


  return class
end



function B()
  local class = {}

  local views = {}

  class.a2b=function(item)
    if #views~=0 then
      if item.getWidth() >= views[#views].getWidth() then
        AQ.a2a(item)
        return true
      end
    end

    item.setX((SCREEN_WIDTH-item.getWidth())/2)
    item.setY(SCREEN_HEIGHT-dp2px("40dp")*(#views+1))
    item.tag = 1
    if #views~=0 then
      views[#views].Text=""
    end
    table.insert(views,item)
  end

  class.b2a=function(item)
    table.remove(views,table.find(views,item))
    if #views~=0 then
      views[#views].Text="first"
    end
  end

  class.b2b=function(item)
    item.setX((SCREEN_WIDTH-item.getWidth())/2)
    item.setY(SCREEN_HEIGHT-dp2px("40dp")*(#views))
  end

  class.b2c=function(item)
    if CQ.b2c(item) then
      return
    end
    table.remove(views,table.find(views,item))
    if #views~=0 then
      views[#views].Text="first"
    end
    if CQ.win() then
      return true
    end
  end

  class.c2b=function(item)
    if #views~=0 then
      if item.getWidth() >= views[#views].getWidth() then
        CQ.c2c(item)
        return true
      end
    end

    item.setX((SCREEN_WIDTH-item.getWidth())/2)
    item.setY(SCREEN_HEIGHT-dp2px("40dp")*(#views+1))
    item.tag = 1
    if #views~=0 then
      views[#views].Text=""
    end
    table.insert(views,item)
  end

  return class
end




function C()

  local class = {}

  local views = {}

  class.a2c=function(item)
    if #views~=0 then
      if item.getWidth() >= views[#views].getWidth() then
        AQ.a2a(item)
        return true
      end
    end

    item.setX(((SCREEN_WIDTH*5)/6)-item.getWidth()/2)
    item.setY(SCREEN_HEIGHT-dp2px("40dp")*(#views+1))
    item.tag = 2
    if #views~=0 then
      views[#views].Text=""
    end
    table.insert(views,item)
    if class.win() then
      return true
    end
  end


  class.c2a=function(item)
    table.remove(views,table.find(views,item))
    if #views~=0 then
      views[#views].Text="first"
    end
  end

  class.c2c=function(item)
    item.setX(((SCREEN_WIDTH*5)/6)-item.getWidth()/2)
    item.setY(SCREEN_HEIGHT-dp2px("40dp")*(#views))
  end

  class.b2c=function(item)
    if #views~=0 then
      if item.getWidth() >= views[#views].getWidth() then
        BQ.b2b(item)
        return true
      end
    end
    item.setX(((SCREEN_WIDTH*5)/6)-item.getWidth()/2)
    item.setY(SCREEN_HEIGHT-dp2px("40dp")*(#views+1))
    item.tag = 2
    if #views~=0 then
      views[#views].Text=""
    end
    table.insert(views,item)
    if class.win() then
      return true
    end
  end

  class.c2b=function(item)
    if BQ.c2b(item) then
      return
    end
    table.remove(views,table.find(views,item))
    if #views~=0 then
      views[#views].Text="first"
    end
  end

  class.win=function()

    if #views==AQ.AINDEX then

      dialog=AlertDialog.Builder(this)
      .setTitle("Win")
      .setMessage("你赢了")
      .setPositiveButton("下一关",{onClick=function(v)
          activity.finish()
          activity.newActivity("main",{AINDEX+1})
          activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
        end})
      .setNeutralButton("退出游戏",{onClick=function(v)
          activity.finish()
        end})
      .show()
      dialog.setCanceledOnTouchOutside(false);
      dialog.create()

      return true

    end

  end

  return class
end





AQ = A(AINDEX)
BQ = B()
CQ = C()





mFrameLayout.addView(loadlayout({
  Button,
  text="下一关",
  onClick=function()
    activity.finish()
    activity.newActivity("main",{AINDEX+1})
    activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
  end
}))


mFrameLayout.addView(loadlayout({
  Button,
  text="游戏规则",
  x="100dp",
  onClick=function()
    dialog=AlertDialog.Builder(this)
    .setTitle("游戏规则")
    .setMessage([[你要将所有的盒子从TOWER 1移动到TOWER 3,你每次只能移动一个盒子。游戏最重要的规则是大的盒子不能放在小的盒子上面]])
    .setPositiveButton("确定",nil)
    .show()
    dialog.setCanceledOnTouchOutside(false)
    dialog.create()
  end
}))








