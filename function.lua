function 提示(内容)
  Toast.makeText(activity,内容,Toast.LENGTH_LONG).show()
end
function 状态栏()
  if tonumber(Build.VERSION.SDK) >= 23 then
    activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
  end
  if Build.VERSION.SDK_INT >= 21 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);
  end
  if Build.VERSION.SDK_INT >= 19 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
  end
end
function 波纹特效v2(颜色)
  import"android.content.res.ColorStateList"
  return activity.Resources.getDrawable(activity.obtainStyledAttributes({android.R.attr.selectableItemBackground--[[Borderless]]}).getResourceId(0,0))
  .setColor(ColorStateList(int[0]
  .class{int{}},int{颜色 or 0x20000000}))
end
function 通知(标题,内容)
  function createNotificationChannel(channelID, channelNAME, level)
    if Build.VERSION.SDK_INT >= Build.VERSION_CODES.O then
      manager = activity.getSystemService(Context.NOTIFICATION_SERVICE)
      channel = NotificationChannel(channelID, channelNAME, level)
      manager.createNotificationChannel(channel)
      return channelID
     else
      return nil
    end
  end
  import "android.content.Intent"
  import "android.content.Context"
  intent = Intent()
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK)
  pendingIntent = PendingIntent.getActivity(this, 0, intent, 0)
  channelId = createNotificationChannel("my_channel_ID", "my_channel_NAME", NotificationManager.IMPORTANCE_HIGH)
  notification = Notification.Builder(this, channelId)
  .setContentTitle(标题)
  .setContentText(内容)
  .setContentIntent(pendingIntent)
  .setSmallIcon(android.R.drawable.ic_dialog_info)
  .setPriority(Notification.PRIORITY_MAX)
  .setDefaults(Notification.DEFAULT_ALL)
  .setAutoCancel(false)
  .build()
  notificationManager = activity.getSystemService(Context.NOTIFICATION_SERVICE)
  notificationManager.notify(1, notification)
end
function 设置一言()
  txt={"桃李春风一杯酒，江湖夜雨十年灯。",
    "长风破浪会有时，直挂云帆济沧海。",
    "你是无意穿堂风，偏偏孤倨引山洪。",
    "愿你天黑有灯，下雨有伞，未来的路有良人相伴。",
    "我有一个梦，也许有一天，灿烂的阳光能照进黑暗森林。",
    "自古美人如名将，不许人间见白头。",
    "什么都无法舍弃的人，什么都无法改变。",
    "天不生我李淳罡，剑道万古长如夜",
    "斑竹枝，斑竹枝，点点泪痕寄相思",
    "一切都会变好,超级好,爆好,无敌好",
    "把喜欢的一切留在身边，这便是努力的意义",
    "悲喜自渡，他人难悟易误",
    "且以深情共白首，愿无岁月可回头",
    "保持热爱，奔赴山海！"}
  Http.get("https://v1.hitokoto.cn/?encode=json","utf8",function(code,content,cookie,header)
    if code==200 then
      local cjson=import "cjson"
      local json=cjson.decode(content)
      yiyan.setText(json.hitokoto)
     else
      yiyan.setText(txt[math.random(0,12)])
    end
  end)
end
function 弹窗UI(标题,内容,确认事件,取消事件,按钮1,按钮2,高度)
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
      CardBackgroundColor='0xfffFFFFF';
      radius='10dp';
      {
        LinearLayout,
        gravity='center';
        orientation='vertical',
        layout_width='fill',
        layout_height='wrap',
        background='#00FFFFFF',
        {
          TextView;
          layout_margin='4%w';
          gravity='center';
          layout_width='fill';
          layout_height='wrap';
          textColor='#eb000000';
          text=标题;
          textSize='16dp';
          typeface=Typeface.DEFAULT_BOLD,
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
              text=按钮1;
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
              text=按钮2;
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
  xxx.setCancelable(false)
  xxx=xxx.show()
  import "android.graphics.drawable.ColorDrawable"
  xxx.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))

  确认.onClick=function()
    assert(loadstring(确认事件))()
  end;
  取消.onClick=function()
    assert(loadstring(取消事件))()
  end;
  确认.foreground=波纹特效v2(0xFFCECECE)
  取消.foreground=波纹特效v2(0xFFCECECE)
