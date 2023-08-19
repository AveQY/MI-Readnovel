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
          layout_width="match_parent";
          orientation="vertical";
          layout_marginLeft="3dp";
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
            text="社区论坛";
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
      LuaWebView;
      id="web",
      layout_height="fill";
      layout_width="fill";
    };
  },
};

activity.setContentView(loadlayout(layout))
activity.ActionBar.hide()
状态栏()
设置一言()

--[[
数据=web
openid=io.open(activity.getLuaDir().."/user_openid.log"):read("*a");
nickname = io.open("/sdcard/米环看小说/data/user_name.log"):read("*a");
img="https://www.helloimg.com/images/2022/06/19/ZSNYWm.png"
--img2="https://www.helloimg.com/images/2022/06/24/ZHGz1b.jpg"

]]
主链接= "https://support.qq.com/product/413513";

主链接2="https://support.qq.com/embed/phone/413513/#label=show"
链接=...

if 链接==nil then
  web.loadUrl(主链接2)
  -- postData="nickname="..nickname.."&avatar="..img.."&openid="..openid.."&customInfo="..获取设备标识()
  -- 数据.postUrl(主链接2,String(postData).getBytes())
 else
  web.loadUrl(链接)
  -- postData="nickname="..nickname.."&avatar="..img.."&openid="..openid.."&customInfo="..获取设备标识()
  --数据.postUrl(链接,String(postData).getBytes())
end


img_.onClick=function()
  activity.finish()
end

