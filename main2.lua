require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

activity.setTheme(R.Theme_Teal)
layout={
  LinearLayout;
  gravity="center|top";
  --background="https://www.helloimg.com/images/2022/06/18/ZS0N8q.png",
  layout_height="fill";
  layout_width="fill";

  {
    CardView;
    layout_margin="24dp";
    cardElevation="0dp";
    layout_marginTop="22%h";
    radius=15;
    backgroundColor="0x00FFFF00";
    {
      RelativeLayout;
      layout_height="fill";
      layout_width="fill";
      focusableInTouchMode=true;
      focusable=true;

      {
        EditText;
        layout_height="wrap";
        layout_width="fill";
        layout_centerHorizontal="true";
        id="edit";
        singleLine="true";
        background="0";
        textSize="14dp";
        layout_marginTop="56";
        InputType="number";
        layout_marginLeft="16dp";
        layout_marginRight="16dp";
      };
      {
        TextView;
        layout_height="1dp";
        layout_width="fill";
        layout_alignBottom="edit";
        id="text1";
        layout_centerHorizontal="true";
        background="#000000";
        alpha="0.2";
        layout_marginLeft="16dp";
        layout_marginRight="16dp";
      };
      {
        TextView;
        layout_height="2dp";
        layout_width="fill";
        layout_alignBottom="edit";
        id="text";
        layout_centerHorizontal="true";
        background="#ff9688";
        alpha="1";
        layout_marginLeft="16dp";
        layout_marginRight="16dp";
      };
      {
        EditText;
        layout_below="edit";
        layout_width="90%w";
        layout_centerHorizontal="true";
        singleLine="true";
        layout_height="wrap";
        layout_marginTop="16dp";
        id="edit1";
        background="0";
        textSize="14dp";
        layout_marginTop="56";
        layout_marginLeft="16dp";
        layout_marginRight="16dp";
      };
      {
        TextView;
        layout_height="1dp";
        layout_width="89%w";
        layout_alignBottom="edit1";
        id="text2";
        layout_centerHorizontal="true";
        background="#000000";
        alpha="0.2";
        layout_marginLeft="16dp";
        layout_marginRight="16dp";
      };
      {
        TextView;
        layout_height="2dp";
        layout_width="89%w";
        layout_alignBottom="edit1";
        id="text1";
        layout_centerHorizontal="true";
        background="#ff9688";
        alpha="1";
        layout_marginLeft="16dp";
        layout_marginRight="16dp";
      };
      {
        Button;
        layout_below="edit1";
        layout_width="90%w";
        layout_centerHorizontal="true";
        layout_height="wrap";
        layout_marginBottom="16dp";
        text="登录即代表你同意《用户协议》";
        id="button";
        layout_marginTop="16dp";
        textSize="14dp";
        layout_marginLeft="16dp";
        layout_marginRight="16dp";
        backgroundColor="0xFF313531";
        textColor="#ffffff";
      };
      {
        TextView;
        text="QQ(获取头像用的)";
        layout_alignBaseline="edit";
        textSize="14dp";
        layout_marginLeft="24dp";
        id="用户名";
      };
      {
        TextView;
        text="用户名";
        layout_alignBaseline="edit1";
        textSize="14dp";
        layout_marginLeft="24dp";
        id="密码";
      };
    };
  };
};
activity.setContentView(loadlayout(layout))
--隐藏标题栏
activity.ActionBar.hide()
状态栏()

import "android.text.InputFilter"
import "android.text.method.DigitsKeyListener"
edit1.setFilters{InputFilter.LengthFilter(8)}

edit.setOnFocusChangeListener{
  onFocusChange=function( v, hasFocus)
    if hasFocus==true then
      import "android.view.animation.ScaleAnimation"
      text.startAnimation(ScaleAnimation(0.0,1.0,1.0,1.0,1,0.5,1,0.5).setDuration(200))
      text.setVisibility(View.VISIBLE)
      if edit.text=="" then
        import "android.view.animation.TranslateAnimation"
        用户名.startAnimation(TranslateAnimation(0,0,0,-56).setDuration(100).setFillAfter(true))
      end
     else
      text.startAnimation(ScaleAnimation(1.0,0.0,1.0,1.0,1,0.5,1,0.5).setDuration(200))
      text.setVisibility(View.INVISIBLE)
      if edit.text=="" then
        用户名.startAnimation(TranslateAnimation(0,0,-56,0).setDuration(100).setFillAfter(true))
      end
    end
  end}
text.setVisibility(View.INVISIBLE)

edit1.setOnFocusChangeListener{
  onFocusChange=function( v, hasFocus)
    if hasFocus==true then
      import "android.view.animation.ScaleAnimation"
      text1.startAnimation(ScaleAnimation(0.0,1.0,1.0,1.0,1,0.5,1,0.5).setDuration(200))
      text1.setVisibility(View.VISIBLE)
      if edit1.text=="" then
        import "android.view.animation.TranslateAnimation"
        密码.startAnimation(TranslateAnimation(0,0,0,-56).setDuration(100).setFillAfter(true))
      end
     else
      text1.startAnimation(ScaleAnimation(1.0,0.0,1.0,1.0,1,0.5,1,0.5).setDuration(200))
      text1.setVisibility(View.INVISIBLE)
      if edit1.text=="" then
        密码.startAnimation(TranslateAnimation(0,0,-56,0).setDuration(100).setFillAfter(true))
      end
    end
  end}
--默认关闭焦点
text1.setVisibility(View.INVISIBLE)