end
function 蓝奏云解析(url,pwd,fun)
  import "java.net.URL"
  import "java.lang.StringBuilder"
  local Url=StringBuilder(url).insert(StringBuilder(url).indexOf(".com/")+4,"/tp")
  LuaWebView(this).loadUrl(tostring(Url))
  .setWebViewClient({onPageFinished=function(view,url)
      if pwd then view.loadUrl([[JavaScript:var html = document.documentElement.outerHTML;var action = html.match("action\':\'([a-zA-Z_0-9]+)\'");var sign = html.match("sign\':\'([a-zA-Z_0-9]+)\'");
$.ajax({type : 'post',url : '/ajaxm.php',data : { 'action':action,'sign':sign,'p':']]..tostring(pwd)..[[' },dataType : 'json',async: true,success:function(msg){Lua.execute(msg.dom+'/file/'+msg.url);}});]]) else
        view.loadUrl([[JavaScript:Lua.execute(domianload+downloads);]]) end
    end}).addJSInterface({execute=function(res)
      pcall(function() fun(URL(res).openConnection().setInstanceFollowRedirects(false).addRequestProperty("accept-language","zh,zh-CN;q=0.9,en-US;q=0.8,en;q=0.7").getHeaderField("Location")) end)
    end},"Lua")
end
function 分享内容(text)
  intent=Intent(Intent.ACTION_SEND);
  intent.setType("text/plain");
  intent.putExtra(Intent.EXTRA_SUBJECT, "分享");
  intent.putExtra(Intent.EXTRA_TEXT, text);
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
  activity.startActivity(Intent.createChooser(intent,"分享到:"));
