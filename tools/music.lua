require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"


activity.setTheme(R.Theme_Teal)
activity.setTitle("网抑云")
activity.ActionBar.hide()

import "android.widget.LinearLayout"
import "android.content.Intent"
import "android.widget.Button"
import "android.R$id"
import "android.widget.CardView"
import "com.nirenr.Color"
import "android.graphics.Color"
import "com.androlua.Http"
import "android.view.WindowManager"
import "android.app.DownloadManager"
import "android.view.Gravity"
import "android.animation.ObjectAnimator"
import "android.content.Context"
import "android.net.Uri"
import "android.widget.RelativeLayout"
import "android.widget.Toast"
import "android.widget.ImageView"
import "android.R$layout"
import "org.w3c.dom.Text"
import "android.app.AlertDialog"
import "com.androlua.LuaAdapter"
import "android.widget.EditText"
import "android.widget.ListView"
import "android.view.View"
import "android.widget.TextView"

--设置美化提示样式
---------------------------
function 美化提示(内容)
  toasts={
    LinearLayout;
    {
      CardView;
      layout_width="88%w";
      CardBackgroundColor="#7f000000";
      layout_height="60dp";
      layout_marginTop='6%w';--布局顶距
      radius="10dp";
      elevation="";
      id="美化窗口",
      {
        LinearLayout,
        orientation='horizontal',
        layout_width='fill',
        layout_height='fill',
        {
          CardView;
          layout_gravity="center|left";
          layout_width="40dp";
          CardBackgroundColor="#00ffffff";
          layout_height="40dp";
          radius="20dp";
          layout_marginLeft="20dp";
          elevation="";
          id="提示图片动画载体";
          {
            ImageView;--个人中心
            layout_gravity="center";
            layout_width="fill";
            layout_height="fill";
            scaleType="fitXY";
            --src="icon/icon_recent_sysmsg.png";
            src="https://pan.tenire.com/view.php/1a4aa2c5be8a274d8c897a3cbbd8d1dc.png";
          };
        };
        {
          TextView;
          textColor="#ffffffff";
          layout_gravity="center";
          textSize="13dp";
          layout_marginLeft="15dp";
          id="提醒文字";
        };
      };
    };
  };
  local toast=Toast.makeText(activity,"内容",Toast.LENGTH_LONG).setGravity(Gravity.TOP, 0, 0).setView(loadlayout(toasts))
  提醒文字.Text=tostring(内容)
  toast.show()
  提醒文字.getPaint().setFakeBoldText(true)
end

--设置弹出消息样式
----------------------------
function 弹出消息(文本)
  tcxx={
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    layout_height="fill",
    {
      CardView,
      layout_width="wrap",
      layout_height="wrap",
      CardBackgroundColor="#00000000",
      cardElevation="0dp",
      radius="19dp",
      {
        TextView,
        layout_width="wrap",
        layout_height="wrap",
        background="#cc000000",
        padding="8dp",
        textSize="15sp",
        TextColor="#ffeeeeee",
        gravity="center",
        id="wenzi",
      },
    },
  }
  local toast=Toast.makeText(activity,"文本",Toast.LENGTH_SHORT).setView(loadlayout(tcxx))
  toast.setGravity(Gravity.BOTTOM,0,200)
  wenzi.Text=tostring("  "..文本.."  ")
  toast.show()
end

