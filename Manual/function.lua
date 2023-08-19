function 控件消失(控件ID)
  控件ID.setVisibility(View.GONE)
end

function 显示控件(控件ID)
  控件ID.setVisibility(View.VISIBLE)
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
            layout_height='50%h';
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
  function 波纹特效v2(颜色)
    import"android.content.res.ColorStateList"
    return activity.Resources.getDrawable(activity.obtainStyledAttributes({android.R.attr.selectableItemBackground--[[Borderless]]}).getResourceId(0,0))
    .setColor(ColorStateList(int[0]
    .class{int{}},int{颜色 or 0x20000000}))
  end
  确认.onClick=function()
    assert(loadstring(确认事件))()
  end;
  取消.onClick=function()
    assert(loadstring(取消事件))()
  end;
  确认.foreground=波纹特效v2(0xFFCECECE)
  取消.foreground=波纹特效v2(0xFFCECECE)
end

function 弹窗(内容)
  Toast.makeText(activity,内容, Toast.LENGTH_LONG).show()
end

function 写入文件(路径,内容)
--写入文件
io.open(路径,"w"):write(内容):close()
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