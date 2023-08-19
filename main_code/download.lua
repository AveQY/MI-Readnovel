require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

主路径="/sdcard/米环看小说/"

a=io.open("/sdcard/米环看小说/download.log")
if a==nil then
  io.open("/sdcard/米环看小说/download.log","w"):write("小说"):close()
 else
  获取路径=io.open("/sdcard/米环看小说/download.log"):read("*a")
end

activity.setTheme(R.Theme_Teal)
download_lay={
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
        layout_marginLeft="15dp";
        {
          LinearLayout;
          layout_height="match_parent";
          layout_width="80%w";
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
            layout_marginLeft="15dp";
            text="下载管理";
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
            layout_marginLeft="15dp";
            text="/storage/emulated/0/米环看小说/"..获取路径;
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
    LinearLayout;
    gravity="center";
    layout_height="fill";
    layout_width="fill";
    backgroundColor=0xffffffff;
    {
      TextView;
      textColor="#757575";
      textSize="19dp";
      layout_height="match_parent";
      layout_width="match_parent";
      id="text_";
      gravity="center";
      singleLine=true;
      text="这里空空的~";
    };
    {
      ListView;
      id="下载列表";
      DividerHeight=0;
      verticalScrollBarEnabled=false;
      layout_gravity="end";
      layout_width="fill";
    };
  },
};
activity.setContentView(loadlayout(download_lay))
activity.ActionBar.hide()
状态栏()

item={
  LinearLayout;
  gravity="center";
  layout_width="fill";
  layout_height="fill";
  {
    LinearLayout;
    orientation="vertical";
    gravity="center";
    layout_width="fill";
    layout_height="70dp";
    {
      CardView;
      radius=20;
      CardElevation=5;
      layout_width="80%w";
      layout_height="60dp";
      BackgroundColor="0xffffffff",
      {
        LinearLayout;
        layout_width="match_parent";
        layout_height="match_parent";
        {
          TextView;
          layout_marginLeft="15dp";
          layout_width="match_parent";
          layout_height="match_parent";
          gravity="center|left";
          id="备份文件名";
          textSize="18sp";
          text="小说名称";
        };
      };
    };
  };
};

function GetFilelastTime(path)
  f = File(path);
  cal = Calendar.getInstance();
  time = f.lastModified()
  cal.setTimeInMillis(time);
  return cal.getTime().toLocaleString()
end
function 刷新()
  sdata={}
  asdp=LuaAdapter(activity,sdata,item)
  下载列表.Adapter=asdp
  local a=luajava.astable(File("/storage/emulated/0/米环看小说/"..获取路径).listFiles())
  if a[1]==nil then
    下载列表.setVisibility(View.GONE)
   else
    text_.setVisibility(View.GONE)
    for i=1,#a do
      if File("/storage/emulated/0/米环看小说/"..获取路径.."/"..a[i].name).isFile() then
        asdp.add{备份文件名=a[i].name}
      end
    end
  end
end
刷新()
function 下载列表.onItemClick(l,v,p,i)
  bt=v.tag.备份文件名.Text
  确认事件='os.remove("/storage/emulated/0/米环看小说/'..获取路径..'/"..bt) 提示("删除成功") activity.finish()'
  取消事件='xxx.dismiss()'
  弹窗UI("提示","确定删除小说："..bt,确认事件,取消事件,"取消","删除",高度)
end


pop=PopupMenu(activity,menu)
menu=pop.Menu
menu.add("小说").onMenuItemClick=function(v)
  if File(主路径.."小说").isDirectory() then
   else
    File(主路径.."小说/").mkdirs()
  end
  io.open("/sdcard/米环看小说/download.log","w"):write("小说"):close()
  activity.recreate()
end
menu.add("固件").onMenuItemClick=function(v)
  if File(主路径.."固件").isDirectory() then
   else
    File(主路径.."固件/").mkdirs()
  end
  io.open("/sdcard/米环看小说/download.log","w"):write("固件"):close()
  activity.recreate()
end
menu.add("资源包").onMenuItemClick=function(v)
  if File(主路径.."资源包").isDirectory() then
   else
    File(主路径.."资源包/").mkdirs()
  end
  io.open("/sdcard/米环看小说/download.log","w"):write("资源包"):close()
  activity.recreate()
end
menu.add("字体").onMenuItemClick=function(v)
  if File(主路径.."字体").isDirectory() then
   else
    File(主路径.."字体/").mkdirs()
  end
  io.open("/sdcard/米环看小说/download.log","w"):write("字体"):close()
  activity.recreate()
end
menu.add("工具").onMenuItemClick=function(v)
  if File(主路径.."工具").isDirectory() then
   else
    File(主路径.."工具/").mkdirs()
  end
  io.open("/sdcard/米环看小说/download.log","w"):write("工具"):close()
  activity.recreate()
end
img2.onClick=function()
  pop.show()
end
