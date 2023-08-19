require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

activity.setTheme(R.Theme_Teal)

layout={
  LinearLayout;
  gravity="center|top";
  orientation="vertical";
  {
    CardView;
    layout_width="200dp";
    radius="23dp";
    layout_height="200dp";
    layout_marginTop="100dp";
    {
      LinearLayout;
      orientation="vertical";
      layout_width="fill";
      layout_height="fill";
      {
        VideoView;
        layout_width="wrap";
        id="vi";
        layout_height="fill";
      };
    };

  };
  {
    CardView;
    radius="23dp";
    layout_marginTop="10dp";
    id="file";
    layout_width="200dp";
    layout_height="40dp";
    {
      TextView;
      gravity="center";
      layout_width="match_parent";
      layout_height="match_parent";
      text="选择动态视频";
    };
  };
  {
    CardView;
    radius="23dp";
    layout_marginTop="10dp";
    id="open";
    layout_width="200dp";
    layout_height="40dp";
    {
      TextView;
      gravity="center";
      layout_width="match_parent";
      layout_height="match_parent";
      text="打开QQ";
      id="close",
    };
  };
  {
    LinearLayout;
    layout_width="fill";
    orientation="vertical";
    layout_height="fill";
    gravity="center";
    {
      TextView;
      text=[==[
请选择mp4格式的文件

然后点击<打开QQ>注：必须点击

在更换头像时选择拍摄

选择头像第一帧时点击替换即可
]==];
      textColor="0xFF757575";
      layout_height="fill";
      textSize="14sp";
      layout_width="60%w";
      Gravity="center|left|top";
      layout_marginTop="10dp";
    };
  };
};
activity.setContentView(loadlayout(layout))
--隐藏标题栏
activity.ActionBar.hide()
状态栏()

Box={
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
  {
    LinearLayout;
    orientation="horizontal";
    layout_height="fill";
    layout_width="fill";
    {
      CardView;
      background="#aaFFADC5";
      radius="18dp";
      id="替换";
      layout_width="70dp";
      layout_height="40dp";
      {
        TextView;
        textSize="15sp";
        layout_width="-1";
        text="替换";
        layout_gravity="center";
        textColor="0xFFFFFFFF";
        id="显示隐藏";
        gravity="center";
        layout_height="-1";
      };
    };
  };
};




file.onClick=function()
  调用系统选择文件(function (a)
    vi.setVideoPath(a)
    vi.start()
    路径=a
  end)
end

open.onClick=function()
  if 路径==nil then
    Toast.makeText(activity,"请选择文件", Toast.LENGTH_LONG).show()
   else
    开启()
    packageName="com.tencent.mobileqq"
    import "android.content.Intent"
    import "android.content.pm.PackageManager"
    manager = activity.getPackageManager()
    open = manager.getLaunchIntentForPackage(packageName)
    this.startActivity(open)
  end
end

import "android.content.Context"
窗口 = activity.getSystemService(Context.WINDOW_SERVICE)
win = WindowManager.LayoutParams()
if Build.VERSION.SDK_INT >= 26 then
  win.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY--悬浮窗打开方式
 else
  win.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
end

win.flags = WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
win.gravity = Gravity.CENTER | Gravity.TOP
win.format = 1
win.width = WindowManager.LayoutParams.WRAP_CONTENT
win.height = WindowManager.LayoutParams.WRAP_CONTENT
移动悬浮 = loadlayout(Box)
local 坐标={x=2,y=2}


Mp=false
替换.onClick=function()
  路径2="/storage/emulated/0/Android/data/com.tencent.mobileqq/cache/qqvideo/output"
  local a=luajava.astable(File(路径2).listFiles())
  if a[1]==nil then
   else
    for i=1,#a do
      if File(路径2.."/"..a[i].name).isFile() then
        文件=a[i].name
        LuaUtil.copyDir(路径,路径2.."/"..文件)
      end
    end
  end
  Toast.makeText(activity,"执行完毕", Toast.LENGTH_LONG).show()
end


Ma=false
function 开启()
  if(Ma==false)then
    窗口.addView(移动悬浮,win)
    Ma=true
    close.setText("关闭")
   else
    窗口.removeView(移动悬浮)
    Ma=false
    close.setText("打开QQ")
  end
end
