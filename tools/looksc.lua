require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"
import "java.io.File"

activity.setTheme(R.AndLua18)
activity.setTitle("QQ闪照")
layout={
  LinearLayout;
  layout_height="match_parent";
  layout_width="match_parent";
  orientation="vertical";
  {
    CardView;
    backgroundColor="0xFFFFFFFF";
    CardElevation="0dp";
    radius="0dp";
    layout_height="wrap";
    layout_width="match_parent";
    {
      LinearLayout;
      layout_width="match_parent";
      layout_marginTop="30dp";
      {
        LinearLayout;
        gravity="center";
        layout_height="8%h";
        layout_width="match_parent";
        orientation="horizontal";
        layout_marginLeft="10dp";
        {
          CardView;
          layout_width="58dp";
          radius="33dp";
          CardElevation="0dp";
          layout_height="58dp";
          UseCompatPadding=false;
          PreventCornerOverlap=false;
          background="#00000000";
          {
            ImageView;
            padding="27dp";
            layout_width="match_parent";
            src="icon/finish.png";
            layout_height="match_parent";
            layout_margin="-10dp";
            id="img_";
            background="#00000000";
          };
        };
        {
          LinearLayout;
          layout_height="match_parent";
          layout_width="73%w";
          orientation="vertical";
          {
            TextView;
            textColor="#757575";
            textSize="23dp";
            layout_height="20dp";
            layout_width="match_parent";
            id="title";
            gravity="center|left";
            layout_weight="1";
            singleLine=true;
            text="QQ闪照";
          };
          {
            TextView;
            textColor="#a5a5a5";
            textSize="13dp";
            layout_height="10dp";
            layout_width="match_parent";
            id="yiyan";
            gravity="center|left";
            layout_weight="1";
            singleLine=true;
            text="";
          };
        };
        {
          CardView;
          layout_width="58dp";
          radius="33dp";
          CardElevation="0dp";
          layout_height="58dp";
          UseCompatPadding=false;
          PreventCornerOverlap=false;
          background="#00000000";
          {
            TextView;
            layout_marginLeft="-150dp";
            layout_width="0dp";
            layout_marginTop="60dp";
            backgroundColor="0xffffffff";
            layout_height="0dp";
            id="menu";
            textColor="#757575";
          };
          {
            ImageView;
            padding="27dp";
            layout_width="match_parent";
            src="icon/Other.png";
            layout_height="match_parent";
            layout_margin="-10dp";
            id="img2";
            background="#00000000";
          };
        };
      };
    };
  };
  {
    GridView;
    id="列表";
    numColumns=2;
  };
};
activity.setContentView(loadlayout(layout))
状态栏()
--隐藏标题栏
activity.ActionBar.hide()
设置一言()
img_.onClick=function()
  activity.finish()
end


布局={
  LinearLayout;
  layout_width="-1";
  orientation="vertical";
  padding="5dp";
  layout_height="-2";
  {
    CardView;
    id="保存";
    radius="10dp";
    layout_width="45%w";
    layout_height="180dp";
    layout_gravity="center";
    elevation="0dp";
    {
      ImageView;
      layout_width="fill";
      id="图片";
      --scaleType="fitXY";
      layout_height="fill";
      src="",
    };
    {
      TextView,
      id='文件路径',
      layout_width="0dp";
    },
  };
};

data={}
adp=LuaAdapter(activity,data,布局)
列表.Adapter=adp


主路径="/storage/emulated/0/Android/data/com.tencent.mobileqq/Tencent/MobileQQ/chatpic/chatimg/"

if File(主路径).isDirectory() then
 else
  File(主路径).mkdirs()
end

local a=luajava.astable(File(主路径).listFiles())
if a[1]==nil then
  Toast.makeText(activity,"未发现闪照", Toast.LENGTH_LONG).show()
 else
  --Toast.makeText(activity,"发现"..#a.."张闪现", Toast.LENGTH_LONG).show()
  for i=1,#a do
    目录名=a[i].name
    local b=luajava.astable(File(主路径..目录名.."/").listFiles())
    if b[1]==nil then
      os.execute("rm -rf "..主路径..目录名)
     else
      文件名=b[1].name
      完整文件路径=主路径..目录名.."/"..文件名
      adp.add({图片={src=完整文件路径},文件路径={text=完整文件路径}})
    end
  end
end

pop=PopupMenu(activity,menu)
menu=pop.Menu
menu.add("清空所有闪照").onMenuItemClick=function(v)
  os.execute("rm -rf "..主路径)
  activity.recreate()--重构activity
end
img2.onClick=function()
  pop.show()
end


function 列表.onItemClick(l,v,p,i)
  bt=v.tag.文件路径.Text
  LuaUtil.copyDir(bt,"/storage/emulated/0/DCIM/Camera/"..os.time()..".png")
  Toast.makeText(activity,"已保存至系统相册", Toast.LENGTH_LONG).show()
end

--[[
by訫念是你
B站UID:2036485750
]]