end
function 分享()
  url="https://share.weiyun.com/NmWmqisc"
  Http.get(url,function(a,b)
    if a==200 then
      分享内容([[软件名称：米环看小说
      
介绍:使用小米手环看小说

开发者：訫念是你

下载链接：https://aweqy.lanzouu.com/b02j5iimf 密码:xnsn]])
     else
      提示("请检查网络")
    end
  end)
end

function 公告()
  url="https://share.weiyun.com/NmWmqisc"
  Http.get(url,function(a,b)
    if a==200 then
      标题=b:match('>公告标题【(.-)】')
      if 标题=='关闭' then
       else
        内容=b:match([[>公告内容【(.-)】]])
        if io.open("/sdcard/米环看小说/公告")~=nil then
         else
          io.open("/sdcard/米环看小说/公告",'w'):write("内容"):close()
        end
        之前内容=io.open("/sdcard/米环看小说/公告"):read("*a")
        if 之前内容==内容 then
         else
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
              CardBackgroundColor='0xfffFFFFF';
              radius='10dp';
              {
                LinearLayout,
                gravity='center';
                orientation='vertical',
                layout_width='fill',
                layout_height='wrap',
                background='#00FFFFFF',
                {
                  TextView;
                  layout_margin='4%w';
                  gravity='center';
                  layout_width='fill';
                  layout_height='wrap';
                  textColor='#eb000000';
                  text=标题;
                  textSize='16dp';
                  typeface=Typeface.DEFAULT_BOLD,
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
                      text="不再提醒";
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
                      text="知道了";
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
          xxx.setCancelable(false)
          xxx=xxx.show()
          import "android.graphics.drawable.ColorDrawable"
          xxx.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))

          确认.onClick=function()
            xxx.dismiss()
          end;
          取消.onClick=function()
            io.open("/sdcard/米环看小说/公告",'w'):write(内容.Text):close()
            xxx.dismiss()
          end;
          确认.foreground=波纹特效v2(0xFFCECECE)
          取消.foreground=波纹特效v2(0xFFCECECE)
        end
      end
     else
    end
  end)
end
function 公告2()
  url="https://share.weiyun.com/NmWmqisc"
  Http.get(url,function(a,b)
    if a==200 then
      标题=b:match('>公告标题【(.-)】')
      if 标题=='关闭' then
        提示("开发者还没有发布公告~")
       else
        内容=b:match([[>公告内容【(.-)】]])
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
            CardBackgroundColor='0xfffFFFFF';
            radius='10dp';
            {
              LinearLayout,
              gravity='center';
              orientation='vertical',
              layout_width='fill',
              layout_height='wrap',
              background='#00FFFFFF',
              {
                TextView;
                layout_margin='4%w';
                gravity='center';
                layout_width='fill';
                layout_height='wrap';
                textColor='#eb000000';
                text=标题;
                textSize='16dp';
                typeface=Typeface.DEFAULT_BOLD,
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
                    text="不再提醒";
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
                    text="知道了";
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
        xxx.setCancelable(false)
        xxx=xxx.show()
        import "android.graphics.drawable.ColorDrawable"
        xxx.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))

        确认.onClick=function()
          xxx.dismiss()
        end;
        取消.onClick=function()
          xxx.dismiss()
        end;
        确认.foreground=波纹特效v2(0xFFCECECE)
        取消.foreground=波纹特效v2(0xFFCECECE)

      end
     else
    end
  end)
end


function Drawable_round(id,back,up,down)
  import "android.graphics.Color"
  import "android.graphics.drawable.GradientDrawable"

  if not up then
    up=25
  end
  if not down then
    down=up
  end
  id.setBackgroundDrawable(GradientDrawable()
  .setShape(GradientDrawable.RECTANGLE)
  .setColor(back)
  .setCornerRadii({up,up,up,up,down,down,down,down}))
end

function 输入对话框()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="linkedit",
      layout_width="80%w";
      layout_gravity="center";
      singleLine=true;--设置单行输入
    };
  };

  --使用案例
  dialog=AlertDialog.Builder(this)
  --.setTitle("输入你想要发送的内容")
  .setMessage("请输入：")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("发送",{onClick=function(v)
      a=linkedit.Text
      if a=="" then
        print "请输入"
       else
        通知(a)
      end
    end})
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFffffff)
end