--取消焦点
button. onClick=function()
  if edit.Text=="" then
    提示("请输入QQ号")
   elseif edit1.text=="" then
    提示("请输入用户名")
   else
    提示("正在登录...")
    pnglink="http://q1.qlogo.cn/g?b=qq&nk="..edit.Text.."&s=100"
    写入文件("/storage/emulated/0/米环看小说/data/user_scr.log",pnglink)
    写入文件("/storage/emulated/0/米环看小说/data/user_name.log",edit1.Text)
    写入文件("/storage/emulated/0/米环看小说/data/user_ind.log","保持热爱,奔赴山海！")
    local dl=ProgressDialog.show(activity,nil,'登录中')
    dl.show()
    local a=0
    local tt=Ticker()
    tt.start()
    tt.onTick=function()
      a=a+1
      if a==3 then
        activity.finish()
        提示("登录成功")
        activity.newActivity("main")
        dl.dismiss()
        tt.stop()
      end
    end
  end
end
function 底部弹窗(内容,按钮,颜色,文字颜色,按钮文字颜色)
  import "android.animation.Animator"
  SnackerBar={shouldDismiss=true}
  import "android.animation.ValueAnimator"
  local w=activity.width
  import "android.view.animation.AccelerateDecelerateInterpolator"
  local layout={
    LinearLayout,
    Gravity="bottom",
    {
      LinearLayout,
      layout_height=-2,
      layout_width=-1,
      Gravity="center",
      BackgroundColor=颜色,
      {
        TextView,
        textColor=文字颜色,
        layout_weight=.8,
        paddingLeft="10dp",
        paddingTop="5dp",
        paddingBottom="5dp",
        layout_width=0,
      },
      {
        Button,
        layout_height=-2,
        style="?android:attr/buttonBarButtonStyle",
        text="DONE",
        textColor=按钮文字颜色,
      }
    }
  }
  local function addView(view)
    local mLayoutParams=ViewGroup.LayoutParams
    (-1,-1)
    activity.Window.DecorView.addView(view,mLayoutParams)
  end
  local function removeView(view)
    activity.Window.DecorView.removeView(view)
  end
  function SnackerBar:msg(textMsg)
    self.textView.text=textMsg
    return self
  end
  function SnackerBar:actionText(textAction)
    self.actionView.text=textAction
    return self
  end
  function SnackerBar:action(func)
    self.actionView.onClick=
    function()
      func()
      self:dismiss()
    end
    return self
  end
  function SnackerBar:show()
    local view=self.view
    addView(view)
    view.translationY=300
    view.animate().translationY(0)
    .setInterpolator(AccelerateDecelerateInterpolator())
    .setDuration(400).start()
    indefiniteDismiss(self)
  end
  function indefiniteDismiss(snackerBar)
    task(2000,function()
      if snackerBar.shouldDismiss==true then
        snackerBar:dismiss()
       else
        indefiniteDismiss(snackerBar)
      end
    end)
  end
  function SnackerBar:dismiss()
    local view=self.view
    view.animate().translationY(300)
    .setDuration(400)
    .setListener(Animator.AnimatorListener{
      onAnimationEnd=function()
        removeView(view)
      end
    }).start()
  end
  SnackerBar.__index=SnackerBar
  function SnackerBar.build()
    local mSnackerBar={}
    setmetatable(mSnackerBar,SnackerBar)
    mSnackerBar.view=loadlayout(layout)
    mSnackerBar.bckView=mSnackerBar.view
    .getChildAt(0)
    mSnackerBar.textView=mSnackerBar.bckView
    .getChildAt(0)
    mSnackerBar.actionView=mSnackerBar.bckView
    .getChildAt(1)
    local function animate(v,tx,dura)
      ValueAnimator().ofFloat({v.translationX,tx}).setDuration(dura)
      .addUpdateListener( ValueAnimator.AnimatorUpdateListener
      {
        onAnimationUpdate=function( p1)
          local f=p1.animatedValue
          v.translationX=f
          v.alpha=1-math.abs(v.translationX)/w
        end
      }).addListener(ValueAnimator.AnimatorListener{
        onAnimationEnd=function()
          if math.abs(tx)>=w then
            removeView(mSnackerBar.view)
          end
        end
      }).start()
    end
    local frx,p,v,fx=0,0,0,0
    mSnackerBar.bckView.setOnTouchListener(View.OnTouchListener{
      onTouch=function(view,event)
        if event.Action==event.ACTION_DOWN then
          mSnackerBar.shouldDismiss=false
          frx=event.x
          fx=event.x
         elseif event.Action==event.ACTION_MOVE then
          if math.abs(event.rawX-frx)>=2 then
            v=math.abs((frx-event.rawX)/(os.clock()-p)/1000)
          end
          p=os.clock()
          frx=event.rawX
          view.translationX=frx-fx
          view.alpha=1-math.abs(view.translationX)/w
         elseif event.Action==event.ACTION_UP then
          mSnackerBar.shouldDismiss=true
          local tx=view.translationX
          if tx>=w/5 then
            animate(view,w,(w-tx)/v)
           elseif tx>0 and tx<w/5 then
            animate(view,0,tx/v)
           elseif tx<=-w/5 then
            animate(view,-w,(w+tx)/v)
           else
            animate(view,0,-tx/v)
          end
          fx=0
        end
        return true
      end
    })
    return mSnackerBar
  end
  SnackerBar.build()
  :msg(内容)
  :actionText(按钮)
  :action(function()
    --事件
  end)
  :show()
end
参数=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if 参数+2 > tonumber(os.time()) then
      activity.newActivity("main")
      SearchViewLayout.setVisibility(View.VISIBLE)
     elseif 参数+3 > tonumber(os.time()) then
      activity.newActivity("main")
      activity.finish()
     else
      底部弹窗("再次按一次返回退出","",0xFF000000,0xFFFFFFFF,0xFF4FA68B)
      参数=tonumber(os.time())
    end
    return true
  end
end
