require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

import "function"
import "main_code.tools_function"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import 'android.graphics.Color'

activity.setTheme(R.Theme_Teal)

背景颜色=0xFF545655
背景2颜色=0xFF545655
文字颜色=0xffffffff
阴影颜色=0xFFFFFFFF

全屏框架={
  LinearLayout,--线性布局
  orientation='vertical',--方向
  layout_width='fill',--宽度
  layout_height='fill',--高度
  background='#FFFFFF',--背景颜色或图片路径
  {
    ScrollView,--纵向滑动控件
    layout_width="fill",--布局宽度
    layout_height="100%h",
    overScrollMode=View.OVER_SCROLL_NEVER,
    verticalScrollBarEnabled=false,
    {
      LinearLayout,--线性布局
      orientation='vertical',--方向
      layout_width='fill',--宽度
      layout_height='fill',--高度
      background='#FFFFFF',--背景颜色或图片路径
      {
        LinearLayout,
        layout_marginTop='8%w';--顶距
        layout_margin='5%w';--边距
        layout_gravity='center';
        orientation='vertical',--方向
        layout_width='50%w',--宽度
        layout_height='50%w',
        {
          CardView;
          layout_gravity='center';--重力
          layout_width='fill';--宽度
          layout_height='fill';--高度
          layout_margin='5dp';--边距
          CardBackgroundColor=背景颜色;
          Elevation="5dp";
          id="卡";
          {
            TextView;--文本控件
            layout_gravity='center';
            gravity='center';--重力
            layout_width='fill';
            layout_height='fill';
            textColor=文字颜色,
            text='图标';
            textSize='15';
            id="字";
            layout_marginTop=文字y;
            layout_marginLeft=文字x;
          };

        };
      };
      {
        CardView;
        radius="8dp";
        layout_width="match_parent";
        Elevation="0dp";
        layout_margin="16dp";
        layout_marginTop="0dp";
        backgroundColor='0xFFB5B3B6',
        {
          LinearLayout;--线性布局
          Orientation='vertical';--布局方向
          layout_width='fill';--布局宽度
          layout_height='fill';
          {
            TextView;
            text='圆角弧度';
            layout_marginLeft='18dp';
            layout_margin='8dp';
            textColor=背景颜色,
            id="背景颜色选择",
            TextSize="9dp",
          };
          {
            SeekBar;
            layout_margin='8dp';
            layout_marginTop="0dp";
            id='圆角弧度';
            layout_width='fill';
          },
        },
      },
      {
        CardView;
        radius="8dp";
        layout_width="match_parent";
        Elevation="0dp";
        layout_margin="16dp";
        layout_marginTop="0dp";
        backgroundColor='0xFFB5B3B6',
        {
          LinearLayout;--线性布局
          Orientation='vertical';--布局方向
          layout_width='fill';--布局宽度
          layout_height='fill';
          {
            TextView;
            text='文字阴影';
            layout_marginLeft='18dp';
            layout_margin='8dp';
            textColor=阴影颜色,
            id="阴影颜色选择",
            TextSize="9dp",
          };
          {
            SeekBar;
            layout_margin='8dp';
            layout_marginTop="0dp";
            id='阴影';
            layout_width='fill';
          },
          {
            TextView;
            text='偏移量X';
            layout_marginLeft='18dp';
            layout_margin='8dp';
            textColor=阴影颜色,
            TextSize="5dp",
          };
          {
            SeekBar;
            layout_margin='8dp';
            layout_marginTop="0dp";
            id='偏移量x';
            layout_width='fill';
          },
          {
            TextView;
            text='偏移量Y';
            layout_marginLeft='18dp';
            layout_margin='8dp';
            textColor=阴影颜色,
            TextSize="5dp",
          };
          {
            SeekBar;
            layout_margin='8dp';
            layout_marginTop="0dp";
            id='偏移量y';
            layout_width='fill';
          },
        },
      },
      {
        CardView;
        radius="8dp";
        layout_width="match_parent";
        Elevation="0dp";
        layout_margin="16dp";
        layout_marginTop="0dp";
        backgroundColor='0xFFB5B3B6',
        {
          LinearLayout;--线性布局
          Orientation='vertical';--布局方向
          layout_width='fill';--布局宽度
          layout_height='fill';
          {
            TextView;
            text='文字大小';
            layout_marginLeft='18dp';
            layout_margin='8dp';
            textColor=文字颜色,
            TextSize="9dp",
            id="文字颜色选择",
          };
          {
            SeekBar;
            layout_margin='8dp';
            layout_marginTop="0dp";
            id='内容范围';
            layout_width='fill';
          },
          {
            TextView;
            text='偏移量X';
            layout_marginLeft='18dp';
            layout_margin='8dp';
            textColor=阴影颜色,
            TextSize="5dp",
          };
          {
            SeekBar;
            layout_margin='8dp';
            layout_marginTop="0dp";
            id='文字偏移量x';
            layout_width='fill';
          },
          {
            TextView;
            text='偏移量Y';
            layout_marginLeft='18dp';
            layout_margin='8dp';
            textColor=阴影颜色,
            TextSize="5dp",
          };
          {
            SeekBar;
            layout_margin='8dp';
            layout_marginTop="0dp";
            id='文字偏移量y';
            layout_width='fill';
          },
          {
            TextView;
            text='偏移量z';
            layout_marginLeft='18dp';
            layout_margin='8dp';
            textColor=阴影颜色,
            TextSize="5dp",
          };
          {
            SeekBar;
            layout_margin='8dp';
            layout_marginTop="0dp";
            id='文字偏移量z';
            layout_width='fill';
          },
        },
      },
    },
  },
  {
    LinearLayout,--线性布局
    orientation='vertical',--方向
    layout_width='fill',--宽度
    layout_height='wrap',--高度
    background='#00FFFFFF',
    layout_gravity="center";
    {
      Button;
      id="保存";
      layout_width='40%w';--宽度
      layout_margin='1%w';--边距
      layout_gravity="center";
      text="保存";
    };
  };
};
activity.setContentView(loadlayout(全屏框架))
状态栏()
activity.ActionBar.hide()

