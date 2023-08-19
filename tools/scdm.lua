require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"
activity.setTheme(R.Theme_Teal)

layout={
  LinearLayout,
  layout_width="fill",
  layout_height="fill",
  orientation="vertical";
  Gravity="center|top",
  BackgroundColor="0xffffffff",
  {
    LinearLayout,
    layout_width="fill",
    layout_height="fill",
    BackgroundColor="0xFF000000",
    id="back";
    {
      MarText;
      id="text";
      singleLine="true";
      layout_height="match_parent";
      layout_width="match_parent";
      TextSize="80sp",
      textColor="0xffffffff",
      Gravity="center",
      ellipsize="marquee";
    };
  },
  {
    CardView,
    layout_marginTop="100dp",
    layout_width="85%w",
    layout_height="44dp",
    radius="22dp",
    cardElevation="0",
    background="#FFEAEAEA",
    {
      LinearLayout,
      layout_width="fill",
      layout_height="44dp",
      {
        EditText,
        layout_weight="1",
        layout_height="44dp",
        background="#00000000",
        paddingLeft="20dp",
        textColor="#FF808080",
        singleLine="true",
        id="edit",
        hint="弹幕内容:",
      },
      {
        ImageView,
        layout_width="44dp",
        layout_height="44dp",
        padding="12dp",
        colorFilter="#80808080",
        src="icon/send.png",
        id="start",
      },
    },
  },
}
activity.setContentView(loadlayout(layout))
activity.ActionBar.hide()
状态栏()

function bu()
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

back.setVisibility(View.GONE)

start.onClick=function()
  if edit.Text=="" then
    提示('请输入')
   else
    bu()
    back.setVisibility(View.VISIBLE)
    activity.setRequestedOrientation(0);
    text.setText(edit.Text)
  end
end