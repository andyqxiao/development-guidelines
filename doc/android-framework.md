# Android代码架构

### 项目代码的包结构

```
app
├─ src
│  ├─ app.activity
│  ├─ app.fragment
│  ├─ app.view
│  │  ├─ app.view.widget
│  │  └─ app.view.adapter
│  ├─ app.model
│  ├─ app.manager
│  ├─ app.database
│  └─ app.network
├─ libs
├─ res
├─ AndroidManifest.xml
└─ project.properties
```

## app包
主要是与App全局相关的类

主要类如下：

* MainApplication: App的全局Application类

## app.activity
程序所有Activity，根据功能逻辑需要，可以再往下新建app.activity.foo子包。

主要类如下：

* BaseActivity: 所有Activity的基类
* MainActivity: 程序的主Activity

## app.fragment
程序所有Fragment，根据功能逻辑需要，可以再往下新建app.fragment.foo子包。

主要类如下：

* BaseFragment: 所有Fragment的基类
* DialogFragment: 所有对话框的基类

## app.view包

## app.model包

## app.manager包

主要类如下：

* BaseManager: 所有Manager的抽象基类，一般不会用到
* Constant: 常量集
* ConfigManager: 用来获取常量配置，这些常量从（1）ConfigManager中的静态变量；（2）从AndroidManifest.xml中的meta-data中获取；（3）从assets中获取；（4）从res文件中获取；（5）从文件系统中获取；这些配置都是只读的
* PrefereceManager: 从SharedPreference中获取的配置，这些配置可读可写
* ContentManager: 管理本地数据库
* DisplayManager: 兼容多屏幕尺寸的工具
* EventManager: 事件分发
* PayManager: 支付相关
* ShareManager: 分享相关
* NotificationManager: 通知相关（通知栏的通知）
* StorageManager: 存储管理，支持手机没有SD卡的情况
* TrackManager: 程序的统计分析
* WebSocketManager: WebSocket
* HttpManager: 网络访问

#### ConfigManager
在需要用到配置的地方直接调用：

```java
ConfigManager manager = ConfigManager.getInstance();
String host = manager.getHost();
// TODO: use the "host" variable to do something
```

#### PreferenceManager
在需要使用用户配置可以直接调用，它是对SharedPreferences类的简单封装：

```java
PreferenceManager manager = PreferenceManager.getInstance();
String value = manager.getString("key");
// TODO: use the "value" variable to do something
```

#### HttpManager
HttpManager封装了Http访问，使用调用者不需要知道底层的访问使用了什么请求方式和缓存等，其中最重要的方法为

```java
request(final IHttpRequest httpRequest, final IParser<T> parser, final ICallback<T> callback)
```
其中：

* IHttpRequest: HTTP请求的全部信息，包括URL地址、HTTP头、参数、数据、请求配置及缓存策略等。
* IParser: 返回的数据以字符串表示，需要一个解析器来把它转化为Java类
* ICallback: 异步回调接口（回调方法是在UI线程中执行的）

添加一个API请求的步骤：

（1）根据服务器返回的数据结构定义一个Model类：

```java
public class SignUpInfo extends Info {
	public String anchor_uid;
	public String name;
	public String mobile;
	public String company;
	public String position;
}
```

（2）定义解析类（我们使用Gson来解析）：

其实，你最终可以发现，因为Gson采用了反射去设置类的属性，所以大部分解析类XXXParser的代码都很简单，仅仅有一行代码不同。

```java
public class SignUpParser extends ResultParser<SignUpInfo> {

	@Override
	public SignUpInfo parseObject(String json) {
		Gson gson = new Gson();
		return gson.fromJson(json, SignUpInfo.class);
	}
}
```

（3）在HttpManager中定义方法：

```Java
public final class HttpManager extends BaseManager<Context> {

	......
	
	public void requestSignUp(String anchorUid, String name, String mobile, String company, String position, ICallback<Result<String>> callback) {
		final String path = "/activity/set_participate" + getUserinfo();
		HttpRequest request = new HttpRequest(0, HttpRequest.METHOD_POST, path);
		request.add("anchor_uid", anchorUid);
		request.add("name", name);
		request.add("mobile", mobile);
		request.add("company", company);
		request.add("position", position);

		request(request, new StringResultParser(), callback);
	}
	
	......
	
}
```

(4) 在Activity或Fragment中进行异步调用：

```java
mHttpManager.requestSignUp(mLiveId, mNameText.getText().toString(),
		mMobileText.getText().toString(),
		mCompanyText.getText().toString(), mPostionText.getText().toString(),
		new HttpManager.HttpCallback<Result<String>>(){
	@Override
	public void onSuccess(int id, Result<String> result) {
		ActivityUtils.showToast(getActivity(), result.getObject());
		SignUpDialog.this.dismiss();
		mSubmitButton.setEnabled(true);
	}
});
```

## app.database包
主要是数据库（SQLite）操作相关类

## app.network
主要是网络相关类