function 文字图标()
  弹窗框架2=
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
        layout_height='wrap';
        background='0xFF4AB199',
        {
          LinearLayout,
          layout_padding='10%';
          gravity='left|top';
          orientation='vertical',
          layout_width='fill',
          layout_height=高度,
          background='#ffffffff',
          {
            TextView,
            layout_width="fill",
            layout_margin='3%w',
            text='文字内容：';
            layout_height="25dp",
            layout_gravity="center|left",
            textColor="0xFF757575",
            textSize='18dp';
          };
          {
            EditText;
            id="link",
            layout_width="70%w";
            layout_margin='3%w';
            singleLine=true;
            layout_gravity="center";
            background="0xFF000000",
            textColor="#FF808080",
            Hint="";
          };
        },
        {
          TextView,
          layout_width="fill",
          layout_height="3px",
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
            layout_width='40%w',
            layout_height='fill',
            background='#00FFFFFF',
            {
              TextView;
              gravity='center';
              layout_width='fill';
              layout_height='fill';
              textColor='#ff757575';
              text='关闭';
              textSize='16dp';
              id="取消2"
            };
          };
          {
            TextView,
            layout_width="3px",
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
              textColor='0xFF33AF89';
              text='开始';
              textSize='16dp';
              id="确认2"
            };
          };
        };
      };
    };
  }
  xx=AlertDialog.Builder(this)
  xx.setView(loadlayout(弹窗框架2))
  xx=xx.show()
  import "android.graphics.drawable.ColorDrawable"
  xx.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))
  确认2.onClick=function()
    if link.Text=="" then
      提示("没有内容")
     else
      字.setText(link.Text)
      xx.dismiss()
    end
  end;
  取消2.onClick=function()
    xx.dismiss()
  end;
  确认2.foreground=波纹特效v2(0xFFCECECE)
  取消2.foreground=波纹特效v2(0xFFCECECE)
end
function SavePicture(id)
  import "java.io.FileOutputStream"
  import "java.io.File"
  import "android.graphics.Bitmap"
  id.setDrawingCacheEnabled(true)
  local obmp = Bitmap.createBitmap(id.getDrawingCache());
  if obmp then
    local filepath ="/storage/emulated/0/DCIM/Screenshots/"..os.time()..".png"
    local f = File(tostring(filepath))
    local out = FileOutputStream(f)
    obmp.compress(Bitmap.CompressFormat.PNG,95,out)
    out.flush()
    out.close()
    id.setDrawingCacheEnabled(false)
    import "android.media.MediaScannerConnection"
    import "java.io.File"
    MediaScannerConnection.scanFile(activity,{File(filepath).getAbsolutePath()}, nil, nil)
    --调用方法
    提示("已保存至系统相册")
    return true
   else
    提示("保存过程中出现了点错误")
    return false
  end
