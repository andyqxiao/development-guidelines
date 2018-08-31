# 资源命名规范 - 维度值 - dimens.xml

## 摘要

* 几种长度单位
* Android与iOS的设备分辨率
* 常见的维度命名前缀和后缀
* 维度的命名规则
* 维度命名步骤与例子
* 为什么维度里没有与字体大小相关的数值

### 几种长度单位

长度单位

* dp/dip (density-independent pixel) - 设备无关像素，即在任何设备上1dp的物理长度是不变的，都是1/160英寸
* sp (scaled pixel) - 与dp类似，但会根据用户的字体大小偏好来缩放，因此该单位一般用于字号
* px (pixel) - 像素，电子屏幕上组成一幅图画或照片的最基本单元，就是我们通常所说的分辨率
* pt (point) - 点，印刷行业常用单位，等于1/72英寸

一些与分辨率，清晰度相关的概念

* PPI (pixel per inch) 每英寸像素数，该值越高，则屏幕越细腻
* DPI (dot per inch) 每英寸多少点，该值越高，则图片越细腻

DPI最初是用来衡量打印物品上每英寸的点数，DPI越大，图片越精细。当DPI用在计算机屏幕上时，就称为PPI。因此，可以认为DPI和PPI是等同的概念。

### Android与iOS的设备分辨率

Google的Android的标屏分辨率为320*480（不建议支持这个分辨率以下的设备），目前市场流行的机型，按倍率分为以下几类：

* 1x: 在Android资源中使用mdpi标识，分辨率通常为320*480，对应1dp=1px
* 1.5x: 在Android资源中使用hdpi标识，分辨率通常为480*800，对应1dp=1.5px
* 2x: 在Android资源中使用xhdpi标识，分辨率通常为720*1080，对应1dp=2px
* 3x: 在Android资源中使用xxhdpi标识，分辨率通常为1080*1920，对应1dp=3px
* 4x: 在Android资源中使用xxxhdpi标识，分辨率通常为1440*2160，对应1dp=4px

Apple的iOS的分辨率如下

* 1x: 320x480, 1024x768
* 2x: 640x960, 640x1136, 750x1334, 2048x1536
* 3x: 1080x1920, 1125x2001, 1242x2208

参考：[The Ultimate Guide To iPhone Resolutions] (http://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)

根据以上的屏幕参数，我们可以选定我的基准屏幕参数为360x640，其它的均按倍率来计算。但因为这个标准太小，放在手机看不够清晰，在电脑上看也比较小，建议使用720*1080的标准（9:16比例）

参考：[友盟指数] (http://www.umindex.com/)

### 常见的维度命名前缀和后缀

常见的后缀

| 后缀            | 含义 |
|----------------|-------------------------------------------------------------|
| width          | 宽度
| height         | 高度
| size           | 尺寸（通常的后缀）
| thickness      | 厚度
| insets         | 插入
| margin_start   | 左边距（控件与控件的间距，下同）
| margin_end     | 右边距
| margin_left    | 左边距
| margin_right   | 右边距
| margin_top     | 上边距
| margin_bottom  | 下边距
| padding_start  | 左留白（控件与自身内容的间距，下同）
| padding_end    | 右留白
| padding_lfet   | 左留白
| padding_right  | 右留白
| padding_top    | 上留白
| padding_bottom | 下留白
| max_width      | 最大宽度
| min_width      | 最小宽度
| max_height     | 最大高度
| min_height     | 最小高度
| max_size       | 最大尺寸
| min_size       | 最小尺寸
| shadow         | 阴影
| radius         | 圆角

常见的实体名称

| 名称            | 含义 |
|----------------|-------------------------------------------------------------|
| title          | 标题
| subtitle       | 副标题
| scroller       | 滚动条
| thickness      | 厚度

### 维度的命名规则

* Android采用下划线分隔命名法

### 维度命名步骤与例子

### 为什么维度里没有与字体大小相关的数值

因为在Android系统中，所有的TextView及其子类都同时拥有sytle和android:textAppearance两个属性，这两个属性都可以用来设置文字的属性，只是android:textAppearance能设置的属性范围比较少而已。为了更好地使用这两个属性，让一个TextView可以同时应用两个不同的style，我们一般把对字体大小的直接写在android:textAppearance中，而且这些字体大小数值几乎没有与被style重用的可能，因而不需要写在dimens.xml文件中。程序内所有的字体属性（字体，字号，颜色等）都在android:textAppearance这个属性体系下进行设置和复用（通过style的继承与覆盖原则，android:textAppearance也是一种style）。

优先级与约定

各种设置字体属性的方式优先级如下（优先级由高到低）：

代码调用 > xml文件属性 > style属性 > android:theme > android:textAppearance

但是，我们一般不对TextView使用android:theme这个属性，而是把所有的字体相关属性配置到android:textAppearance，把其它的属性配置到style中。

