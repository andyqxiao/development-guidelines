# Adnroid UI代码规范
## 摘要
* 标题栏/ActionBar

### 标题栏/ActionBar

ActionBar的构成

* 中间的标题文字
* 左边的返回图标按钮
* 右边0-2个功能图标按钮

中间的文字大小为18sp

左边和右边的图标按钮，点击区域的高度和宽度均与ActionBar相等，这样的可以获得最大的点击区域，标准代码如下：

```xml
<View
    <!-- 获得最大点击区域 -->
    android:layout_width="@dimen/height_titlebar"
    android:layout_height="match_parent"
    <!-- 去掉默认背景 -->
    android:background="@null"
    android:scaleType="center"
    android:src="@drawable/ic_***"
    />
```