function 更新下载(url,path)
  local tt=Ticker()
  tt.start()
  Http.download(url,path,function(code,data,cookie,header)
    tt.stop()
    确认.setText("安装")
    更新内容.Text="文件保存到：/storage/emulated/0/米环看小说/"
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
function 更新进度(url,path)
  import "java.net.URL"
  realUrl = URL(url)
  con = realUrl.openConnection();
  con.setRequestProperty("accept",path);
  con.setRequestProperty("connection", "Keep-Alive");
  con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
  lens=con.getContentLength()
  更新下载(url,path)
end
function 更新弹窗2(内容,url,password,name)
  import "android.graphics.Typeface"
  弹窗框架=
  {
    LinearLayout,
    orientation='vertical',
    layout_width='fill',
    layout_height='wrap',
    background='#00FFFFFF',
    {
      CardView;
      layout_margin='8dp';
      layout_gravity='center';
      elevation='5dp';
      layout_width='80%w';
      layout_height='fill';
      CardBackgroundColor='0xfffFFFFF';
      radius='10dp';
      {
        LinearLayout,
        gravity='center';
        orientation='vertical',
        layout_width='fill',
        layout_height='wrap',
        background='0xfffFFFFF',
        {
          TextView;
          layout_margin='4%w';
          gravity='center';
          layout_width='fill';
          layout_height='wrap';
          textColor='#FF121212';
          text="发现新版本";
          textSize='15dp';
          typeface=Typeface.DEFAULT_BOLD,
        };
        {
          LinearLayout,
          layout_padding='10%';
          gravity='left|center';
          orientation='vertical',
          layout_width='fill',
          layout_height='75%h',
          background='#ffffffff',
          {
            LuaWebView;
            layout_width="match_parent";
            id="web";
            layout_height="match_parent";
          };
          {
            TextView,
            layout_width="fill",
            layout_height="2px",
            layout_gravity="center",
            backgroundColor="#ffbebebe",
          };
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
            layout_width='40%w',
            layout_height='fill',
            background='#00FFFFFF',
            {
              TextView;
              gravity='center';
              layout_width='fill';
              layout_height='fill';
              textColor='#ff757575';
              text='取消';
              textSize='16dp';
              id="取消"
            };
          };
          {
            TextView,
            layout_width="2px",
            layout_height="fill",
            layout_gravity="center",
            backgroundColor="#ffbebebe",
          };
          {
            LinearLayout,
            orientation='vertical',
            layout_width='40%w',
            layout_height='fill',
            background='#00000000',
            {
              TextView;
              gravity='center';
              layout_width='fill';
              layout_height='fill';
              textColor='#FF147CE4';
              text='升级';
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
  xxx.setCancelable(false)
  xxx=xxx.show()
  import "android.graphics.drawable.ColorDrawable"
  xxx.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))
  function 波纹特效v2(颜色)
    import"android.content.res.ColorStateList"
    return activity.Resources.getDrawable(activity.obtainStyledAttributes({android.R.attr.selectableItemBackground--[[Borderless]]}).getResourceId(0,0))
    .setColor(ColorStateList(int[0]
    .class{int{}},int{颜色 or 0x20000000}))
  end
  写入文件("/storage/emulated/0/米环看小说/updata.html",'<html><p>'..内容..'</p></html>')
  web.loadUrl("file:///storage/emulated/0/米环看小说/updata.html")
  确认.onClick=function()
    a=确认.Text
    if a=="升级" then
      确认.setText("请稍等")
      蓝奏云解析(url,password,function(body)
        url2=body
        更新进度(url2,"/storage/emulated/0/米环看小说/"..name)
      end)
     else
      import "android.content.Intent"
      import "android.net.Uri"
      import "android.content.*"
      activity.installApk("/storage/emulated/0/米环看小说/"..name)
    end
  end;
  取消.onClick=function()
    xxx.dismiss()
  end;
  确认.foreground=波纹特效v2(0xFFCECECE)
  取消.foreground=波纹特效v2(0xFFCECECE)
end

function 检查更新()
  当前版本=io.open(activity.getLuaDir().."/version"):read("*a"):match('version="(.-)"')
  url="https://share.weiyun.com/NmWmqisc"
  Http.get(url,nil,"utf8",nil,function(code,content)
    更新开关=content:match('>更新开关【(.-)】')
    if 更新开关=="关" then
      弹窗("提示","开发者已停止软件更新！")
     else
      if code==200 then
        版本=content:match('>版本【(.-)】')
        if 版本==当前版本 then
          提示("您已经是最新版本！")
         else
          更新()
        end
       else
      end
    end
  end)
end
function 更新()
  当前版本=io.open(activity.getLuaDir().."/version"):read("*a"):match('version="(.-)"')
  url="https://share.weiyun.com/NmWmqisc"
  Http.get(url,nil,"utf8",nil,function(code,content)
    更新开关=content:match('>更新开关【(.-)】')
    if 更新开关=="关" then
      弹窗("提示","开发者已停止软件更新！")
     else
      if code==200 then
        版本=content:match('>版本【(.-)】')
        if 版本==当前版本 then
         else
          更新链接=content:match('>更新链接【(.-)】')
          更新说明=content:match('>更新说明【(.-)】')
          password=content:match('>更新密码【(.-)】')
          a="<p>更新内容："..更新说明.."</p><p>更新链接："..更新链接.."</p>"
          更新弹窗2(a,更新链接,password,"米环看小说_"..版本..".apk")
        end
       else
      end
    end
  end)
end

function 调用系统选择文件(callback)
  import "android.content.Intent"
  import "android.content.ContentUris"
  import "android.provider.MediaStore"
  import "android.provider.DocumentsContract"
  import "android.net.Uri"
  import "android.os.Build"
  import "android.os.Environment"
  intent=Intent("android.intent.action.GET_CONTENT").setType("*/*").addCategory("android.intent.category.OPENABLE")
  activity.startActivityForResult(intent,1)
  function uri2path(uri)
    local needToCheckUri=Build.VERSION.SDK_INT>=19
    local selection
    local selectionArgs
    if needToCheckUri && DocumentsContract.isDocumentUri(activity,uri) then
      if isExternalStorageDocument(uri) then
        local docId=DocumentsContract.getDocumentId(uri)
        local split=String(docId).split(":")
        return Environment.externalStorageDirectory.toString().."/"..split[1]
       elseif isDownloadsDocument(uri) then
        local id=DocumentsContract.getDocumentId(uri)
        local split=String(id).split(":")
        uri=ContentUris.withAppendedId(Uri.parse("content://downloads/public_downloads"),Long.valueOf(split[1]))
       elseif isMediaDocument(uri) then
        local docId=DocumentsContract.getDocumentId(uri)
        local split=String(docId).split(":")
        switch split[0]
         case "image"
          uri=MediaStore.Images.Media.EXTERNAL_CONTENT_URI
         case "video"
          uri=MediaStore.Video.Media.EXTERNAL_CONTENT_URI
         case "audio"
          uri=MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
        end
        selection="_id=?"
        selectionArgs={split[1]}
      end
    end
    if String("content").equalsIgnoreCase(uri.scheme) then
      local projection={"_data"}
      local cursor
      local result
      pcall(function()
        cursor=activity.contentResolver.query(uri,projection,selection,selectionArgs,nil)
        local column_index=cursor.getColumnIndexOrThrow("_data")
        if cursor.moveToFirst() then
          result=cursor.getString(column_index)
        end
      end)
      return result
     elseif String("file").equalsIgnoreCase(uri.scheme)
      return uri.path
    end
  end
  function isExternalStorageDocument(uri)
    return uri.authority=="com.android.externalstorage.documents"
  end
  function isDownloadsDocument(uri)
    return uri.authority=="com.android.providers.downloads.documents"
  end
  function isMediaDocument(uri)
    return uri.authority=="com.android.providers.media.documents"
  end
  function onActivityResult(requestCode,resultCode,data)
    if data then
      callback(tostring(uri2path(data.data)))
    end
  end
end


function 选取小说(标题,内容)
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
      text="这是截取小说的内容：(可做修改)";
    };
    {
      EditText;
      hint="小说内容";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="edit";
      MaxLines=20;--设置最大输入行数
      text=内容;
    };
  };

  AlertDialog.Builder(this)
  .setTitle(标题)
  .setView(loadlayout(InputLayout))
  .setPositiveButton("发送",{onClick=function(v)
      text=edit.Text
      通知(text)
      MD提示("已送达！",0xFF219682,0xFFFFFFFF,4,20)
    end})
  .setNegativeButton("取消",nil)
  .setCancelable(false)--禁用返回键和点击阴影部分不会关闭弹窗
  .show()
  import "android.view.View$OnFocusChangeListener"
  edit.setOnFocusChangeListener(OnFocusChangeListener{
    onFocusChange=function(v,hasFocus)
      if hasFocus then
        Prompt.setTextColor(0xFD009688)
      end
    end})
end
function 获取设备标识()
  import "android.provider.Settings$Secure"
  return Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)
end
function 文件()
  a=io.open("/storage/emulated/0/米环看小说/a.txt")
  if a==nil then
    import "java.io.File"--导入File类
    File("/storage/emulated/0/米环看小说/").mkdirs()
    io.open("/sdcard/米环看小说/a.txt","w"):write("990"):close()
   else
  end
  if File("/storage/emulated/0/米环看小说/data/").isDirectory() then
   else
    File("/storage/emulated/0/米环看小说/data/").mkdirs()
    io.open(activity.getLuaDir().."/user_openid.log","w"):write(获取设备标识()):close()
    io.open("/sdcard/米环看小说/data/user_name.log","w"):write([[未登录]]):close()
    io.open("/sdcard/米环看小说/data/user_ind.log","w"):write([[点击头像登入]]):close()
    io.open("/sdcard/米环看小说/data/user_scr.log","w"):write([[icon/user.png]]):close()
  end
end

function 小说下载输入()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="linkedit",
      layout_width="80%w";
      layout_gravity="center";
      singleLine=true;--设置单行输入
    };
  };

  --使用案例
  dialog=AlertDialog.Builder(this)
  .setTitle("小说下载")
  .setMessage("请输入小说名称：")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      a=linkedit.Text
      if a=="" then
        print "请输入"
       else
        activity.newActivity("main_code/main3",{"http://zxcs.me/?keyword="..a})
      end
    end})
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFffffff)
end

