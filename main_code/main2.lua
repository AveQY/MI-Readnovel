require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

activity.setTheme(R.Theme_Teal)

function 匹配中文(s)
  local ss = {}
  for k = 1, #s do
    local c = string.byte(s,k)
    if not c then break end
    if (c>=48 and c<=57) or (c>= 65 and c<=90) or (c>=97 and c<=122) then
      if not string.char(c):find("%w") then
        table.insert(ss, string.char(c))
      end
     elseif c>=228 and c<=233 then
      local c1 = string.byte(s,k+1)
      local c2 = string.byte(s,k+2)
      if c1 and c2 then
        local a1,a2,a3,a4 = 128,191,128,191
        if c == 228 then a1 = 184
         elseif c == 233 then a2,a4 = 190,c1 ~= 190 and 191 or 165
        end
        if c1>=a1 and c1<=a2 and c2>=a3 and c2<=a4 then
          k = k + 2
          table.insert(ss, string.char(c,c1,c2))
        end
      end
    end
  end
  return table.concat(ss)
end
print(...)
import "java.io.File"
name=File(...).getName()
read=io.open(...):read("*a")
进度=io.open("/storage/emulated/0/米环看小说/a.txt"):read("*a")
texts=string.sub(read,进度,进度+900)

InputLayout={
  LinearLayout;
  layout_height="match_parent";
  layout_width="match_parent";
  orientation="vertical";
  {
    CardView;
    backgroundColor="#FFFFFFFF";
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
        layout_marginLeft="8dp";
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
            id="img";
            background="#00000000";
          };
        };
        {
          LinearLayout;
          layout_height="match_parent";
          layout_width="70%w";
          orientation="vertical";
          -- layout_marginLeft="5dp";
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
            text=name;
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
            backgroundColor="#ffffffff";
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
    TextView;
    id="Prompt",
    textSize="15sp",
    layout_marginTop="10dp";
    layout_marginLeft="3dp",
    layout_width="80%w";
    layout_gravity="center",
    text="即将发送小说的内容：";
  };
  {
    TextView;
    hint="小说内容";
    layout_marginTop="5dp";
    layout_width="80%w";
    layout_gravity="center",
    id="edit";
    text=texts;
  };
  {
    CardView;
    backgroundColor="#ffffff";
    layout_height="45dp";
    layout_width="match_parent";
    radius="10dp";
    layout_marginTop="15dp";
    id="c1",
    {
      LinearLayout;
      layout_width="match_parent";
      gravity="center";
      layout_height="match_parent";
      {
        TextView;
        textSize="15sp";
        gravity="center";
        layout_height="match_parent";
        layout_width="match_parent";
        text="发送";
        textColor="#000000";
      };
    };
  };
  {
    CardView;
    backgroundColor="#ffffff";
    layout_height="45dp";
    layout_width="match_parent";
    radius="10dp";
    layout_marginTop="15dp";
    id="c2",
    {
      LinearLayout;
      layout_width="match_parent";
      gravity="center";
      layout_height="match_parent";
      {
        TextView;
        textSize="15sp";
        gravity="center";
        layout_height="match_parent";
        layout_width="match_parent";
        text="上一部分";
        textColor="#000000";
      };
    };
  };
  {
    CardView;
    backgroundColor="#ffffff";
    layout_height="45dp";
    layout_width="match_parent";
    radius="10dp";
    layout_marginTop="15dp";
    id="c3",
    {
      LinearLayout;
      layout_width="match_parent";
      gravity="center";
      layout_height="match_parent";
      {
        TextView;
        textSize="15sp";
        gravity="center";
        layout_height="match_parent";
        layout_width="match_parent";
        text="重置记忆";
        textColor="#000000";
      };
    };
  };
};
activity.setContentView(loadlayout(InputLayout))
activity.ActionBar.hide()
状态栏()
设置一言()
img.onClick=function()
  ti.stop()
  activity.finish()
end