end

拖动1=0xFF
拖动2=0xFF
拖动3=0xFF
拖动4=0xFF

function 取色器视图()
  取色器={
    LinearLayout;
    orientation="vertical";
    layout_width="fill";
    layout_height="fill";
    gravity="center";
    {
      CardView;
      id="卡片图";
      layout_margin="10dp";
      radius="40dp",
      elevation="0dp",
      layout_width="20%w";
      layout_height="20%w";
    };
    {
      TextView;
      layout_margin="0dp";
      textSize="12sp";
      id="颜色文本";
      textColor=左侧栏项目色;
    };
    {
      SeekBar;
      id="拖动一";
      layout_margin="15dp";
      layout_width="match";
      layout_height="wrap";
    };
    {
      SeekBar;
      id="拖动二";
      layout_margin="15dp";
      layout_width="match";
      layout_height="wrap";
    };
    {
      SeekBar;
      id="拖动三";
      layout_margin="15dp";
      layout_width="match";
      layout_height="wrap";
    };
    {
      SeekBar;
      id="拖动四";
      layout_margin="15dp";
      layout_width="match";
      layout_height="wrap";
    };
  };
  local 取色器=loadlayout(取色器)
  拖动一.setMax(255)
  拖动二.setMax(255)
  拖动三.setMax(255)
  拖动四.setMax(255)
  拖动一.setProgress(拖动1)
  拖动二.setProgress(拖动2)
  拖动三.setProgress(拖动3)
  拖动四.setProgress(拖动4)
  拖动二.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xffff0000,PorterDuff.Mode.SRC_ATOP))
  拖动二.Thumb.setColorFilter(PorterDuffColorFilter(0xffff0000,PorterDuff.Mode.SRC_ATOP))
  拖动三.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFF00FF00,PorterDuff.Mode.SRC_ATOP))
  拖动三.Thumb.setColorFilter(PorterDuffColorFilter(0xFF00FF00,PorterDuff.Mode.SRC_ATOP))
  拖动四.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFF0000FF,PorterDuff.Mode.SRC_ATOP))
  拖动四.Thumb.setColorFilter(PorterDuffColorFilter(0xFF0000FF,PorterDuff.Mode.SRC_ATOP))

  拖动一.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end}
  拖动二.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end}
  拖动三.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end}
  拖动四.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end}
  function updateArgb()
    local a=拖动一.getProgress()
    local r=拖动二.getProgress()
    local g=拖动三.getProgress()
    local b=拖动四.getProgress()
    local argb_hex=(a<<24|r<<16|g<<8|b)
    颜色文本.Text=string.format("%#x", argb_hex)
    卡片图.setCardBackgroundColor(argb_hex)
    if 参数==true then
      卡.setCardBackgroundColor(argb_hex)
      背景颜色选择.setTextColor(argb_hex)
      圆角弧度.ProgressDrawable.setColorFilter(PorterDuffColorFilter(argb_hex,PorterDuff.Mode.SRC_ATOP))
      圆角弧度.Thumb.setColorFilter(PorterDuffColorFilter(argb_hex,PorterDuff.Mode.SRC_ATOP))
     elseif 参数==false then
      字.setTextColor(argb_hex)
      文字颜色选择.setTextColor(argb_hex)
      内容范围.ProgressDrawable.setColorFilter(PorterDuffColorFilter(argb_hex,PorterDuff.Mode.SRC_ATOP))
      内容范围.Thumb.setColorFilter(PorterDuffColorFilter(argb_hex,PorterDuff.Mode.SRC_ATOP))
     elseif 参数==nil then
      阴影颜色选择.setTextColor(argb_hex)
      阴影.ProgressDrawable.setColorFilter(PorterDuffColorFilter(argb_hex,PorterDuff.Mode.SRC_ATOP))
      阴影.Thumb.setColorFilter(PorterDuffColorFilter(argb_hex,PorterDuff.Mode.SRC_ATOP))
      阴影变换(阴影大小,argb_hex,x,y)
      阴影颜色=argb_hex
    end
    拖动1=a
    拖动2=r
    拖动3=g
    拖动4=b
  end
  updateArgb()
  对话框=AlertDialog.Builder(this)
  .setView(取色器)
  .show()
