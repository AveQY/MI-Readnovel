require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

activity.setTheme(R.Theme_Teal)
layout={
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
        layout_width="fill";
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
            text="第三方资源包";
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
    LinearLayout;
    gravity="center";
    layout_height="fill";
    layout_width="fill";
    backgroundColor='#ffffffff';
    {
      PullingLayout;
      id="pull2";
      PullUpEnabled=true;
      layout_width="fill";
      {
        ListView;
        id="资源包列表";
        DividerHeight=0;
        verticalScrollBarEnabled=false;
        layout_gravity="end";
        layout_width="fill";
      };
    };
  },
};

activity.setContentView(loadlayout(layout))
activity.ActionBar.hide()
状态栏()
设置一言()

function 标题栏下载(链接,文件夹名,文件名)
  if 确认.Text=="下载" then
    路径="/storage/emulated/0/米环看小说/"..文件夹名.."/"
    if File(路径).isDirectory() then
     else
      File(路径).mkdirs()
    end
    确认.Text="下载中"
    蓝奏云解析(链接,"xnsn",function(body)
      path=路径..文件名
      Http.download(body,path,function(code,data,cookie,header)
        确认.Text="下载完成"
      end)
    end)
   elseif 确认.Text=="下载中" then
   else
    xxx.dismiss()
  end
end

pop=PopupMenu(activity,menu)
menu=pop.Menu
menu.add("下载V1.0.9.68固件").onMenuItemClick=function(v)
  确认事件='标题栏下载("https://aweqy.lanzouu.com/iRbdf062d3fa","固件","V1.0.9.68固件.fw")'
  取消事件='xxx.dismiss()'
  弹窗UI("V1.0.9.68固件","大小:1.3MB\n\n下载固件保存到:/storage/emulated/0/米环看小说/固件/",确认事件,取消事件,"取消","下载",高度)(文件链接,图片链接,"",高度)
end
menu.add("下载字体").onMenuItemClick=function(v)
  确认事件='标题栏下载("https://aweqy.lanzouu.com/izlTz062d5zc","字体","手书体.bin")'
  取消事件='xxx.dismiss()'
  弹窗UI("手书体(字体)","大小:1.7MB\n\n下载字体保存到:/storage/emulated/0/米环看小说/字体/",确认事件,取消事件,"取消","下载",高度)(文件链接,图片链接,"",高度)
end
menu.add("下载Notify").onMenuItemClick=function(v)
  确认事件='标题栏下载("https://aweqy.lanzouu.com/iwp8k062dsdi","工具","Notify for MI band.apk")'
  取消事件='xxx.dismiss()'
  弹窗UI("Notify for MI band","大小:35.2MB\n\n下载文件保存到:/storage/emulated/0/米环看小说/工具/",确认事件,取消事件,"取消","下载",高度)(文件链接,图片链接,"",高度)
end
menu.add("下载小米运动(旧版)").onMenuItemClick=function(v)
  确认事件='标题栏下载("https://aweqy.lanzouu.com/in3mKu0z82f","工具","小米运动(旧).apk")'
  取消事件='xxx.dismiss()'
  弹窗UI("小米运动(旧)","大小：73.3MB\n\n下载文件保存到:/storage/emulated/0/米环看小说/工具/",确认事件,取消事件,"取消","下载",高度)(文件链接,图片链接,"",高度)
end
img2.onClick=function()
  pop.show()
end


