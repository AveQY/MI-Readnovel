require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

--导入功能
compile "libs/android-support-v4"
import "android.support.v4.widget.*"
import 'function'

activity.setTheme(R.Theme_Black)
activity.setTitle("訫-笔记")
activity.ActionBar.hide()
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
result = 0
resourceId = this.getResources().getIdentifier("status_bar_height", "dimen", "android");
if resourceId > 0 then
  result = this.getResources().getDimensionPixelSize(resourceId);
end

--直接到这里修改保存路径
主要路径='/storage/emulated/0/米环看小说/笔记'

if File(主要路径.."/").isDirectory() then
 else
  File(主要路径.."/").mkdirs()
end

--拿走留名by訫念是你
--QQ2049898109

颜色1="0xff555555"--文字
颜色2="0xFFFFFFFF"--卡片
颜色3="0xFFFFFFFF"--背景

layout={DrawerLayout,id="mDrawer2"}

content={
  LinearLayout;
  layout_height="match_parent";
  layout_width="match_parent";
  orientation="vertical";
  {
    CardView;
    backgroundColor=颜色3;
    CardElevation="3dp";
    layout_height="wrap_content";
    radius="0dp";
    layout_width="match_parent";
    {
      LinearLayout;
      layout_width="match_parent";
      layout_marginTop=result;
      {
        LinearLayout;
        orientation="horizontal";
        layout_height="56dp";
        layout_width="match_parent";
        gravity="center";
        {
          LinearLayout;
          layout_height="match_parent";
          gravity="center";
          {
            CardView;
            layout_width="80dp";
            layout_marginLeft="-15dp";
            CardElevation="0dp";
            radius="40dp";
            layout_height="80dp";
            UseCompatPadding=false;
            PreventCornerOverlap=false;
            background="#00000000";
            {
              ImageView;
              padding="32dp";
              layout_width="match_parent";
              src="Manual/icon.png";
              layout_height="match_parent";
              layout_margin="-10dp";
              id="btn";
              background="#00000000";
            };
          };
        };
        {
          TextView;
          ellipsize="end";
          layout_width="match_parent";
          id="title";
          textSize="19dp";
          textColor=颜色1,
          layout_marginLeft="-15dp";
          singleLine=true;
          gravity="center|left";
          layout_height="match_parent";
          layout_weight="1";
          text="訫-笔记";
        };

        {
          CardView;
          layout_width="65dp";
          radius="33dp";
          CardElevation="0dp";
          layout_marginRight="-10dp";
          layout_height="65dp";
          UseCompatPadding=false;
          PreventCornerOverlap=false;
          background="#00000000";
          {
            TextView;
            layout_marginLeft="-150dp";
            layout_width="0dp";
            layout_marginTop="60dp";
            backgroundColor="#7BC8A5";
            layout_height="0dp";
            id="menu";
          };
          {
            ImageView;
            padding="27dp";
            layout_width="match_parent";
            src="icon/Add.png";
            layout_height="match_parent";
            layout_margin="-10dp";
            id="btn2";
            background="#00000000";
          };
        };

        {
          CardView;
          layout_width="65dp";
          radius="33dp";
          CardElevation="0dp";
          layout_marginRight="-10dp";
          layout_height="65dp";
          UseCompatPadding=false;
          PreventCornerOverlap=false;
          background="#00000000";
          {
            TextView;
            layout_marginLeft="-150dp";
            layout_width="0dp";
            layout_marginTop="60dp";
            backgroundColor="#7BC8A5";
            layout_height="0dp";
            id="menu";
          };
          {
            ImageView;
            padding="27dp";
            layout_width="match_parent";
            src="icon/Other.png";
            layout_height="match_parent";
            layout_margin="-10dp";
            id="btn3";
            background="#00000000";
          };
        };
      };
    };
  };
  {
    LinearLayout;
    layout_height="match_parent";
    layout_width="match_parent";
    orientation="vertical";
    {
      SwipeRefreshLayout;
      id="sx";
      {
        LinearLayout;
        orientation="vertical";
        layout_width="match_parent";
        gravity="center";
        layout_height="match_parent";
        backgroundColor=颜色3;
        {
          TextView;
          id="M_text";
          text="你还没有添加笔记，这里空空的~";
          textSize="16sp";
          textColor=颜色1,
        };
        {
          LinearLayout;
          orientation="vertical";
          layout_width="fill";
          layout_height="fill";
          id="M_lay";
          {
            LinearLayout;
            gravity="center";
            layout_height="fill";
            layout_width="fill";
            backgroundColor=颜色3;
            {
              ListView;
              id="笔记列表";
              DividerHeight=0;
              verticalScrollBarEnabled=false;
              layout_gravity="end";
              layout_width="fill";
            };
          },
        },
      };
    };
  };
};
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
    layout_height="100dp";
    {
      CardView;
      layout_margin='10dp';
      layout_gravity='center';
      Elevation='1dp';
      layout_width='95%w';
      layout_height='85dp';
      radius='8dp';
      CardBackgroundColor=颜色3;
      {
        LinearLayout;
        Orientation='horizontal';
        layout_gravity='right';
        layout_width='match_parent';
        layout_height='match_parent';
        {
          LinearLayout;
          Orientation='vertical';
          layout_gravity='right';
          layout_width='match_parent';
          layout_height='match_parent';
          layout_margin="10dp";
          {
            LinearLayout;
            layout_width='match_parent';
            layout_height='5%h';
            {
              TextView;
              layout_marginTop='2%h';
              layout_width='match_parent';
              layout_height='match_parent';
              Gravity='left|center';
              textColor=颜色1,
              text='笔记';
              id="笔记文件名";
              textSize='16sp';
            };
          };
          {
            LinearLayout;
            layout_width='match_parent';
            layout_height='6.1%h';
            {
              TextView;
              layout_width='match_parent';
              layout_height='match_parent';
              Gravity='left';
              textColor='#69000000';
              text='内容';
              textSize='11sp';
              id="笔记内容";
              MaxLines=2;
            };
          };
        };
      };
    };
  };
};
item2={
  LinearLayout;
  gravity="center";
  layout_width="fill";
  layout_height="fill";
  {
    LinearLayout;
    orientation="vertical";
    gravity="center";
    layout_width="fill";
    layout_height="90dp";
    {
      CardView;
      layout_margin='10dp';
      layout_gravity='center';
      Elevation='1dp';
      layout_width='95%w';
      layout_height='80dp';
      radius='8dp';
      CardBackgroundColor=颜色3;
      {
        LinearLayout;
        Orientation='horizontal';
        Gravity='left|center';
        layout_width='match_parent';
        layout_height='match_parent';
        {
          LinearLayout;
          Orientation='vertical';
          layout_gravity='right';
          layout_width='65%w';
          layout_height='match_parent';
          layout_margin="10dp";
          {
            LinearLayout;
            layout_width='match_parent';
            layout_height='5%h';
            {
              TextView;
              layout_marginTop='2%h';
              layout_width='match_parent';
              layout_height='match_parent';
              Gravity='left|center';
              textColor=颜色1,
              text='笔记';
              id="源码文件名";
              textSize='16sp';
            };
          };
          {
            LinearLayout;
            layout_width='match_parent';
            layout_height='6.1%h';
            {
              TextView;
              layout_width='match_parent';
              layout_height='match_parent';
              Gravity='left';
              textColor='#69000000';
              text='内容';
              textSize='11sp';
              id="源码内容";
              MaxLines=2;
            };
          };
        };
        {
          Button;
          id="下载";
          text="下载";
          layout_marginLeft='5%w';
          layout_width='15%w';
          layout_height='4%h';
          gravity="center";
          textSize="12sp";
          BackgroundColor="#ffffffff",
        };
      };
    };
  };
};
table.insert(layout,content)

