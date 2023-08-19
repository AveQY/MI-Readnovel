require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

activity.setTheme(R.AndLua18)
activity.setTitle("手速大比拼")
--隐藏标题栏
activity.ActionBar.hide()
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

function 提示(内容)
  Toast.makeText(activity,内容, Toast.LENGTH_LONG).show()
end

layout={
  LinearLayout;
  layout_width="fill";
  gravity="right";
  orientation="vertical";
  layout_height="fill";
  {
    LinearLayout;
    layout_weight="1";
    gravity="center";
    layout_width="-1";
    orientation="horizontal";
    layout_height="-1";
    {
      LinearLayout;
      layout_weight="1";
      gravity="bottom";
      orientation="vertical";
      layout_height="-1";
      {
        TextView;
        id="人机";
        gravity="center";
        layout_gravity="center";
        text=[==[
●
↙↘
┃┃
↙↘
人工智能]==];
      };
    };
    {
      LinearLayout;
      layout_weight="1";
      gravity="bottom";
      orientation="vertical";
      layout_height="-1";
      {
        TextView;
        id="玩家";
        text=[==[
●
↙↘
┃┃
↙↘
玩家]==];
        layout_gravity="center";
        gravity="center";
      };
    };
  };
  {
    Button;
    text="加速";
    id="a";
  };
};
activity.setContentView(loadlayout(layout))

a.onClick=function
  玩家.setY(玩家.getY()-10-math.random(1,20))
  if(tointeger(玩家.getY())<40)
    提示("你赢了")
   elseif(人机.getY()<玩家.getY()&&人机.getY()<40)
    提示("真垃圾，连人机都打不过，来自人机的嘲讽😒")
  end
end




function 激活()
  刷新c()
end
function 刷新c()
  人机.setY(人机.getY()-10-math.random(1,20))
  if(tointeger(玩家.getY())<40)
    提示("你赢了")
   elseif(人机.getY()<玩家.getY()&&人机.getY()<40)
    提示("真垃圾，连人机都打不过，来自人机的嘲讽😒")
  end
end
function 刷新b()
  require "import"
  while true do--执行循环命令
    Thread.sleep(150)--延迟执行
    call("激活")
  end
end
thread(刷新b)