function filter_spec_chars(s)
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

function QQ聊天(qq)
  import "android.net.Uri"
  import "android.content.Intent"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("mqqwpa://im/chat?chat_type=wpa&uin="..qq)))
end
function 打开微信()
  import "android.content.Intent"
  import "android.content.pm.PackageManager"
  manager = activity.getPackageManager()
  open = manager.getLaunchIntentForPackage("com.tencent.mm")
  this.startActivity(open)
end
function 打开小破站()
  import "android.content.Intent"
  import "android.net.Uri"
  url="bilibili://space/2036485750?from=search"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end
function 下载文件(下载链接,保存文件路径)
  import "http"
  http.download(下载链接,保存文件路径)
end
function 写入剪切板(内容)
  import "android.content.Context"
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(内容)
end
function 写入文件(路径,内容)
  io.open(路径,"w"):write(内容):close()
end
function 全屏()
  window = activity.getWindow();
  window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN|View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
  window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
  xpcall(function()
    lp = window.getAttributes();
    lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
    window.setAttributes(lp);
  end,
  function(e)
  end)
end
function 捐赠()
  蓝奏云解析("https://aweqy.lanzouu.com/i8O2z04ygdng","xnsn",function(body)
    weixin=body
  end)
  蓝奏云解析("https://aweqy.lanzouu.com/iLeqs04ygdve","xnsn",function(body)
    QQ=body
  end)
  local 布局= {
    LinearLayout;
    layout_height="350dp";
    backgroundColor="0xffffffff";
    backgroundColor=颜色1,
    layout_width="match_parent";
    {
      RelativeLayout;
      layout_height="match_parent";
      layout_width="match_parent";
      {
        LinearLayout;
        layout_marginTop="23dp";
        gravity="center";
        orientation="vertical";
        layout_width="match_parent";
        {
          LinearLayout;
          gravity="center";
          orientation="vertical";
          layout_width="match_parent";
          {
            CardView;
            layout_marginTop="3dp";
            layout_width="70dp";
            CardElevation="1dp";
            layout_height="70dp";
            layout_marginBottom="3dp";
            radius="35dp";
            {
              ImageView;
              layout_height="match_parent";
              src="icon/user.png";
              layout_width="match_parent";
            };
          };
          {
            LinearLayout;
            layout_marginTop="15dp";
            gravity="center";
            orientation="vertical";
            layout_width="match_parent";
            {
              TextView;
              textSize="18sp";
              text="訫念是你";
            };
            {
              TextView;
              layout_marginTop="5dp";
              text=[==[保持热爱   奔赴山海！]==];
            };
          };
        };
        {
          CardView;
          layout_marginTop="15dp";
          CardElevation="0dp";
          layout_height="6dp";
          layout_width="60dp";
          radius="2dp";
          backgroundColor="#DEDEDE";
        };
        {
          LinearLayout;
          layout_marginRight="20dp";
          layout_width="match_parent";
          layout_height="100dp";
          orientation="horizontal";
          layout_marginLeft="20dp";
          {
            LinearLayout;
            id="微信捐赠",
            gravity="center";
            layout_width="match_parent";
            layout_height="match_parent";
            orientation="vertical";
            layout_weight="1";
            {
              ImageView;
              layout_height="35dp";
              src="icon/a1.png";
              layout_width="35dp";
            };
            {
              TextView;
              textColor=颜色4,
              text="微信捐赠";
              layout_marginTop="5dp";
            };
          };
          {
            LinearLayout;
            id="QQ捐赠",
            gravity="center";
            layout_width="match_parent";
            layout_height="match_parent";
            orientation="vertical";
            layout_weight="1";
            {
              ImageView;
              layout_height="35dp";
              src="icon/a2.png";
              layout_width="35dp";
            };
            {
              TextView;
              text="QQ捐赠";
              layout_marginTop="5dp";
            };
          };
        };
      };
    };
  };
  dialog=AlertDialog.Builder(this)
  .setView(loadlayout(布局))
  .show()
  RippleHelper(微信捐赠).RippleColor=0x25000000
  RippleHelper(QQ捐赠).RippleColor=0x25000000
  function 微信捐赠.onClick()
    --下载文件(weixin,"/storage/emulated/0/DCIM/Screenshots/weixin_pay.jpg")
    wx={
      LinearLayout;
      layout_height="fill";
      layout_width="fill";
      orientation="vertical";
      {
        LinearLayout;
        layout_height="40%h";
        layout_width="match_parent";
        gravity="center";
        {
          ImageView;
          layout_width="wrap_content";
          layout_height="match_parent";
          --src="icon/mm.bin";
          src='https://www.helloimg.com/images/2022/07/17/ZvP9zS.png';
        };
      };
    };
    dialog=AlertDialog.Builder(this)
    .setView(loadlayout(wx))
    .setPositiveButton("保存并打开微信",{onClick=function(v)
        打开微信()
      end})
    .setNegativeButton("下次一定",{onClick=function(v)
      end})
    .show()
  end
  function QQ捐赠.onClick()
    --下载文件(QQ,"/storage/emulated/0/DCIM/Screenshots/QQ_pay.jpg")
    qq={
      LinearLayout;
      layout_height="fill";
      layout_width="fill";
      orientation="vertical";
      {
        LinearLayout;
        layout_height="40%h";
        layout_width="match_parent";
        gravity="center";
        {
          ImageView;
          layout_width="wrap_content";
          layout_height="match_parent";
          src='https://www.helloimg.com/images/2022/07/17/ZvPIzg.md.png';
        };
      };
    };
    dialog=AlertDialog.Builder(this)
    .setView(loadlayout(qq))
    .setPositiveButton("保存并打开QQ",{onClick=function(v)
        QQ聊天(2049898109)
      end})
    .setNegativeButton("下次一定",{onClick=function(v)
      end})
    .show()
  end
