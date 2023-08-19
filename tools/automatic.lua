require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

activity.setTheme(R.Theme_Black)
layout={
  LinearLayout;
  gravity="center";
  orientation="vertical";
  {
    TextView;
    textColor="#757575";
    gravity="center";
    layout_width="match_parent";
    textSize="17sp";
    id="t1";
    layout_height="100dp";
    text="功能状态：未开启,点我获取无障碍权限";
  };
  {
    CardView;
    CardElevation="0dp";
    layout_width="200dp";
    backgroundColor="0xFF71AC9E";
    layout_height="54dp";
    radius="100dp";
    id="id1";
    {
      TextView;
      gravity="center";
      layout_width="match_parent";
      textSize="17sp";
      textColor="#ffffffff";
      layout_height="match_parent";
      text="抖音";
    };
  };
  {
    CardView;
    CardElevation="0dp";
    radius="100dp";
    layout_width="200dp";
    backgroundColor="0xFF71AC9E";
    layout_height="54dp";
    layout_marginTop="30dp";
    id="id2";
    {
      TextView;
      gravity="center";
      layout_width="match_parent";
      textSize="17sp";
      textColor="#ffffffff";
      layout_height="match_parent";
      text="抖音极速版";
    };
  };
  {
    CardView;
    CardElevation="0dp";
    radius="100dp";
    layout_width="200dp";
    backgroundColor="0xFF71AC9E";
    layout_height="54dp";
    id="id3";
    layout_marginTop="30dp";
    {
      TextView;
      gravity="center";
      layout_width="match_parent";
      textSize="17sp";
      textColor="#ffffffff";
      layout_height="match_parent";
      text="快手";
    };
  };
  {
    CardView;
    CardElevation="0dp";
    radius="100dp";
    layout_width="200dp";
    backgroundColor="0xFF71AC9E";
    layout_height="54dp";
    layout_marginTop="30dp";
    id="id4";
    {
      TextView;
      gravity="center";
      layout_width="match_parent";
      textSize="17sp";
      textColor="#ffffffff";
      layout_height="match_parent";
      text="快手极速版";
    };
  };

  {
    TextView;
    text='间隔:';
    layout_marginLeft='18dp';
    layout_margin='8dp';
    textColor='#757575',
    id="时间文本",
    TextSize="7dp",
  };
  {
    SeekBar;
    layout_margin='8dp';
    layout_marginTop="0dp";
    id='时间';
    layout_width='fill';
  },
};



activity.setContentView(loadlayout(layout))
--隐藏标题栏
activity.ActionBar.hide()
--沉浸状态栏
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
if Build.VERSION.SDK_INT >= 21 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);
end
if Build.VERSION.SDK_INT >= 19 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
end

import "android.content.Intent"
import "android.provider.Settings"
import "com.androlua.LuaAccessibilityService"
import "android.view.accessibility.AccessibilityEvent"


local access=LuaAccessibilityService.getInstance()
if not(access) then
 else
  t1.setText('功能状态：已开启,点我前往关闭无障碍')
end

t1.onClick=function()
  activity.startActivity(Intent().setAction(Settings.ACTION_ACCESSIBILITY_SETTINGS))
end

function 开启(名称)
  if t1.Text=='功能状态：已开启,点我前往关闭无障碍' then
    access.startApp(名称)
    x = activity.getWidth()
    y = activity.getHeight()
    ti=Ticker()
    ti.Period=时间.getProgress()*1000
    ti.onTick=function()
      access.findClick({"首页"})
    end
    ti.start()
   else
    Toast.makeText(activity,"请先获取无障碍权限", Toast.LENGTH_LONG).show()
  end
end

id1.onClick=function()
  开启("抖音")
end

id2.onClick=function()
  开启("抖音极速版")
end

id3.onClick=function()
  开启("快手")
end

id4.onClick=function()
  开启("快手极速版")
end


时间.setMax(60)
时间.setProgress(10)

时间.setOnSeekBarChangeListener{
  onProgressChanged=function()
    时间间隔=时间.getProgress()
    时间文本.setText("间隔："..时间间隔.."s")
  end,}