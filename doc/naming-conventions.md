# Android开发命名规范
## 摘要

* 包名
* 类和接口
* 方法命名

### 包名

域名反写+项目名称+模块名称，全部单词用小写字母。

### 类和接口

使用大驼峰规则，用名词或名词词组命名，每个单词的首字母大写。
以下为几种常用类的命名：

* Activity类：XXXActivity
* Fragment类：
* Service类：
* Adapter类：
* 工具类：FooUtils
* 模型类：FooModel/BarModel
* 接口实现类：IFooImpl/BarImpl

### 方法命名

使用小驼峰规则，用动词命名，第一个单词的首字母小写，其他单词的首字母大写。
以下为几种常用方法的命名：

* 初始化：initFoo/initBar
* 按钮点击方法：toFoo/toBar
* 设置方法：setFoo/setBar
* 具有返回值的方法：getFoo/getBar
* 加载数据的方法：loadFoo/loadBar
* 布尔型的判断方法：isFoo/isBar

### 常量

全部为大写单词，单词之间用下划线分开。

### 变量

{范围描述+}意义描述+类型描述的组合，用驼峰式，首字母小写。

### 特殊的前缀/后缀/缩写

组件

| Prefix/Surfix | Controls | Range |
|----------|-------------|:----------------------------------------------------|
| activity | Activity    | Activity的子类
| fragment | Fragment    | Fragment的子类
| dialog   | Dialog    | Dialog的子类
| service  | Service      | Service的子类
| provider | Provider    | Provider的子类

UI控件


| Prefix/Surfix | Controls | Range |
|----------|-------------|:----------------------------------------------------|
| label    | TextView    | 所有的标签文字（不需要用户输入的）
| text     | EditText    | 所有需要用户输入的文字信息
| input    | EditText    | 涉及用户输入的信息 
| button   | Button      | 按钮（包括图片按钮）
| checkbox | CheckBox    | 复选框
| radio    | RadioButton | 单选框
| image    | ImageView   | 图片（不需要用户操作的）
| progress | ProgressBar | 与进度相关的控件
| list     | ListView    | 列表
| grid     | GridView    | 表格
| table    |             | 表格（重复性）
| scroll   | ScrollView  | 可滑动的控件
| layout   | Layout      | 布局或控件容器
| view     | View        | 一般的简单控件
| widget   | Widget      | 一般的复杂控件

### 控件id

{控件前缀}\_{意义}，比如button\_foo，text\_bar。

### layout文件：布局

{Layout前缀}\_{意义}，比如activity_main。

Layout命名前缀

| Prefix   | Range |
|----------|-------------------------------------------------------------------|
| activity | Activity的布局
| fragment | Fragment的布局
| dialog   | Dialog的布局（由于目前Dialog一般采用Fragment实现，此前缀使用较少）
| item     | 重复型布局的重复单元，如列表，表格等
| header   | 重复型布局的头部
| footer   | 重复型布局的尾部
| layout   | 可重复使用的布局
| popup    | 弹出窗口
| toast    | Toast消息窗口
| widget   | Widget（屏幕小部件）
| view     | 用户自定义控件、或暂时无法分类的布局

### drawable文件：图像

{drawable前缀}\_{意义}[\_{drawable后缀}]，其中{drawable后缀}是可选的，比如ic_login_normal。

图标命名前缀

| Prefix     | Range |
|------------|-----------------------------------------------------------------|
| ic         | 图标
| ic_menu    | 菜单图标
| btn/button | 按钮
| emo        | 表情
| bg         | 背景图片

图标命名后缀

| Suffix         | Range |
|----------------|-------------------------------------------------------------|
| disabled       | 触摸或点击事件不可用状态
| pressed        | 按压状态
| selected       | 选中状态
| checked        | 勾选状态
| checkable      | 勾选可用状态
| focused        | 获得焦点状态
| window_focused | 当前窗口获得焦点状态
| activated      | 被激活状态
| hovered        | 鼠标在上面滑动的状态
| normal         | 默认状态

图标命名后缀

| Suffix         | Range |
|----------------|-------------------------------------------------------------|
| selector       | 状态列表图片

### anim文件：动画

* fade_in，淡入
* fade_out，淡出
* push_down_in，从下方推入
* push_down_out，从下方推出
* slide_in_from_top，从头部滑动进入
* zoom_enter，变形进入
* shrink_to_middle，中间缩小

### values/strings.xml和values/arrays.xml：字符串

{前缀}\_{意义}

strings命名前缀

| Prefix      | Range |
|-------------|----------------------------------------------------------------|
| app_name    | 程序的名字
| title       | 标题文字
| button      | 按钮文字
| label       | 标签文字
| tab         | 
| toast       | Toast消息
| text        | 文本
| hint        | 提示文字
| menu_item   | 菜单项文字
| description | 描述（一段比较长的文本），用于图片或对控件的描述
| paragraph   | 描述（一段比较长的段落）

### values/colors.xml：颜色

### values/dimens.xml：数值

图标命名后缀



| Prefix        | Range |
|---------------|--------------------------------------------------------------|
| width         | 布局的宽度
| height        | 布局的高度
| weight        | 布局的权重
| image_width   | 图片的宽度
| image_height  | 图片的高度
| text_size     | 文字的大小
| spacing       | 控件间的间距（比如margin和padding）
| offset        | 偏移量
| shadow_radius | 阴影半径

### values/styles.xml和values/themes.xml：样式

全名时采用Foo.Bar的方式，充分利用Android支持的继承方式，比如Foo.Bar默认继承了Foo。

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources xmlns:android="http://schemas.android.com/apk/res/android">

    <!-- 所有控件主题的根类 -->
    <style name="Widget" parent="@android:style/Widget"></style>

    <!-- 所有布局的根类 -->
    <style name="Widget.Layout"></style>

    <!-- 所有布局的根类 -->
    <style name="Widget.Layout.Main">
        <item name="android:background">@drawable/white</item>
    </style>

    <!-- 所有文本的根类 -->
    <style name="Widget.Text"></style>

    <!-- 所有按钮的根类 -->
    <style name="Widget.Button"></style>

    <!-- 所有字体样式的根类 -->
	<style name="TextAppearance"></style>
</resources>
```