end

function loadGif(image,file)
  import "java.io.*"
  if type(image) == "string" then
    if File(image).isFile() then
      return LuaBitmapDrawable(activity,image)
     else
      return nil
    end
   else
    if File(file).isFile() then
      local load = true
      image.getViewTreeObserver().addOnGlobalLayoutListener{
        onGlobalLayout=function()
          if load then
            local bitmap = LuaBitmapDrawable(activity,file)
            local params = image.getLayoutParams()
            if image.Width==0 then
              local _size=loadbitmap(file)
              params.width = _size.getWidth()
              image.setLayoutParams(params)
              _size.recycle()
            end
            if image.Height==0 then
              local _size=loadbitmap(file)
              params.height = _size.getHeight()
              image.setLayoutParams(params)
              _size.recycle()
            end
            image.background=bitmap
          end
          load = false
        end
      }
    end
  end
end

function 控件圆角(view,InsideColor,radiu)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  view.setBackgroundDrawable(drawable)
end

function 水珠动画(view,time)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(view,"scaleX",{1.2,.8,1.1,.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(view,"scaleY",{1.2,.8,1.1,.9,1}).setDuration(time).start()
end

function 控件消失(控件ID)
  控件ID.setVisibility(View.GONE)
end

function 显示控件(控件ID)
  控件ID.setVisibility(View.VISIBLE)
end
function 弹窗(内容)
  Toast.makeText(activity,内容, Toast.LENGTH_LONG).show()
end

function 写入文件(路径,内容)
  --写入文件
  io.open(路径,"w"):write(内容):close()
end