require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

import "android.graphics.drawable.ColorDrawable"

activity.setTheme(R.AndLua4)
activity.setTitle("提取安装包")

--by訫念是你
--B站UID:2036485750

layout = {
  RelativeLayout,
  layout_height = "fill",
  layout_width = "fill",
  {
    GridView,
    numColumns = 3,
    layout_marginTop = "5dp",
    verticalSpacing = "0dp",
    layout_height = "fill",
    gravity = "center",
    fastScrollEnabled = true,
    id = "列表",
    horizontalSpacing = "0dp",
    layout_width = "fill"
  },
  {
    TextView,
    textSize = "0sp",
    text = "1",
    textColor = "0x00ffffff",
    id = "gy",
    singleLine = true
  }
}
activity.setContentView(loadlayout(layout))

--这个东西功能还没加,一个装饰品
顶栏 = {
  LinearLayout,
  layout_width = "fill",
  elevation = "0dp",
  layout_height = "55dp",
  orientation = "horizontal",
  {
    LinearLayout,
    layout_height = "fill",
    layout_weight = "90%w",
    {
      EditText,
      layout_width = "-1",
      layout_height = "-1",
      singleLine = true,
      background = "0x00ffffff",
      hint = "找不到就到这输入包名",
      id = "输入",
      textSize = "18sp"
    }
  },
  {
    LinearLayout,
    layout_height = "fill",
    layout_weight = "10%w",
    id="提取",
    {
      TextView,
      layout_gravity = "center",
      textSize = "18sp",
      text = "提取APK",
      singleLine = true
    }
  },
}
activity.ActionBar.setDisplayShowCustomEnabled(true)
activity.ActionBar.setCustomView(loadlayout(顶栏))
activity.ActionBar.setBackgroundDrawable(ColorDrawable(4294967295))

布局 = {
  LinearLayout,
  layout_width = "fill",
  orientation = "vertical",
  layout_height = "fill",
  {
    LinearLayout,
    layout_width = "70dp",
    orientation = "vertical",
    layout_height = "85dp",
    layout_gravity = "center",
    {
      ImageView,
      layout_width = "45dp",
      id = "图片",
      layout_margin = "8dp",
      layout_height = "45dp",
      layout_gravity = "center",
      scaleType = "center"
    },
    {
      TextView,
      layout_marginTop = "-2dp",
      text = "名称",
      id = "应用名称",
      textColor = "#757575",
      singleLine = true,
      layout_gravity = "center"
    },
    {
      TextView,
      id = "应用包名",
      layout_height = "0",
    }
  }
}
data={}
adp=LuaAdapter(activity,data,布局)
列表.Adapter=adp

--导入类
import "android.content.pm.PackageManager"

路径="/storage/emulated/0/Android/data/"
local a=luajava.astable(File(路径).listFiles())
for i=1,#a do
  目录名=a[i].name
  if pcall(function() activity.getPackageManager().getPackageInfo(目录名,0) end) then
    local pm = activity.getPackageManager()
    local pkg = activity.getPackageManager().getPackageInfo(目录名, 0)
    local 名称 = pkg.applicationInfo.loadLabel(activity.getPackageManager())
    local 图标 = pm.getApplicationInfo(tostring(目录名),0)
    local 图标 = 图标.loadIcon(pm)
    adp.add({图片={src=图标},应用名称={text=名称},应用包名={text=目录名}})
   else
  end
end

function 提取安装包(路径,文件名,包名)
  import "java.io.FileOutputStream"
  import "java.io.FileInputStream"
  import "java.lang.Thread"
  import "java.io.File"
  import "java.nio.channels.FileChannel"
  import "android.content.Intent"
  if File(路径).exists()==false then
    File(路径).mkdirs()
  end
  输出 = 路径..文件名
  源 = activity.getPackageManager().getApplicationInfo(包名, 0).sourceDir

  fDest = File(输出);
  if (fDest.exists())
    fDest.delete();
  end
  fDest.createNewFile();
  ina=FileInputStream(File(源));
  out =FileOutputStream(fDest);
  inC = ina.getChannel();
  outC = out.getChannel();

  length = 1024 * 1024;
  while (true)
    if (inC.position() == inC.size())
      inC.close();
      outC.close();
      Toast.makeText(activity,"提取成功！", Toast.LENGTH_LONG).show()
      break
    end
    if ((inC.size() - inC.position()) < 1024 * 1024)
      length = (inC.size() - inC.position());
     else
      length = 1024 * 1024;
    end
    inC.transferTo(inC.position(), length, outC)
    结果=tonumber(inC.position()+length)
    inC.position(结果)
  end
end

function 列表.onItemClick(l,v,p,i)
  bt=v.tag.应用名称.Text
  bt2=v.tag.应用包名.Text
  提取安装包("/sdcard/米环看小说/工具/",bt..".apk",bt2)
  Toast.makeText(activity,"安装包放在/sdcard/米环看小说/工具/", Toast.LENGTH_LONG).show()
end

提取.onClick=function()
  包名=输入.Text
  --先加个判断手机是否安装了这个软件
  if pcall(function() activity.getPackageManager().getPackageInfo(包名,0) end) then
    local pkg = activity.getPackageManager().getPackageInfo(目录名, 0)
    local 名称 = pkg.applicationInfo.loadLabel(activity.getPackageManager())
    提取安装包("/sdcard/米环看小说/工具/",名称..".apk",包名)
   else
    Toast.makeText(activity,"你还没安装这个软件", Toast.LENGTH_LONG).show()
  end
end

--源码链接简介自取