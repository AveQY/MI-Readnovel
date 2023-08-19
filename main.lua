require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

import "main_code.content"
import "function"
import "http"

import "android.widget.EditText"
import "android.content.Context"
import "android.graphics.drawable.GradientDrawable"
import "android.app.Notification"
import "android.provider.MediaStore"
import "android.widget.TextView"
import "android.provider.DocumentsContract"
import "android.os.Build"
import "android.app.AlertDialog"
import "android.content.Intent"
import "android.app.NotificationManager"
import "java.lang.String"
import "android.net.Uri"
import "java.io.File"

--创建快捷方式
import 'main_code.fastway'

文件()

layout={DrawerLayout,id="mDrawer"}

activity.setTheme(R.Theme_Teal)
activity.setTitle("米环看小说")
activity.ActionBar.hide()
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);

table.insert(layout,content)
activity.setContentView(loadlayout(layout))
状态栏()

appp=activity.getWidth()
local kuan=appp/2
huadong.setOnPageChangeListener(PageView.OnPageChangeListener{
  onPageScrolled=function(a,b,c)
    if a==0 then
      img1.setVisibility(View.VISIBLE)
      img2.setVisibility(View.GONE)
      toolbar_one.setVisibility(View.VISIBLE)
     elseif a==1 then--分类
      img1.setVisibility(View.GONE)
      img2.setVisibility(View.VISIBLE)
      toolbar_one.setVisibility(View.VISIBLE)
    end
  end})

import "android.content.res.ColorStateList"
local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
local typedArray =activity.obtainStyledAttributes(attrsArray)
ripple=typedArray.getResourceId(0,0)
aoos=activity.Resources.getDrawable(ripple)
c1.onClick=function()
  水珠动画(c1,500)
  huadong.showPage(0)
end
c2.onClick=function()
  水珠动画(c2,500)
  huadong.showPage(1)
end

设置一言()
更新()
公告()
openid=io.open(activity.getLuaDir().."/user_openid.log"):read("*a");
user_pnglink=io.open("/sdcard/米环看小说/data/user_scr.log"):read("*a")
user_png.setImageBitmap(loadbitmap(user_pnglink))

b1.onClick=function()--自定义文本
  水珠动画(b1,500)
  输入对话框()
end
b2.onClick=function()--小说选择
  水珠动画(b2,500)
  说明="即将打开文件管理器（请选择文本类格式）"
  确认事件=[[调用系统选择文件(function (a)
         activity.newActivity("main_code/main2",{a})
      end)
  xxx.dismiss()]]
  取消事件='xxx.dismiss()'
  弹窗UI("提示",说明,确认事件,取消事件,"取消","选择文件")
end
b3.onClick=function()--随机一文
  水珠动画(b3,500)
  import "android.text.method.*"
  import "android.text.Html"
  Http.get("https://meiriyiwen.com/",function(a,b,c,d)
    htmltxt=b:match('<div class="container">(.-)class="randomBox"')
    内容=Html.fromHtml(htmltxt)
    通知(内容)
    提示("已送达")
  end)
end
b4.onClick=function()
  水珠动画(b4,500)
  activity.newActivity("main_code/bao")
end
b5.onClick=function()
  水珠动画(b5,500)
  小说下载输入()
end
b6.onClick=function()
  水珠动画(b6,500)
  activity.newActivity("main_code/Dial")
end
b7.onClick=function()
  activity.newActivity("main_code/tools")
end
b8.onClick=function()
  activity.newActivity("forum/main",true)
end
