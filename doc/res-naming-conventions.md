# Android开发命名规范
## 摘要

* 文件命名规范
* 资源全名规范

## 文件命名规范

文件名（包括扩展名）全小写，使用下划线分隔，以字母开头。

字符集: [._a-z0-9]

格式: {prefix}\_{foo}[\_{surfix}].{ext}

例子: activity_main.xml, ic_back_pressed.xml

### res/anim, res/animator: 动画文件

* fade_in，淡入
* fade_out，淡出
* push_down_in，从下方推入
* push_down_out，从下方推出
* slide_in_from_top，从头部滑动进入
* zoom_enter，变形进入
* shrink_to_middle，中间缩小

动画文件命名后缀

| Prefix     | Range |
|------------|-----------------------------------------------------------------|
| enter      | 图标
| exit       | 菜单图标
| in         | 菜单图标
| out        | 菜单图标


### res/color: 颜色文件

颜色文件命名方式与图片文件类似

### res/drawable, res/mipmap: 图片文件

图片文件命名前缀

| Prefix         | Range |
|----------------|-------------------------------------------------------------|
| ic             | 图标
| ic_menu        | 菜单图标
| btn            | 按钮
| emo            | 表情
| bg             | 背景图片
| list_selector  | 背景图片
| stat           | 状态栏图片
| text           | 文本编辑框
| sym            | 符号
| img            | 内容型图片
| pixel          | 像素图
| line           | 线状分隔
| test           | 用于测试的内容图片
| image          | 内容型图片
| button         | 按钮

图片文件命名后缀

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
| selector       | 状态列表图片

### res/layout: 布局文件

命名前缀

| Prefix   | Range |
|----------|-------------------------------------------------------------------|
| activity | Activity的布局
| fragment | Fragment的布局
| dialog   | Dialog的布局（由于目前Dialog一般采用Fragment实现，此前缀使用较少）
| item     | 重复型布局的重复单元，如列表，表格，RecyclerView等
| layout   | 可重复使用的布局（一般用于include）
| popup    | 弹出窗口
| toast    | Toast消息窗口
| widget   | Widget（屏幕小部件）
| view     | 用户自定义控件、或暂时无法分类的布局
| header   | 重复型布局的头部
| footer   | 重复型布局的尾部

### res/menu: 菜单文件

菜单文件命名后缀

| Prefix        | Range |
|---------------|--------------------------------------------------------------|
| menu          | 

### res/xml, res/raw: 资源文件

暂无特定命名规则。

### res/values: 其它

#### res/values/arrays.xml:

arrays命名后缀

| Surfix        | Range |
|---------------|--------------------------------------------------------------|
| arrays        | 

#### res/values/attrs.xml:

暂无特定全名规则，建议与代码中的变量采用相同或相关名称。

#### res/values/bools.xml:

暂无特定全名规则，建议与代码中的变量采用相同或相关名称。

#### res/values/colors.xml:

colors命名前缀

| Prefix        | Range |
|---------------|--------------------------------------------------------------|
| main          | 主色调
| bg            | 背景色调

#### res/values/config.xml:

暂无特定全名规则，建议与代码中的变量采用相同或相关名称。

#### res/values/dimens.xml:

dimens命名前缀和后缀

| Prefix        | Range |
|---------------|--------------------------------------------------------------|
| width         | 布局的宽度
| height        | 布局的高度
| weight        | 布局的权重
| image_width   | 图片的宽度
| image_height  | 图片的高度
| text_size     | 文字的大小
| spacing       | 控件间的间距（比如margin和padding）
| padding       | 控件间的padding
| margin        | 控件间的margin
| offset        | 偏移量
| shadow_radius | 阴影半径

#### res/values/ids.xml:

ids命名前缀

| Prefix      | Range |
|-------------|----------------------------------------------------------------|
| label       | 标签（一般用于TextView）
| text        | 可编辑的文本（一般用于EditText）
| image       | 图片控件（一般用于ImageView）
| layout      | 布局或父控件（一般用于ViewGroup及其子类）
| panel       | 布局或父控件（一般用于ViewGroup及其子类）
| button      | 按钮（一般用于Button/ImageButton）
| hint        | 提示文字
| surface     | 用于SurfaceView
| bar         | 用于ProgressBar/SeekBar/RatingBar
| stub        | 用于StubView
| check       | 用于CheckBox/CheckedTextView
| radio       | 用于RadioButton
| map         | 用于MapView
| scroll      | 用于ScrollView
| video       | 用于VideoView
| view        | 当命名不确定时，主要用于任意View的子类

#### res/values/strings.xml:

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

#### res/values/styles.xml, res/values/themes.xml:

全名时采用Foo.Bar的方式，充分利用Android支持的继承方式，比如Foo.Bar默认继承了Foo。

```
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