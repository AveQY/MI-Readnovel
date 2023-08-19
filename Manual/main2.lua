require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

--功能
import 'function'


颜色1="#555555"--文字
颜色2="0x69E7EBEC"
颜色3="0xffffffff"

result = 0
resourceId = this.getResources().getIdentifier("status_bar_height", "dimen", "android");
if resourceId > 0 then
  result = this.getResources().getDimensionPixelSize(resourceId);
end

content2={
  LinearLayout;
  orientation="vertical";
  layout_height="match_parent";
  layout_width="match_parent";
  {
    CardView;
    CardElevation="3dp";
    layout_width="match_parent";
    backgroundColor="#FFFFFFFF";
    radius="0dp";
    layout_height="wrap_content";
    {
      LinearLayout;
      layout_width="match_parent";
      layout_marginTop=result;
      {
        LinearLayout;
        orientation="horizontal";
        layout_height="56dp";
        gravity="center";
        layout_width="match_parent";
        {
          LinearLayout;
          gravity="center";
          layout_height="match_parent";
          {
            CardView;
            PreventCornerOverlap=false;
            CardElevation="0dp";
            background="#00000000";
            layout_width="80dp";
            UseCompatPadding=false;
            radius="40dp";
            layout_marginLeft="-15dp";
            layout_height="80dp";
            {
              ImageView;
              id="main2_btn";
              background="#00000000";
              layout_width="match_parent";
              padding="38dp";
              src="icon/finish.png";
              layout_margin="-10dp";
              layout_height="match_parent";
            };
          };
        };
        {
          LinearLayout;
          orientation="vertical";
          layout_height="match_parent";
          layout_width="47%w";
          {
            TextView;
            layout_weight="1";
            textSize="19dp";
            layout_width="match_parent";
            layout_height="match_parent";
            textColor="#ff303030";
            gravity="center|left";
            id="main2_title";
            ellipsize="end";
            singleLine=true;
            text="訫-笔记";
          };
        };
        {
          CardView;
          PreventCornerOverlap=false;
          CardElevation="0dp";
          background="#00000000";
          layout_width="65dp";
          layout_marginRight="-17dp";
          UseCompatPadding=false;
          radius="33dp";
          layout_height="65dp";
          {
            ImageView;
            id="main2_btn2";
            background="#00000000";
            layout_width="match_parent";
            padding="27dp";
            src="icon/03.png";
            layout_margin="-10dp";
            layout_height="match_parent";
          };
        };
        {
          CardView;
          PreventCornerOverlap=false;
          CardElevation="0dp";
          background="#00000000";
          layout_width="65dp";
          layout_marginRight="-10dp";
          UseCompatPadding=false;
          radius="33dp";
          layout_height="65dp";
          {
            TextView;
            id="menu";
            layout_width="0dp";
            layout_marginTop="50dp";
            layout_marginLeft="-145dp";
            layout_height="0dp";
          };
          {
            ImageView;
            id="main2_btn4";
            background="#00000000";
            layout_width="match_parent";
            padding="27dp";
            src="icon/Other.png";
            layout_margin="-10dp";
            layout_height="match_parent";
          };
        };
      };
    };
  };
  {
    LinearLayout;
    gravity="center";
    orientation="vertical";
    layout_width="match_parent";
    background="#FFFFFfff";
    layout_height="match_parent";
    {
      LuaEditor;
      id="editor";
      layout_width="fill";
      layout_height="fill";
    };

  };
};
items2={
  LinearLayout;
  layout_width="match_parent";
  layout_height="match_parent";
  orientation="vertical";
  {
    LinearLayout;
    gravity="center";
    layout_width="match_parent";
    layout_height="60dp";
    layout_margin="-6dp";
    orientation="horizontal";
    {
      ImageView;
      layout_height="44dp";
      id="src";
      padding="10dp";
      layout_width="44dp";
      layout_marginLeft="10dp";
      ColorFilter="0xFFFFFFFF";
    };
    {
      TextView;
      id="title";
      layout_marginLeft="20dp";
      layout_width="match_parent";
      textColor="#000000";
    };
  };
};


layout={DrawerLayout,id="mDrawer2"}
activity.setTheme(R.Theme_Teal)
activity.setTitle("訫-笔记")
activity.ActionBar.hide()
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
table.insert(layout,content2)
table.insert(layout,drawer2)
activity.setContentView(loadlayout(layout))



笔记名称=...
main2_title.setText(笔记名称)

--直接到这里修改保存路径
主要路径='/storage/emulated/0/米环看小说/笔记'

--by訫念是你
--b站UID:2036485750

editor.Text=io.open(tostring(主要路径.."/"..笔记名称)):read("*a")

function 保存()
  写入文件(主要路径.."/"..笔记名称,editor.Text)
end

RippleHelper(main2_btn).RippleColor=0x25000000
RippleHelper(main2_btn2).RippleColor=0x25000000
RippleHelper(main2_btn4).RippleColor=0x25000000

function main2_btn.onClick()
  activity.finish()
end
function main2_btn2.onClick()
  editor.format()
end
pop=PopupMenu(activity,menu)
menu=pop.Menu
menu.add("保存笔记").onMenuItemClick=function(v)
  保存()
  editor.Text=io.open(tostring(主要路径.."/"..笔记名称)):read("*a")
  弹窗("已保存")
end
menu.add("标题重命名").onMenuItemClick=function(v)
  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    {
      TextView;
      id="Prompt",
      textSize="15sp",
      layout_marginTop="10dp";
      layout_marginLeft="3dp",
      layout_width="80%w";
      layout_gravity="center",
      text="标题：";
    };
    {
      EditText;
      hint="请输入";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="edit";
    };
  };

  AlertDialog.Builder(this)
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(v)
      写入文件(主要路径.."/"..edit.Text,editor.Text)
      os.remove(主要路径.."/"..笔记名称)
      activity.finish()
      Toast.makeText(activity,"刷新试试", Toast.LENGTH_LONG).show()
    end})
  .setNegativeButton("取消",nil)
  .show()
  import "android.view.View$OnFocusChangeListener"
  edit.setOnFocusChangeListener(OnFocusChangeListener{
    onFocusChange=function(v,hasFocus)
      if hasFocus then
        Prompt.setTextColor(0xFD009688)
      end
    end})
end
main2_btn4.onClick=function()
  pop.show()
end