function 下载资源包(资源包名称,文件链接,图片链接,内容,高度)
  import "android.graphics.Typeface"
  弹窗框架={
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
          LinearLayout;
          orientation="vertical";
          gravity="center";
          layout_height="fill";
          layout_width="fill";
          layout_marginTop="15dp",
          {
            FrameLayout;
            layout_height="200dp";
            layout_width="200dp";
            {
              ImageView;
              layout_width="200dp";
              layout_height="200dp";
              src="res/band.png";
            };
            {
              LinearLayout;
              orientation="vertical";
              gravity="center";
              layout_height="fill";
              layout_width="fill";
              {
                ImageView;
                layout_margin="50dp";
                src=图片链接,
              };
            };
          };
        };
        {
          LinearLayout,
          layout_padding='10%';
          gravity='left|center';
          orientation='vertical',
          layout_width='fill',
          layout_height=高度,
          background='#ffffffff',
          {
            ScrollView;
            layout_width='fill';
            layout_height='fill';
            verticalScrollBarEnabled=false,
            overScrollMode=View.OVER_SCROLL_NEVER,
            {
              TextView;
              padding="20dp",
              ellipsize="end";
              layout_width='fill';
              layout_height='fill';
              textColor='#FF888888';
              text=内容;
              textSize='15dp';
              gravity='center|left|top';
              id="内容",
            };
          };
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
              textSize='16dp';
              id="确认",
              text="下载";
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
  function 波纹特效v2(颜色)
    import"android.content.res.ColorStateList"
    return activity.Resources.getDrawable(activity.obtainStyledAttributes({android.R.attr.selectableItemBackground--[[Borderless]]}).getResourceId(0,0))
    .setColor(ColorStateList(int[0]
    .class{int{}},int{颜色 or 0x20000000}))
  end
  确认.onClick=function()
    if 确认.Text=="下载" then
      路径="/storage/emulated/0/米环看小说/资源包/"
      if File(路径).isDirectory() then
       else
        File(路径).mkdirs()
      end
      确认.Text="下载中"
      蓝奏云解析(文件链接,"xnsn",function(body)
        path=路径..资源包名称..".res"
        Http.download(body,path,function(code,data,cookie,header)
          确认.Text="下载完成"
        end)
      end)
     elseif 确认.Text=="下载中" then
     else
      xxx.dismiss()
    end
  end;
  取消.onClick=function()
    xxx.dismiss()
  end;
  确认.foreground=波纹特效v2(0xFFCECECE)
  取消.foreground=波纹特效v2(0xFFCECECE)
end

items={
  LinearLayout,
  layout_width="fill",
  orientation="horizontal",
  gravity="center|left",
  background="#ffffff";
  {
    ImageView,
    id="img",
    layout_width="30dp",
    layout_height="70dp",
    layout_marginTop="25dp",
    layout_marginBottom="25dp",
    layout_marginLeft="20dp",
  },
  {
    LinearLayout,
    layout_width="fill",
    layout_marginLeft="50dp",
    layout_marginTop="25dp",
    layout_marginBottom="25dp",
    layout_marginRight="10dp",
    orientation="horizontal",
    layout_height="fill",
    gravity="center|left",
    {
      TextView,
      id="title",
      textSize="19sp",
      textColor="#757575",
      layout_width='45%w';
    },
    {
      TextView,
      id="title2",
      layout_height="0dp",
      layout_width="0dp",
    },
    {
      TextView,
      id="title3",
      layout_height="0dp",
      layout_width="0dp",
    },
  },
}

名称数据={"PokémonGo",
  "原神",
  "MIUI Pure",
  '移植PureUI',
  "仿MC主题",
  "简约风",
  "MIUI设计",}
图片路径={}
for i=1,#名称数据 do
  table.insert(图片路径,"res/Resource pack/"..i..".png")
end

链接={"https://aweqy.lanzouu.com/itpE0062afqf",
  "https://aweqy.lanzouu.com/iJvzp062ahlc",
  "https://aweqy.lanzouu.com/iBsAY062agej",
  "https://aweqy.lanzouu.com/i8Gqh062ahne",
  "https://aweqy.lanzouu.com/iDV91062gnad",
  "https://aweqy.lanzouu.com/icXi6062gn9c",
  "https://aweqy.lanzouu.com/iNr6K062gneh",
}

adpd={}
for i=1,#名称数据 do
  table.insert(adpd,{
    img={
      src=图片路径[i],
    },
    title={
      text=名称数据[i],
    },
    title2={
      text=图片路径[i],
    },
    title3={
      text=链接[i],
    },
  })
end
adapter=LuaAdapter(this,adpd,items)
资源包列表.Adapter=adapter
资源包列表.onItemClick=function(adp,v,pos,id)
  资源包名称=v.Tag.title.Text
  图片链接=v.Tag.title2.Text
  文件链接=v.Tag.title3.Text

  下载资源包(资源包名称,文件链接,图片链接,[[资源包均摘自网络，侵删~

温馨提示:注意！刷前检查固件是否为V1.0.9.68(否则变砖)点击右上角获取此固件

救砖方法：1.准备小米运动旧版安装包，变砖后安装连接手环。
2.维持小米运动后台(勿断连)，变砖后打开它。
3.使用Notify重新刷入官方资源包。

下载资源包放在:/storage/emulated/0/米环看小说/资源包/]],高度)
end


页数=0

pull2.onLoadMore=function(v)
  页数=页数+1
  url_="https://share.weiyun.com/kpz8D2Um"
  Http.get(url_,function(a,b)
    if a==200 then
      页数2=b:match([[>页数【(.-)】]])
      if 页数 > tonumber(页数2) then
        v.loadmoreFinish(0)
        Toast.makeText(activity,"到底了~", Toast.LENGTH_LONG).show()
       else
        v.loadmoreFinish(0)
        数量=tonumber(b:match([[>数量【(.-)】]]))
        名称数据_={}
        图片路径_={}
        链接_={}
        for i=1,数量 do
          表盘名称=b:match('>'..页数..'包'..i..'名称【(.-)】')
          table.insert(名称数据_,表盘名称)
        end
        for i=1,数量 do
          表盘图片链接=b:match('>'..页数..'包'..i..'图片链接【(.-)】')
          table.insert(图片路径_,表盘图片链接)
        end
        for i=1,数量 do
          表盘下载链接=b:match('>'..页数..'包'..i..'下载链接【(.-)】')
          table.insert(链接_,表盘下载链接)
        end
        for i=1 , #名称数据_ do
          l=名称数据_[i]
          q=图片路径_[i]
          w=链接_[i]
          adapter.add{img=q,title=l,title2=q,title3=w}
        end
        adapter.notifyDataSetChanged()
      end
     else
      Toast.makeText(activity,"请检查网络", Toast.LENGTH_LONG).show()
    end
  end)
end