end

function 阴影变换(阴影大小,阴影颜色,偏移量_x,偏移量_y)
  字.setBackgroundDrawable(LuaDrawable(function(canvas,paint,view_drawable)
    字.setShadowLayer(阴影大小,偏移量_x,偏移量_y,阴影颜色)
  end))
end


控件圆角(保存,0x4D000000,20)

保存.onClick=function()
  SavePicture(卡)
end
字.onClick=function()
  文字图标()
end

背景颜色选择.onClick=function()
  参数=true
  取色器视图()
end
阴影颜色选择.onClick=function()
  参数=nil
  取色器视图()
end
文字颜色选择.onClick=function()
  参数=false
  取色器视图()
end

圆角=88
圆角弧度.setMax(300)
圆角弧度.setProgress(88)
圆角弧度.ProgressDrawable.setColorFilter(PorterDuffColorFilter(背景颜色,PorterDuff.Mode.SRC_ATOP))
圆角弧度.Thumb.setColorFilter(PorterDuffColorFilter(背景颜色,PorterDuff.Mode.SRC_ATOP))
卡.radius=圆角

阴影大小=0
阴影.setMax(50)
阴影.setProgress(0)
阴影.ProgressDrawable.setColorFilter(PorterDuffColorFilter(阴影颜色,PorterDuff.Mode.SRC_ATOP))
阴影.Thumb.setColorFilter(PorterDuffColorFilter(阴影颜色,PorterDuff.Mode.SRC_ATOP))

x=0
y=0
偏移量x.setMax(300)
偏移量x.setProgress(150)
偏移量y.setMax(300)
偏移量y.setProgress(150)
阴影变换(阴影大小,阴影颜色,x,y)

内容范围.setMax(200)
内容范围.setProgress(80)
内容范围.ProgressDrawable.setColorFilter(PorterDuffColorFilter(文字颜色,PorterDuff.Mode.SRC_ATOP))
内容范围.Thumb.setColorFilter(PorterDuffColorFilter(文字颜色,PorterDuff.Mode.SRC_ATOP))
字.setTextSize(80)

文字x=0
文字y=0
文字z=0
文字偏移量x.setMax(200)
文字偏移量x.setProgress(100)
文字偏移量y.setMax(200)
文字偏移量y.setProgress(100)
文字偏移量z.setMax(360)
文字偏移量z.setProgress(180)

圆角弧度.setOnSeekBarChangeListener{
  onProgressChanged=function()
    圆角=圆角弧度.getProgress()
    卡.radius=圆角
  end,}

偏移量x.setOnSeekBarChangeListener{
  onProgressChanged=function()
    x=偏移量x.getProgress()-150
    阴影变换(阴影大小,阴影颜色,x,y)
  end,}
偏移量y.setOnSeekBarChangeListener{
  onProgressChanged=function()
    y=偏移量y.getProgress()-150
    阴影变换(阴影大小,阴影颜色,x,y)
  end,}
阴影.setOnSeekBarChangeListener{
  onProgressChanged=function()
    阴影大小=阴影.getProgress()
    阴影变换(阴影大小,阴影颜色,x,y)
  end,}


内容范围.setOnSeekBarChangeListener{
  onProgressChanged=function(a)
    字.setTextSize(a.Progress)
  end,}
文字偏移量x.setOnSeekBarChangeListener{
  onProgressChanged=function(a)
    文字x=文字偏移量x.getProgress()-100
    字.setRotationX(文字x)
  end,}
文字偏移量y.setOnSeekBarChangeListener{
  onProgressChanged=function(a)
    文字y=文字偏移量y.getProgress()-100
    字.setRotationY(文字y)
  end,}
文字偏移量z.setOnSeekBarChangeListener{
  onProgressChanged=function(a)
    文字z=文字偏移量z.getProgress()-180
    字.setRotation(文字z)
  end,}