--设置按钮动画
------------------------------
function 水珠动画(view,time)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(view,"scaleX",{1.2,.8,1.1,.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(view,"scaleY",{1.2,.8,1.1,.9,1}).setDuration(time).start()
end

--设置隐藏状态栏但不隐藏字体
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
--状态栏背景透明
activity.getWindow().setStatusBarColor(Color.TRANSPARENT);
--状态栏字体白
activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE);


--获取状态栏和导航栏高度
-----------------------------------------
function getStatusBarHeight()--函数
  local resources=activity.getResources();
  local resourceId=resources.getIdentifier("status_bar_height","dimen","android");
  local height=resources.getDimensionPixelSize(resourceId);
  return height;
end

--正文内容开始
--------------------
Tritium=
{
  LinearLayout;--线性控件
  orientation="vertical";--布局方向
  layout_height="fill";--布局宽度
  layout_width="fill";--布局宽度
  BackgroundColor="#FFFFFF";--背景颜色


  {
    CardView;--卡片控件
    layout_height=getStatusBarHeight();--设置卡片控件高度为状态栏高度
    backgroundColor=0xFFE32000;--卡片颜色
    radius="0dp";--卡片圆角
    CardElevation="0dp";--卡片阴影
    layout_width="match_parent";--卡片宽度
  };


  {
    CardView;
    layout_height="wrap_content";
    backgroundColor=0xFFE32000;
    radius="0dp";
    CardElevation="0dp";
    layout_width="match_parent";
    {
      LinearLayout;--线性布局
      orientation="horizontal";
      gravity="left";
      layout_height="17%w";
      layout_width="match_parent";

      {
        LinearLayout;--线性布局
        layout_height="match_parent";
        layout_width="13%w";--布局宽度
        gravity="left";
        {
          ImageView;
          layout_height="7%w";--图片高度
          layout_width="9%w";--图片宽度
          layout_marginLeft='3%w';--布局左距
          --layout_marginRight='10dp';--布局右距
          layout_gravity='center|left';--在父控件中的对齐方式
          background="#00000000";-- 图片背景颜色
          --src="icon/abc_ic_ab_back_mtrl_am_alpha.png";--图片路径
          src="https://pan.tenire.com/view.php/a1e93dfe9b48142162665102d4540262.png";--图片路径
          id="返回";--控件ID
        };
      };
      {
        LinearLayout;--线性布局--线性控件
        orientation='vertical';--布局方向
        layout_width='wrap';--布局宽度
        layout_height='fill';--布局高度

        {
          TextView;--文本控件
          layout_width='fill';--控件宽度
          layout_height='fill';--控件高度
          layout_marginLeft="1%w";--布局左距
          text="网抑云";--显示文字
          textSize='18sp';--文字大小
          textColor=0xFFFFFFFF;--文字颜色
          gravity="left|center";--重力属性
          singleLine=true;--单行显示文字
          id="",--设置控件ID
        };
      };
    };
  };

  {
    LinearLayout;
    orientation="vertical";
    layout_width="fill";
    {
      LinearLayout,--线性布局

      orientation="vertical",--布局方向
      layout_width="fill",--布局宽度
      layout_height="wrap",--布局高度
      background="#ffffffff",--布局背景
      elevation="1dp",--阴影层次
    },--线性布局 结束
    {
      LinearLayout;
      orientation="vertical";
      layout_height="fill";
      layout_width="fill";
      {
        LinearLayout;
        layout_height="0dp";
        gravity="top";
        orientation="vertical";
        layout_width="fill";
      };
      {
        LinearLayout;
        layout_width="fill";
        {
          CardView;
          layout_margin="20dp";
          layout_height="48dp";
          layout_width="fill";
          radius='8dp';--卡片圆角
          {
            EditText;
            id="edit";
            layout_marginLeft='10dp';--布局左距
            background="#FFFFFFFF";
            layout_gravity="center";
            gravity="left";
            textSize="16sp",--文本大小
            --  imeOptions="actionSearch";--设置键盘右下角操作
            singleLine="true";
            Hint="输入搜索关键词...";
            layout_width="fill";
          };
          {
            Button;
            background="#FFFFFFFF";
            layout_height="48dp";
            layout_gravity="right";
            textColor="#FF000000";
            layout_width="70dp";
            text="搜索";
            id="sousuo";
            onClick=function()
              水珠动画(sousuo,250)
              if edit.text=="" then
                美化提示("请输入所需搜索的关键词进行搜索")
               else
                美化提示("内容正在加载 这需要时间 请稍等片刻")
                搜索歌曲()
              end
            end,
          };
        };
      };
    };
    {
      LinearLayout;
      orientation="vertical";
      layout_height="fill";
      layout_width="fill";
      {
        ListView,
        id="歌曲列表",
        layout_height="-1",
        layout_width="-1",
        DividerHeight=1;
        BackgroundColor="#FFFFFFFF";
      },
    };
  };
};

activity.setContentView(loadlayout(Tritium))

歌曲list={
  LinearLayout;
  layout_height="-1";
  layout_width="-1";
  orientation="vertical";
  BackgroundColor="#FFFFFFFF";
  {
    LinearLayout;
    layout_width="-1";
    layout_height="65dp";
    {
      CardView;
      CardElevation="0dp";
      CardBackgroundColor="#FFE0E0E0";
      Radius="5dp";
      layout_width="-1";
      layout_height="-2";
      layout_margin="8dp";
      {
        CardView;
        CardElevation="0dp";
        CardBackgroundColor="#FFFFFFFF";
        -- Radius=dp2px(8)-2;
        layout_margin="0px";
        layout_width="-1";
        layout_height="-1";
        {
          LinearLayout;
          layout_width="-1";
          layout_height="-1";
          background="#004A4A4A";--背景色
          --    id="音乐_波纹";
          {
            RelativeLayout;
            layout_width="match_parent";
            layout_height="match_parent";

            {
              LinearLayout;
              layout_height="match_parent";
              padding="5dp";
              gravity="center";
              id="布局_图片";
              layout_width="50dp";
              {
                CardView;
                layout_height="-1";
                radius="5dp";
                CardBackgroundColor="#FFFFFFFF";
                layout_width="50dp";
                {
                  ImageView;
                  --src="icon.png";
                  layout_height="match_parent";
                  id="图片";
                  layout_width="match_parent";
                  scaleType="fitXY";--设置图片缩放显示
                };
              };
            };
            {
              LinearLayout;
              layout_height="match_parent";
              layout_width="match_parent";
              layout_toRightOf="布局_图片";
              {
                RelativeLayout;
                layout_height="match_parent";
                layout_width="match_parent";
                layout_marginLeft="8dp";
                {
                  TextView;
                  id="歌名";
                  layout_marginTop="3dp";
                  textColor="#FF000000";
                  text="歌名";
                  singleLine=true;
                  ellipsize="end";
                  maxLines=1;
                };
                {
                  TextView;
                  layout_below="歌名";
                  layout_marginTop="3dp";
                  id="歌手";
                  text="歌手";
                  singleLine=true;
                  ellipsize="end";
                  maxLines=1;
                };
              };
            };
          };
        };
      };
    };
    {
      TextView;
      layout_width="-2";
      layout_height="-2";
      id="链接";
      visibility="gone";
    };
  };
};

import "android.os.Environment"
import "cjson"
function 搜索歌曲()
  Http.post("http://47.112.23.238/Music/getMusicList","musicName="..edit.text.."&type=netease&number=50",function(a,b,c,d)
    if a==200 then
      --b=string.gsub(b,'\\','')
      json=cjson.decode(b)
      data=json.data
      adp=LuaAdapter(activity,歌曲list)
      歌曲列表.setAdapter(adp)--列表
      for i=1,#data do
        下载链接=data[i].url
        图片链接=data[i].pic
        歌手名称=data[i].author
        歌曲名称=data[i].title
        adp.add{歌名=歌曲名称,歌手=歌手名称,图片=图片链接,链接=下载链接,--[[音乐_波纹={background=列表波纹(主题色)}]]}--设置内容
      end
     else
      --("网络不可用")
    end
  end)
end



歌曲列表.onItemClick=function(a,p,c,d)--列表单击
  名=(p.Tag.歌名.text)--获取文本
  手=(p.Tag.歌手.text)
  链=(p.Tag.链接.text)
  --mp.stop()
  --播放音乐(链)
  --使用

  Tritium_Download=
  {
    LinearLayout;--线性布局
    orientation="vertical";--重力属性
    id="Download_father_Tritium",--控件ID
    {
      TextView;--文本控件
      id="linkhint",--控件ID
      layout_marginTop="10dp";--布局方向
      text="下载链接",--文本内容
      layout_width="80%w";--布局宽度
      textColor=WidgetColors,--控件ID
      layout_gravity="center";--对齐方式
    };
    {
      EditText;--编辑框控件
      layout_width="80%w";
      layout_gravity="center";
      id="链接";--控件ID
      text=链,--文本内容
    };
    {
      TextView;--文本控件
      layout_marginTop="10dp";--控件顶距
      text="音乐名称",--文本内容
      layout_width="80%w";--布局宽度
      textColor=WidgetColors,--字体颜色
      layout_gravity="center";--对齐方式
    };
    {
      EditText;--编辑框控件
      layout_width="80%w";--布局宽度
      layout_gravity="center";--对齐方式
      id="名称";--控件ID
      text=手.."-"..名,--文本内容
    };
    {
      TextView;--文本控件",
      text="下载路径",--文本内容
      layout_width="80%w";--布局宽度
      textColor=WidgetColors,--字体颜色
      layout_marginTop="10dp";--控件顶距
      layout_gravity="center";--对齐方式
    };
    {
      EditText;--编辑框控件
      id="pathedit",--控件ID
      layout_width="80%w";--布局宽度
      layout_gravity="center";--对齐方式
      Text="/storage/emulated/0/米环看小说/音乐/";--文本内容
      id="路径";--控件ID
    };
  };
  --弹出下载窗口
  AlertDialog.Builder(this)--弹窗
  .setTitle("提示信息")--设置标题
  .setView(loadlayout(Tritium_Download))--设置布局
  .setPositiveButton("下载",
  {
    onClick=function(v)--积极按钮点击事件
      import "android.content.Context"
      import "android.net.Uri"
      downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
      url=Uri.parse(链接.Text);
      request=DownloadManager.Request(url);
      request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
      request.setDestinationInExternalPublicDir(路径.Text,""..名称.Text..".mp3");
      request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
      downloadManager.enqueue(request);
      美化提示("正在下载 打开通知栏查看下载进度")
      弹出消息("文件保存于："..路径.Text..名称.Text.."mp3")--提示下载
    end
  })--设置积极按钮
  .setNeutralButton("播放",
  {
    onClick=function(v)--调用系统播放器播放音频
      import "android.content.Intent"
      import "android.net.Uri"
      intent =Intent(Intent.ACTION_VIEW)
      uri = Uri.parse(链接.Text)
      intent.setDataAndType(uri,"audio/*")
      this.startActivity(intent)
    end
  })
  .setNegativeButton("取消",nil)--设置消极按钮
  .show()--显示弹窗

end



返回.onClick=function()--返回图片点击事件
  水珠动画(返回,250)
  activity.finish()--关闭当前页面
end