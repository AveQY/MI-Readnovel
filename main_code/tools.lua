require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

import "function"
import "main_code.tools_function"
import "android.animation.LayoutTransition"

function dp2px(dpValue)
  local scale = activity.getResources().getDisplayMetrics().scaledDensity
  return dpValue * scale + 0.5
end

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
        layout_width="fill";
        orientation="horizontal";
        layout_marginLeft="15dp";
        {
          LinearLayout;
          layout_height="match_parent";
          layout_width="80%w";
          orientation="vertical";
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
            layout_marginLeft="15dp";
            text="小工具";
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
            layout_marginLeft="15dp";
            text="";
          };
        };
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
            TextView;
            layout_marginLeft="-150dp";
            layout_width="0dp";
            layout_marginTop="60dp";
            backgroundColor="0xffffffff";
            layout_height="0dp";
            id="menu";
            textColor="#757575";
          };
        };
      };
    };
  };
  {
    LinearLayout;
    layout_height="fill";
    layout_width="fill";
    backgroundColor=0xffffffff;
    {
      ListView,
      id="list",
      layoutTransition=LayoutTransition()
      .enableTransitionType(LayoutTransition.CHANGING),
      layout_width="fill",
      layout_height="fill",
    },
  },
}
activity.setContentView(loadlayout(layout))
activity.ActionBar.hide()
设置一言()
状态栏()


