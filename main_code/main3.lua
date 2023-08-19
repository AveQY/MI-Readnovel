require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"
import "android.content.Context"

activity.setTheme(R.Theme_Teal)
main3_layout={
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
            layout_marginLeft="5dp";
            text="小说下载";
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
            layout_marginLeft="5dp";
            text="";
          };
        };
      };
    };
  };
  {
    LuaWebView;
    layout_width="match_parent";
    id="mLuaWebView1";
    layout_height="match_parent";
  };
};
activity.setContentView(loadlayout(main3_layout))
activity.ActionBar.hide()
状态栏()

img.onClick=function()
  activity.finish()
  提示([[下载的小说保存到/storage/emulated/0/米环看小说/小说/]])
end
设置一言()

if File("/storage/emulated/0/米环看小说/小说/").isDirectory() then
 else
  File("/storage/emulated/0/米环看小说/小说/").mkdirs()
end

function 下载(url,path)
  local tt=Ticker()
  tt.start()
  Http.download(url,path,function(code,data,cookie,header)
    tt.stop()
    确认.Text="下载完成"
    提示("小说下载完成！")
  end)
  function tt.onTick()
    local f=io.open(path,"r")
    if f~=nil then
      local len=f:read("a")
      local s=#len/lens
      确认.Text=math.ceil(s*100).."%"
    end
  end
end

function 下载进度(url,path)
  import "java.net.URL"
  realUrl = URL(url)
  con = realUrl.openConnection();
  con.setRequestProperty("accept",path);
  con.setRequestProperty("connection", "Keep-Alive");
  con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
  lens=con.getContentLength()
  下载(url,path)
end

link=...
mLuaWebView1.loadUrl(link)

function 爬取2(url,小说名称)
  Http.get(url,nil,'utf8',nil,function(a,b)
    确认.Text="请稍后"
    链接=b:match('线路一</a></span><span class="downfile"><a href="(.-)"')
    下载进度(链接,"/storage/emulated/0/米环看小说/"..小说名称..".zip")
    取消.Text="后台下载"
  end)
end
function 爬取1(url,小说名称)
  Http.get(url,function(a,b)
    link1=b:match('<p class="filetit"><a href="(.-)" rel="external nofollow"')
    爬取2(link1,小说名称)
  end)
end
function 确认事件(链接,小说名称)
  if 确认.Text=="下载" then
    爬取1(链接,小说名称)
   else
    activity.finish()
  end
end
function 取消事件(初始化链接)
  if 取消.Text=="取消" then
    xxx.dismiss()
    mLuaWebView1.loadUrl(初始化链接)
   else
    activity.finish()
  end
end
function 爬取判断(初始化链接)
  链接=mLuaWebView1.getUrl()
  aaa_q=链接:match('(.+)post')
  if aaa_q=="http://zxcs.me/" then
    mLuaWebView1.stopLoading()
    Http.get(链接,function(a,b)
      小说名称=b:match('《(.-)》')
      小说大小=b:match('TXT大小】：(.-)<')
      事件1='确认事件(链接,小说名称)'
      事件2='取消事件(初始化链接)'
      弹窗UI("提示","小说名称："..小说名称.."\n文件大小:"..小说大小,事件1,事件2,"取消","下载",高度)
    end)
  end
end
mLuaWebView1.setWebViewClient{
  shouldOverrideUrlLoading=function(view,url)
    --Url即将跳转
    初始化链接=mLuaWebView1.getUrl()
  end,
  onPageStarted=function(view,url,favicon)
    --网页加载
    爬取判断(初始化链接)
  end,
  onPageFinished=function(view,url)
  end}