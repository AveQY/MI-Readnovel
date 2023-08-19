require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

activity.setTheme(R.Theme_Teal)
layout={
  LinearLayout;
  gravity="center";
  orientation="vertical";
  layout_width="match_parent";
  layout_height="match_parent";
  {
    LuaWebView;
    id="web";
    layout_width="match_parent";
    layout_height="match_parent";
  };
};

activity.setContentView(loadlayout(layout))
--隐藏标题栏
activity.ActionBar.hide()
状态栏()
全屏()

web.loadUrl(...)
web.requestFocusFromTouch()--设置支持获取手势焦点
web.setWebViewClient{
  shouldOverrideUrlLoading=function(view,url)

  end,
  onPageStarted=function(view,url,favicon)
  end,
  onPageFinished=function(view,url)
  end}