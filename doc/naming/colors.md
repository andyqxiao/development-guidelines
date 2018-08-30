# Android命名规范 - 颜色值

## 摘要

* 颜色的分类
* 常见的颜色名称
* 216种Web安全色的名称
* 常用的颜色前缀与后缀
* 颜色命名步骤与例子
* iOS/Android中的颜色命名

### 颜色的分类

程序所使用的颜色模式为ARGB，A表示Alpha值（也叫不透明度，A越大颜色越不透明，后面的背景就越不清晰），RGB分别表示红，绿，蓝颜色的分量。RGB是加色模式，在加色模式中，颜色是由光线直接照射产生的，所以只要有光线叠加，颜色就会越来越亮，最终成为白色。因此，RGB的值越大，颜色越亮，到最大值最终形成白色。

按照ARGB各分量的值，我们把颜色分为以下几类：

按不透明度的类型：

* 不透明度为最大值255的颜色，一般用6位16进制数表示如 #123456 （也可用3位16进制数表示）
* 不透明度不为255的颜色，一般用8位16进制数表示如 #12345678 （也可用4位16进制数表示）

按是否有彩色：

* 如果RGB个分量值相等，则是灰度颜色
* 如果RGB个分量值不等，则是彩色

### 常见的颜色名称

CSS 1–2.0, HTML 3.2–4, and VGA color names

| Color                                   | Name    | Value |
| --------------------------------------- |:-------:| ------:|
| <span style="color:#FFFFFF">■■■■</span> | White   | #FFFFFF
| <span style="color:#C0C0C0">■■■■</span> | Silver  | #C0C0C0
| <span style="color:#808080">■■■■</span> | Gray    | #808080
| <span style="color:#000000">■■■■</span> | Black   | #000000
| <span style="color:#FF0000">■■■■</span> | Red     | #FF0000
| <span style="color:#800000">■■■■</span> | Maroon  | #800000
| <span style="color:#FFFF00">■■■■</span> | Yellow  | #FFFF00
| <span style="color:#808000">■■■■</span> | Olive   | #808000
| <span style="color:#00FF00">■■■■</span> | Lime    | #00FF00
| <span style="color:#008000">■■■■</span> | Green   | #008000
| <span style="color:#00FFFF">■■■■</span> | Aqua    | #00FFFF
| <span style="color:#008080">■■■■</span> | Teal    | #008080
| <span style="color:#0000FF">■■■■</span> | Blue    | #0000FF
| <span style="color:#000080">■■■■</span> | Navy    | #000080
| <span style="color:#FF00FF">■■■■</span> | Fuchsia | #FF00FF
| <span style="color:#800080">■■■■</span> | Purple  | #800080

### 216种Web安全色的名称

[参考](https://en.wikipedia.org/wiki/Web_colors)

### 常用的颜色前缀与后缀

表示序号的前缀

| 前缀            | 含义 |
|----------------|-------------------------------------------------------------|
| primary        | 首要的，第一位的
| secondary      | 次要的，第二位的
| tertiary       | 第三
| quaternary     | 第四
| quinary        | 第五
| senary         | 第六
| septenary      | 第七
| octonary       | 第八
| nonary         | 第九
| denary         | 第十

表示主题的前缀

| 前缀            | 含义 |
|----------------|-------------------------------------------------------------|
| bright         | 明亮主题
| light          | 白天主题
| dark           | 夜晚主题
| dim            | 暗淡的
| highlighted    | 特别强调的

表示控件状态的后缀

| 后缀            | 含义 |
|----------------|-------------------------------------------------------------|
| normal         | 一般的，默认的，一般这种情况我们省略该后缀
| default        | 一般的，默认的，一般这种情况我们省略该后缀
| active         | 激活的
| inactive       | 未激活的
| disabled       | 禁用的
| enabled        | 未禁用的
| focused        | 获取了焦点（可编辑文本框）
| pressed        | 被按下（按钮）
| selected       | 被选中的
| checked        | 被选中的（一般用于单选和多选控件）

表示实体对象的名称

| 名称            | 含义 |
|----------------|-------------------------------------------------------------|
| color          | 颜色（通常作为后缀）
| backgroud      | 背景
| foreground     | 前景
| line           | 线条
| divider        | 分隔
| header         | 头部
| footer         | 尾部
| shadow         | 阴影
| text           | 文本
| edit           | 可编辑文本框
| icon           | 图标
| mask           | 蒙版
| input          | 输入控件，可编辑文本框
| screen         | 屏幕
| hint           | 提示文字
| stat_notify    | 状态栏通知
| stat_sys       | 状态栏通知
| menu           | 菜单
| alert          | 警告
| dialog         | 对话框
| button         | 按钮
| tooltip        | 工具提示
| popup          | 弹出框
| accessibility  | accessibility相关
| keyboard       | 键盘
| notification   | 通知
| lock           | 锁屏
| search         | 搜索控件


### 颜色命名步骤与例子

1. 分类别：一般把颜色分为通用颜色和专用颜色两种，存在于通用颜色的专用颜色，复用通用颜色的名称；
2. 定色调：在专用颜色重，一般把颜色分为几个大类，比如红色调（不一定是精确的红色），绿色调等；
3. 定用途：文本，背景等（在表示实体对象的名称中选）
4. 命名

例子：主色调为绿，蓝

一组名称：PrimaryGreen, SecondaryGreen, PrimaryBlue, SecondaryBlue, PrimaryTextColor, SecondaryTextColor, LineColor, DividerColor, red, green, LightGreen, BrightGreen, DarkGreen, EditDisabled, ButtonPressed, TextHint, MenuBackground, ...

###  iOS/Android中的颜色命名

* iOS采用驼峰命名法，可以照抄以上例子中的名称
* Android采用下划线分隔命名法


