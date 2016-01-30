# Adnroid界面视觉与交互标准
## 摘要
* 屏幕的尺寸标准与分类
* UI设计、制图与输出
* UI元素维度标准

### 屏幕的尺寸标准与分类
Google的Android的标屏分辨率为320*480（不建议支持这个分辨率以下的设备），目前市场流行的机型，按倍率分为以下几类：

* 1x: 在Android资源中使用mdpi标识，分辨率通常为320*480，对应1dp=1px
* 1.5x: 在Android资源中使用hdpi标识，分辨率通常为480*800，对应1dp=1.5px
* 2x: 在Android资源中使用xhdpi标识，分辨率通常为720*1080，对应1dp=2px
* 3x: 在Android资源中使用xxhdpi标识，分辨率通常为1080*1920，对应1dp=3px
* 4x: 在Android资源中使用xxxhdpi标识，分辨率通常为1440*2160，对应1dp=4px

Apple的iOS的分辨率如下

* 1x: 320\*480, 1024\*768
* 2x: 640\*960, 640\*1136, 750\*1334, 2048\*1536
* 3x: 1080*1920, 1242\*2208, 1125\*2001 

参考：[The Ultimate Guide To iPhone Resolutions](http://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)

根据以上的屏幕参数，我们可以选定我的基准屏幕参数为360\*640，其它的均按倍率来计算。但因为这个标准太小，放在手机看不够清晰，在电脑上看也比较小，**建议使用720\*1080的标准（9:16比例）**

参考：[友盟指数](http://www.umindex.com)

### UI设计、制图与输出

UI设计建议（最佳实践）

* Axure 采用360*640的页面
* Photoshop等位图工具采用 720*1280（9:16比例）进行UI设计
* 长度单位最好是 **6** 的倍数，比如6px, 12px等
* 在讨论维度（长度、高度）时，一律使用以 720*1280 设计稿和标准的像素单位，设计不需要知道 dp/sp 或 @2x 这样的概念
* 在决定某个UI元素的宽度时，要考虑当目标屏幕缩小到 **640px** 时的布局情形；同理在决定其高度时，要考虑到屏幕缩小到 **960px** 时的布局情形

### UI元素维度标准

以下会出现px和dp两种单位，其中px指像素，是设计师所用的单位，dp是逻辑像素，是Android工程师所用的单位，也可以认为是iOS工程师在 @1x 时的单位。**始终记住：如果采用像素作为单位，一定要提前申明你的设计稿对应的屏幕尺寸的大小，否则没有意义。**

以下标准，我们假定：设计稿所使用屏幕尺寸为 720*1280 。其中：1dp = 2px 。

界面与控件

* 全屏图片：360dp，540dp
 * iOS：750px*1136px
 * Android：720\*1280, 1080\*1920
* 标题栏/Actionbar高度：50dp
* 底部标题栏：50dp
* 标题下方的选项卡/Tab的高度：40dp
* 切换图片：360dp，
* 视频截图：
* 功能列表的列高度：

列表

* divider：1px #DDDDDD

表单（因手机屏幕较少的原因，表单均为单行表单）

* 单倍行高：50dp

### UI元素颜色标准

灰度颜色

| Color                                   | Value   | 使用范围 |
| --------------------------------------- |:-------:| ------:|
| <span style="color:#FFFFFF">■■■■</span> | #FFFFFF | 
| <span style="color:#EBEBEB">■■■■</span> | #EBEBEB | 
| <span style="color:#DDDDDD">■■■■</span> | #DDDDDD | 
| <span style="color:#CCCCCC">■■■■</span> | #CCCCCC | 
| <span style="color:#AAAAAA">■■■■</span> | #AAAAAA | 
| <span style="color:#999999">■■■■</span> | #999999 | 
| <span style="color:#666666">■■■■</span> | #666666 | 
| <span style="color:#333333">■■■■</span> | #333333 | 

主色调

| Color                                   | Value   | 使用范围 |
| --------------------------------------- |:-------:| ------:|
| <span style="color:#1682EF">■■■■</span> | #1682EF | 

辅色调

| Color                                   | Value   | 使用范围 |
| --------------------------------------- |:-------:| ------:|
| <span style="color:#FF4D4D">■■■■</span> | #FF4D4D | 
| <span style="color:#019FE8">■■■■</span> | #019FE8 | 
| <span style="color:#ED8E31">■■■■</span> | #ED8E31 | 
| <span style="color:#23AE89">■■■■</span> | #23AE89 | 
| <span style="color:#E94B3B">■■■■</span> | #E94B3B | 

背影色调

| Color                                   | Value   | 使用范围 |
| --------------------------------------- |:-------:| ------:|
| <span style="color:#FFFFFF">■■■■</span> | #FFFFFF | 
| <span style="color:#F7F7F7">■■■■</span> | #F7F7F7 | 
| <span style="color:#EBEBEB">■■■■</span> | #EBEBEB | 
| <span style="color:#1682EF">■■■■</span> | #1682EF | 

间隔线

| Color                                   | Value   | 使用范围 |
| --------------------------------------- |:-------:| ------:|
| <span style="color:#DDDDDD">■■■■</span> | #DDDDDD | 
| <span style="color:#CCCCCC">■■■■</span> | #CCCCCC | 

文字

| Color                                   | Value   | 使用范围 |
| --------------------------------------- |:-------:| ------:|
| <span style="color:#CCCCCC">■■■■</span> | #CCCCCC | 
| <span style="color:#999999">■■■■</span> | #999999 | 
| <span style="color:#666666">■■■■</span> | #666666 | 
| <span style="color:#333333">■■■■</span> | #333333 | 
| <span style="color:#000000">■■■■</span> | #000000 | 

#### 字体标准

使用系统默认的字体，不建议使用第三方字体。

* Droid/Sans/Fallback

#### 字号标准

* 超大号（18sp）：窗口标题
* 大号（15sp）：副标题
* 中号（12sp）：主体内容
* 小号（10sp）：备注内容
* 特小号（8sp）：暂无使用

#### 图片维度标准

* 16:9
* 16:7
* 1:1

#### 动作按钮

* 一般按钮：50dp
* 小号按钮：30dp

#### 头像

* 一般：40dp*40dp
* 小号：30dp*30dp

#### 控件间距

* 全局间距：12dp
* 内部间距：10dp

