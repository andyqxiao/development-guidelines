# 资源命名规范 - 样式与主题 - style.xml/theme.xml

### 摘要

* Android主题与样式的继承方式
* 样式的分类
* 样式包含的内容
* 样式的命名

### Android主题与样式的继承方式

Android的主题与样式的定义格式是一样的（以下我们统一称为样式），最终都是以@style的方式进行引用，其继承结构也是一样的。继承方式有两种，一种是显示继承：

```xml
<resources>
    <style name="Theme" parent="android:Theme.Black.NoTitleBar">
    </style>
</resources>
```

其中的名字叫作“Theme”的样式或主题继承了名字叫作“android:Theme.Black.NoTitleBar”的样式或主题，这里使用了parent属性声明了显示继承。（请注意，这里的“Theme”虽然与“android:Theme.Black.NoTitleBar”中的“Theme”有相同的名称，但是他们名空间是不一样的）

另一种是隐式继承：

```xml
<resources>
    <style name="Theme">
    </style>
    <style name="Theme.Black">
    </style>
</resources>
```

其中的名字叫作“Theme.Black”的样式或主题继承了名字叫作“Theme”的样式或主题，这里通过点分隔符声明了隐式继承，很明显，这里的隐式继承类似于Java的单继承结构，只能有一个父类。

### 样式的分类

样式主要分以下几类：

* 主题样式：也就是通常说的主题，一般用在Activity/Dialog上，其根类是“Theme”
* 控件样式：控件的样式，一般用在控件上，其根类是“Widget”
* 文本样式：控件的样式，一般用在文本控件上，其根类是“TextAppearence”
* 动画样式：动画的样式，一般用在动画上，其根类是“Animation”

常见的样式根类

| 前缀            | 含义 |
|----------------|-------------------------------------------------------------|
| Theme          | 主题
| Widget         | 控件
| TextAppearence | 文本
| Animation      | 动画

常见的样式类

| 前缀            | 含义 |
|--------------------------------|---------------------------------------------|
| Theme.Activity                 | 所有页面的样式
| Theme.Dialog                   | 所有对话框的样式
| Theme.Dialog.Alert             | 所有警告对话框的样式
| Animation.Activity             | 页面的动画
| Animation.Widget               | 控件的动画
| TextAppearence.Text            | 文本，段落
| TextAppearence.Header          | 标题，副标题
| TextAppearence.Title           | 页面的标题
| Widget.Text                    | 文本控件（不可点击，不可编辑的）
| Widget.Edit                    | 文本控件（可编辑）
| Widget.Button                  | 按钮
| Widget.Progress                | 进度条
| Widget.Layout                  | 布局

### 样式包含的内容

我们知道，所有可以在XML文件中或者代码中能修改的属性几乎都可以配置到样式文件中，但是这并不意味着我们可以任意滥用样式，抽象过于复杂，层次过多，设计过于冗余都会对程序的可读性和可写行造成不必要的破坏。

如非必要，不要把涉及布局的属性抽出到样式文件中，特别是layout_width，layout_height，layout_gravity，layout_weight，layout_below，也包括一些对控件的布局起决定性作用的属性，比如visibility，因为这些属性直接决定了控件的显示大小与相对位置，如果它们被配置到样式文件中，在阅读XML文件时将会造成较多的困惑和障碍，特别是layout_below这样的属性，它与相邻的控件的ID有关系，是绝对不能配置在样式中的。而像layout_margin这类描述控件边距的属性却是特别适合写在样式文件中的。

样式分类之间最好不要混用，比如：TextAppearence中只能含有关于文字的属性，而不能含有其它，否则程序不支持，样式不起作用；其它的分类如果混用虽然会起作用，但也会破坏样式的结构设计。

当我们配置一个维度，比如layout_marginTop时，我们可以把这个长度值进一步抽象到dimens文件中，一遍下次再次引用。但是，当我们配置文本字体大小时却并不会采用同样的方法。我们阅读过Google的源码发现，他们几乎没有吧与字体大小有关的长度值抽象到dimens文件中，理由可能是关于字体大小的长度值均由TextAppearece样式及其子类使用，这些数值在TextAppearece这个体系下已经可以完成很好的重用，而其它样式并没有必要引用这些数值。因此，我们也同样约定，不要把表示文本大小的数值抽象到dimens文件中。

### 样式的命名

* 以A.B.C的方式，其中A，B，C均为首字母大写的单个单词，如果实在找不到单个单词来表达，也可以用多个单词驼峰是连接，比如Theme.Dialog，Theme.AlertDialog