import "android.net.Uri"
import "android.content.ComponentName"
import "android.content.Intent"
import "android.content.pm.ShortcutInfo"
import "java.util.ArrayList"
import "android.graphics.drawable.Icon"

import "function"

--activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)

--此工程需要打包后运行
--如果不打包运行，那么快捷方式将创建在这个IDE的图标上

intent1 = Intent(Intent.ACTION_MAIN);
intent1.setComponent(ComponentName(activity.getPackageName(),"com.androlua.Main"));
intent1.setData(Uri.parse("num1"));

--id,快捷方式名字,快捷方式被点击后执行的intent,快捷方式的图标地址
SHORTCUT_TABLE={
  {"ID1","上课模式",intent1,activity.getLuaDir().."/icon/15.png"},
}

--快捷方式管理器
scm = activity.getSystemService(activity.SHORTCUT_SERVICE);

--循环添加到对象ArrayList
infos = ArrayList();
for k,v in pairs(SHORTCUT_TABLE) do
  si = ShortcutInfo.Builder(this,v[1])
  .setIcon(Icon.createWithBitmap(loadbitmap(v[4])))
  .setShortLabel(v[2])
  .setLongLabel(v[2])
  .setIntent(v[3])
  .build();
  infos.add(si);
end

--添加快捷方式
scm.setDynamicShortcuts(infos);

--print("快捷方式已创建,不信去长按图标")

function onNewIntent(intent)

  --获得传递过来的数据并转化为字符串
  local uriString = tostring(intent.getData())

  if "num1"==uriString then

    说明="即将打开文件管理器（请选择文本类格式）"
    确认事件=[[调用系统选择文件(function (a)
         activity.newActivity("main_code/main2",{a})
      end)
  xxx.dismiss()]]
    取消事件='xxx.dismiss()'
    弹窗UI("提示",说明,确认事件,取消事件,"取消","选择文件")

   else

  end

end