list.adapter=LuaAdapter(activity,
{
  RelativeLayout;
  id="background",
  {
    LinearLayout;
    layout_width="100%w";
    layout_height="80dp";
    id="upns";
    {
      ImageView;
      id="image",
      layout_height="26dp";
      layout_width="26dp";
      padding="2dp",
      layout_gravity="center";
    };
    {
      TextView;
      layout_gravity="left|center";
      layout_marginLeft="8dp";
      id="title",
      textSize="13dp";
    };
    {
      TextView;
      id="data";
      layout_width="0";
      layout_height="0";
    };
  };
})
function bulidTree(title,level,parent,id,...)
  local result,childs={
    title=title,
    level=level,
    id=id,
    parent=parent,
  },{...}
  if(#childs)>0 then
    result.child={}
    table.foreach(childs,function(k,v)
      local tab=v
      tab.parent=id
      tab.level=level+1,
      table.insert(result.child,tab)
    end)
  end
  return result
end

data_1={
  "蓝奏云直链解析",--
  "查看桌面壁纸",--
  "手机壁纸",--
  "井字棋",--
  "手持弹幕",--
  "获取QQ头像",--
  "小时钟",--
  "无线路由管理",--
  "情话生成",--
  "告白二维码",
  "翻译",--
  "文字图标制作",--
  "QQ设置动态头像",--
  "提取安装包",--

  "查看网页源码",--
  "浏览器",--
  "电脑壁纸",--
  "网抑云热评",--
  "双人五子棋",--
  "迷你英文生成",--
  "王者最低战力查询",--
  "随机一张动漫图",--
  "强制QQ聊天",--
  "小米运动刷步数",
  "ZIP解压",--
  "QQ彩色群昵称",--
  "QQ闪照一键查看",--
  "视力测试",
  "理线游戏",
  "别踩白块儿",
  "汉诺塔",
  "手速大比拼",
  "网抑云",
  "自动刷视频",
  "訫笔记",
  '随机骚话',

}
function_1={
  [[tool_蓝奏云解析()]],
  [[保存桌面壁纸()]],
  [[
    数字=math.random(1,199)
    url="https://m.3gbizhi.com/sjbz/index_"..数字..".html"
    Http.get(url,function(a,b)
      if a==200 then
        图片链接=b:match('style="display: block;"><img lazysrc="(.-)"')
        壁纸大全(图片链接,"70%h")
       else
        提示('请检查网络')
      end
    end)]],
  'activity.newActivity("tools/jzq")',
  [[activity.newActivity('tools/scdm')]],
  [[获取QQ头像()]],
  [[小时钟()]],
  [[activity.newActivity('tools/webview',{"http://192.168.0.1/index.html"})]],
  [[情话生成()]],
  [[二维码生成()]],
  [[翻译()]],
  [[activity.newActivity("tools/icon")]],
  [[activity.newActivity("tools/QQ_gif")]],
  [[activity.newActivity("tools/drwa")]],

  [[查看网页源码()]],
  [[activity.newActivity('tools/baidu')]],
  [[
      url="https://tuapi.eees.cc/api.php?category=dongman&type=xml"
      Http.get(url,function(a,b)
        if a==200 then
          图片链接=b:match('<IMG>(.-)<')
          壁纸大全(图片链接)
         else
          提示('请检查网络')
        end
      end)]],
  [[网抑云热评()]],
  [[activity.newActivity('tools/five')]],
  [[迷你英文()]],
  [[activity.newActivity('tools/wz')]],
  [[ url="https://api.ooomn.com/api/ag"
      Http.get(url,function(a,b)
        if a==200 then
          图片链接=b:match('<body background="(.-)"')
          壁纸大全(图片链接)
         else
          提示('请检查网络')
        end
      end)]],
  [[强制QQ聊天()]],
  [[小米运动刷步数()]],
  [[调用系统选择文件(function (a)
        import "java.io.File"
        ZipUtil.unzip(a,"/storage/emulated/0/米环看小说/工具/")
        提示("已解压到/storage/emulated/0/米环看小说/工具/")
      end)]],
  [[彩色群昵称()]],
  [[activity.newActivity('tools/looksc')]],
  [[activity.newActivity('tools/eye')]],
  [[activity.newActivity('tools/linegame')]],
  [[activity.newActivity('tools/white.lua')]],
  [[activity.newActivity('tools/hnt.lua')]],
  [[activity.newActivity('tools/speed.lua')]],
  [[activity.newActivity('tools/music.lua')]],
  [[activity.newActivity('tools/automatic.lua')]],
  [[activity.newActivity('Manual/main.lua')]],


}

data={
  bulidTree("工具",0,nil,10,

  bulidTree("蓝奏云直链解析",nil,nil,25),
  bulidTree("小米运动刷步数",nil,nil,25),
  bulidTree("无线路由管理",nil,nil,25),
  bulidTree("手持弹幕",nil,nil,25),
  bulidTree("ZIP解压",nil,nil,25),
  bulidTree("查看网页源码",nil,nil,25),
  bulidTree("浏览器",nil,nil,25),
  bulidTree("小时钟",nil,nil,25),
  bulidTree("翻译",nil,nil,25),
  bulidTree("提取安装包",nil,nil,25),
  bulidTree("文字图标制作",nil,nil,25),
  bulidTree("自动刷视频",nil,nil,25),
  bulidTree("訫笔记",nil,nil,25),
  bulidTree("网抑云",nil,nil,25)

  ),

  bulidTree("文字",0,nil,20,

  bulidTree("网抑云热评",nil,nil,40),
  bulidTree("迷你英文生成",nil,nil,40),
  bulidTree("情话生成",nil,nil,40)

  ),


  bulidTree("图片",0,nil,30,

  bulidTree("电脑壁纸",nil,nil,60),
  bulidTree("查看桌面壁纸",nil,nil,60),
  bulidTree("手机壁纸",nil,nil,60),
  bulidTree("随机一张动漫图",nil,nil,60)

  ),

  bulidTree("QQ",0,nil,90,

  bulidTree("强制QQ聊天",nil,nil,80),
  bulidTree("QQ闪照一键查看",nil,nil,80),
  bulidTree("QQ彩色群昵称",nil,nil,80),
  bulidTree("获取QQ头像",nil,nil,80),
  bulidTree("QQ设置动态头像",nil,nil,80)

  ),


  bulidTree("游戏",0,nil,550,

  bulidTree("井字棋",nil,nil,798),
  bulidTree("别踩白块儿",nil,nil,798),
  bulidTree("王者最低战力查询",nil,nil,798),
  bulidTree("手速大比拼",nil,nil,798),
  bulidTree("汉诺塔",nil,nil,798),
  bulidTree("视力测试",nil,nil,798),
  bulidTree("双人五子棋",nil,nil,798),
  bulidTree("理线游戏",nil,nil,798)
  )
}

table.foreach(data,function(k,v)
  table.insert(list.adapter.getData(),{
    background={x=v.level*dp2px(6)},
    data="return "..tostring(v.child~=nil)..","..v.id,
    title=v.title,
    image={
      rotation=0,
      visibility=(v.child~=nil) and 0 or 4,
      src="icon/right.png",
    },
  })
end)

function instert(data,lo)
  table.foreach(data,function(k,v)
    table.insert(list.adapter.getData(),lo,{
      background={x=v.level*dp2px(6)},
      data="return "..tostring(v.child~=nil)..","..v.id,
      title=v.title,
      image={
        rotation=0,
        visibility=(v.child~=nil) and 0 or 4,
        src="icon/right.png",
      },
    })
  end)
  list.adapter.notifyDataSetChanged()
end

function findId(s,id,p)
  for k,v in pairs(s) do
    if v.id==id then
      instert(v.child,p+1)
      break
    end
    if v.child then findId(v.child,id,p) end
  end
end

function removeId(data,id,p)
  for k,v in pairs(data) do
    if (v.child and v.id==id) then
      removeId(v.child,v.id,p)
     elseif v.child then
      removeId(v.child,id,p)
    end
    if v.parent==id then
      if v.child then removeId(v.child,v.id,p) end
      for k,z in pairs(list.adapter.getData()) do
        local _,mid=load(z.data)()
        if mid==v.id then
          table.remove(list.adapter.getData(),k)
        end
      end
    end
  end
end

list.onItemClick=function(_,v,p,l)
  local hasChild,id=load(v.tag.data.text)()
  if hasChild then
    if list.adapter.getData()[l].image.rotation==0 then
      list.adapter.getData()[l].image.rotation=90
      findId(data,id,l)
     else
      list.adapter.getData()[l].image.rotation=0
      removeId(data,id,l)
    end
   else
    tit=v.Tag.title.Text
    for i=1,#data_1 do
      if tit==data_1[i] then
        assert(loadstring(function_1[i]))()
      end
    end
  end
  list.adapter.notifyDataSetChanged()
end