function 设置播放时间()
  import "android.graphics.Typeface"
  弹窗框架=
  {
    LinearLayout,
    orientation='vertical',
    layout_width='fill',
    layout_height='wrap',
    {
      CardView;
      layout_margin='8dp';
      layout_gravity='center';
      elevation='5dp';
      layout_width='90%w';
      layout_height='fill';
      CardBackgroundColor='#fffFFFFF';
      radius='10dp';
      {
        LinearLayout,
        gravity='center';
        orientation='vertical',
        layout_width='fill',
        layout_height='wrap',
        background='#00FFFFFF',
        {
          LinearLayout,
          layout_padding='10%';
          gravity='left|center';
          orientation='vertical',
          layout_width='fill',
          layout_height=高度,
          background='#ffffffff',
          {
            TextView;
            text='定时发送时间：';
            layout_marginLeft='18dp';
            layout_margin='8dp';
            textColor="#757575",
            id="时间",
            TextSize="9dp",
          };
          {
            SeekBar;
            layout_margin='8dp';
            layout_marginTop="0dp";
            id='time';
            layout_width='fill';
          },
        };
        {
          TextView,
          layout_width="fill",
          layout_height="2px",
          layout_gravity="center",
          backgroundColor="#ffbebebe",
        };
        {
          LinearLayout,
          orientation='horizontal',
          layout_width='fill',
          layout_height='13%w',
          background='#00FFFFFF',
          {
            LinearLayout,
            orientation='vertical',
            layout_width='45%w',
            layout_height='fill',
            background='#00FFFFFF',
            {
              TextView;
              gravity='center';
              layout_width='fill';
              layout_height='fill';
              textColor='#eb000000';
              text="关闭";
              textSize='16dp';
              id="取消"
            };
          };
          {
            TextView,--垂直分割线
            layout_width="2px",--布局宽度
            layout_height="fill",
            layout_gravity="center",
            backgroundColor="#ffbebebe",
          };
          {
            TextView,
            layout_width="0px",
            layout_height="fill",
            layout_gravity="center",
            backgroundColor="#ffbebebe",
          };
          {
            LinearLayout,
            orientation='vertical',
            layout_width='45%w',
            layout_height='fill',
            background='#00000000',
            {
              TextView;
              gravity='center';
              layout_width='fill';
              layout_height='fill';
              textColor='#FF147CE4';
              text="执行";
              textSize='16dp';
              id="确认"
            };
          };
        };
      };
    };
  };
  xxx=AlertDialog.Builder(this)
  xxx.setView(loadlayout(弹窗框架))
  xxx=xxx.show()
  import "android.graphics.drawable.ColorDrawable"
  xxx.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))

  time.setMax(9)
  if 时间间隔~=nil then
    time.setProgress(时间间隔-1)
    时间.Text=("间隔 "..时间间隔)
   else
    time.setProgress(3)
  end
  time.setOnSeekBarChangeListener{
    onProgressChanged=function()
      时间间隔=time.getProgress()+1
      时间.Text=("间隔 "..时间间隔)
    end,}

  确认.onClick=function()
    --间隔
    ti.Period=tointeger(时间间隔*1000)
    --开启定时器
    ti.start()
    xxx.dismiss()
    edit.setText([[已开启上课模式,关闭内容显示
提示：息屏自动关闭上课模式
屏幕常亮建议将屏幕亮度调到最低]])
  end;
  取消.onClick=function()
    --停止定时器
    ti.stop()
    xxx.dismiss()
  end;
  确认.foreground=波纹特效v2(0xFFCECECE)
  取消.foreground=波纹特效v2(0xFFCECECE)
end

匹配中文开关=false
function 设置匹配中文()
  if 匹配中文开关==false then
    function 下一部分()
      通知(edit.Text)
      maths=io.open("/storage/emulated/0/米环看小说/a.txt"):read("*a")
      maths_two=maths+900
      edit.setText(string.sub(read,maths,maths_two))
      io.open("/sdcard/米环看小说/a.txt","w"):write(maths_two):close()
    end
    function 上一部分()
      maths=io.open("/storage/emulated/0/米环看小说/a.txt"):read("*a")
      maths_two=maths
      maths_two=maths-900
      edit.setText(string.sub(read,maths_two,maths))
      io.open("/sdcard/米环看小说/a.txt","w"):write(maths_two):close()
    end
    function 下一部分_定时器()
      小说=string.sub(read,maths,maths_two)
      通知(小说)
      maths=io.open("/storage/emulated/0/米环看小说/a.txt"):read("*a")
      maths_two=maths+102
      io.open("/sdcard/米环看小说/a.txt","w"):write(maths_two):close()
    end
    function 重置()
      io.open("/sdcard/米环看小说/a.txt","w"):write("0"):close()
      内容=string.sub(read,0,900)
      edit.setText(内容)
      提示("已重置")
    end
   else
    function 下一部分()
      通知(edit.Text)
      maths=io.open("/storage/emulated/0/米环看小说/a.txt"):read("*a")
      maths_two=maths+900
      edit.setText(匹配中文(string.sub(read,maths,maths_two)))
      io.open("/sdcard/米环看小说/a.txt","w"):write(maths_two):close()
    end
    function 上一部分()
      maths=io.open("/storage/emulated/0/米环看小说/a.txt"):read("*a")
      maths_two=maths
      maths_two=maths-900
      edit.setText(匹配中文(string.sub(read,maths_two,maths)))
      io.open("/sdcard/米环看小说/a.txt","w"):write(maths_two):close()
    end
    function 下一部分_定时器()
      小说=匹配中文(string.sub(read,maths,maths_two))
      通知(小说)
      maths=io.open("/storage/emulated/0/米环看小说/a.txt"):read("*a")
      maths_two=maths+102
      io.open("/sdcard/米环看小说/a.txt","w"):write(maths_two):close()
    end
    function 重置()
      提示("已重置")
      io.open("/sdcard/米环看小说/a.txt","w"):write("0"):close()
      内容=匹配中文(string.sub(read,0,900))
      edit.setText(内容)
    end
  end
end
设置匹配中文()

pop=PopupMenu(activity,menu)
menu=pop.Menu
menu.add("上课模式").onMenuItemClick=function(v)
  设置播放时间()
end
menu.add("屏幕长亮").onMenuItemClick=function(v)
  this.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)--禁止系统息屏
  Toast.makeText(activity,"已开启,仅在此界面生效且下次仍需手动开启",Toast.LENGTH_LONG).show()
end
menu.add("匹配中文").onMenuItemClick=function(v)
  if 匹配中文开关==false then
    匹配中文开关=true
    Toast.makeText(activity,"已开启,再次操作关闭",Toast.LENGTH_LONG).show()
    设置匹配中文()
    编辑内容=edit.Text
    edit.setText(匹配中文(编辑内容))
   else
    匹配中文开关=false
    Toast.makeText(activity,"已关闭",Toast.LENGTH_LONG).show()
    设置匹配中文()
  end
end
img2.onClick=function()
  pop.show()
end

------------------功能区-----------------

c1.onClick=function()
  下一部分()
end
c2.onClick=function()
  上一部分()
end
c3.onClick=function()
  重置()
end


--定时器

ti=Ticker()
--执行的事件
ti.onTick=function()
  下一部分_定时器()
end

function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    ti.stop()
    activity.finish()
  end
end