activity.setContentView(loadlayout(layout))

title.getPaint().setFakeBoldText(true)

RippleHelper(btn2).RippleColor=0x25000000
RippleHelper(btn3).RippleColor=0x25000000

function GetFilelastTime(path)
  f = File(path);
  cal = Calendar.getInstance();
  time = f.lastModified()
  cal.setTimeInMillis(time);
  return cal.getTime().toLocaleString()
end
local function 刷新笔记()
  sdata={}
  asdp=LuaAdapter(activity,sdata,item)
  笔记列表.Adapter=asdp
  if File(主要路径.."/").isDirectory() then
   else
    File(主要路径.."/").mkdirs()
  end
  local a=luajava.astable(File(主要路径).listFiles())
  if a[1]==nil then
    控件消失(M_lay)
    显示控件(M_text)
   else
    控件消失(M_text)
    显示控件(M_lay)
    for i=1,#a do
      if File(主要路径.."/"..a[i].name).isFile() then
        asdp.add{笔记文件名=a[i].name,笔记内容=io.open(主要路径.."/"..a[i].name):read("*a")}
      end
    end
  end
end
刷新笔记()
pop=PopupMenu(activity,menu)
menu=pop.Menu
menu.add("清空笔记").onMenuItemClick=function(v)
  内容=[[确定清空所有笔记？]]
  确认事件=[[os.execute("rm -r "..主要路径.."/")
  xxx.dismiss()
  弹窗("已清空")
  刷新笔记()]]
  取消事件=[[xxx.dismiss()]]
  弹窗UI("提示",内容,确认事件,取消事件,"取消","清空")
end

btn2.onClick=function()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      TextView;
      layout_width="match_parent";
      layout_height="30dp";
      text="标题:";
      layout_marginTop="10dp";
    };
    {
      EditText;
      id="title",
      layout_width="80%w";
      layout_gravity="center";
      MaxLines=5;
      singleLine=true;--设置单行输入
    };
    {
      TextView;
      layout_width="match_parent";
      layout_height="30dp";
      text="内容:";
      layout_marginTop="5dp";
    };
    {
      EditText;
      id="text",
      layout_width="80%w";
      layout_gravity="center";
      MaxLines=5;
    };
  };
  dialog=AlertDialog.Builder(this)
  .setTitle("添加笔记")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      io.open(主要路径.."/"..title.Text,"w"):write(text.Text):close()
      刷新笔记()
      弹窗("创建成功")
    end})
  .setNegativeButton("取消",nil)
  .show()
  dialog.create()
  dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFF289D73)
  dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(0xFF000000)
  Drawable_round(dialog.getWindow(),0xFFffffff)
end
btn3.onClick=function()
  pop.show()
end


function 笔记列表.onItemClick(l,v,p,i)
  local bj=v.tag.笔记文件名.text
  activity.newActivity("Manual/main2",{bj})
end
function 笔记列表.onItemLongClick(l,v,p,i)
  bj=v.tag.笔记文件名.text
  内容=io.open(主要路径.."/"..bj):read("*a")
  确认事件='os.remove(主要路径.."/"..bj)'..[[
  xxx.dismiss()
  弹窗("删除成功")
  刷新笔记()
  ]]
  取消事件=[[xxx.dismiss()]]
  弹窗UI("删除笔记","是否删除笔记："..bj.."\n\n"..内容,确认事件,取消事件,"取消","确定")
  return true
end
sx.setColorSchemeColors({颜色1});
sx.setProgressBackgroundColorSchemeColor(0xFFFFFFFF);
sx.setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener{onRefresh=function()
    刷新笔记()
    sx.setRefreshing(false);
  end})

