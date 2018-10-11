# VIPER构成类命名规范

## 摘要

* VIP的方法结构
* View的命名规则
* Presenter的命名规则
* Interactor的命名规则
* Router的命名规则
* Entity的命名规则

### VIP的方法结构

根据VIPER的规范，如果是同步数据（比如从内存就能获取或者仅需要逻辑分析或数值计算就能得出的数据，比如数据的格式化，email校验等），数据流是V->P->V，例如：

```
interface IView {
	void showEmailValidView();
	void showEmailInvalidView(String error);
}

interface IPresenter {
	void checkEmail(String email);
}
```

在View和Presenter的实现类中的调用流程：

```
class FooView implements IView {
	void bar() {
		...
		checkEmail("abc@123.com");
		...
	}
	void showEmailValidView() {}
	void showEmailInvalidView(String error) {}
}

class FooPresenter implements IPresener {
	void checkEmail(String email) {
		if (...) {
			showEmailValidView();
		} else {
			showEmailInvalidView("Error...");
		}
	}
}
```

一个简单，但不被推荐的做法是：

```
interface IPresenter {
	boolean checkEmail(String email);
}

class FooView implements IView {
	void bar() {
		...
		final valid = checkEmail("abc@123.com");
		if (valid) {
			// Show email valid view
		} else {
			// Show email invalid view
		}
		...
	}
}
```

因为Presenter作为展示者，它不仅仅负责数据逻辑，也负责在数据验证正确或错误之后如何去展示View，或者说更新View的状态。而上述代码显然是视图展示的逻辑，应该写在Presenter中，而View层只应该提供显示、隐藏、增加、减少、清除、重置、设置View类型或状态等简单的操作。那么这样做的好处是什么呢？举个例子：

```
interface IView {
	void setSubmitEnabled(boolean enabled);
	void showEmailValidView();
	void showEmailInvalidView(String error);
}

interface IPresenter {
	void checkEmail(String email);
}

class FooView implements IView {
	void bar() {
		...
		checkEmail("abc@123.com");
		...
	}
	void setSubmitEnabled(boolean enabled) {}
	void showEmailValidView() {}
	void showEmailInvalidView(String error) {}
}

class FooPresenter implements IPresener {
	void checkEmail(String email) {
		if (...) {
			// 在这里，UX要求email验证成功之后要有消息提示
			// 如果之后改为不需要消息提示，我们只需去掉showEmailValidView()即可
			setSubmitEnabled(true)
			showEmailValidView();
		} else {
			setSubmitEnabled(false)
			showEmailInvalidView("Error...");
		}
	}
}
```

在上面的例子中，UI只是先要求email验证成功之后有消息提示还是没有消息提示，这是展示逻辑的范畴，我们只需修改Presenter的实现就可以了，不需要也不应该去修改View。作为对比，如果UX要求修改消息提示的样式，那么我们才应该去修改View的实现。（这个道理在之后的Presenter与Interactor之间的调用关系中也是通用的）

如果数据是异步的，则数据流是V->P->I->P->V，其中V与P交互的方式不变，P与I交互的方式类似：

```
interface IView {
	void showNewsListView(List<NewsEntity> newsList);
	void showNoDataView(String message);
}

interface IPresenter {
	// 这些方法一般由View去调用
	void showNewsList(String keyword);
	// 这些方法一般由Interactor调用
	void showNewsList(List<NewsEntity> newsList);
	void showNoData(String message);
}

interface IPresenter {
	void requestNewsList(String keyword);
}

class FooView implements IView {
	void bar() {
		presenter.showNewsList("中国梦")
	}
	void showNewsListView(List<NewsEntity> newsList) {}
	void showNoDataView(String message) {}
}

class FooPresenter implements IPresener {
	void showNewsList(String keyword) {
		// 对keyword进行处理，比如去掉非法关键字
		...
		interactor.requestNewsList(precessedKeyword)
	}
	
	void showNewsList(List<NewsEntity> newsList) {
		view.showNewsListView(newsList)
	}
	
	void showNoData(String message) {
		view.showNoDataView(message);
	}
}

class FooInteractor implements IInteractor {
	void requestNewsList(String keyword) {
		// 初始化网路访问类，并执行网络请求
		...
		// 结果回调
		if (success) {
			presenter.showNewsList(newsList);
		} else {
			presenter.showNoData();
		}
	}
}
```

上面代码中对网络返回结果的处理不放在Presenter而是放在Interactor中的理由与前面类似，因为Presenter是不管数据返回成功还是错误的逻辑，只需要考虑数据返回时的各种情形的展示方式即可。

### VIP各构成类的命名规则

* outline
* list
* detail


由以上代码，其实我们已经大致看出VIP各构成类的命名规则了，如下：

Router类中各方法的命名：

常见前缀

| 命名                | 含义 |
|--------------------|-----------------------------------------------------|
| open               | 打开另外一个页面
| goto               | 去到另外一个页面
| back               | 返回前面的页面
| want               | 打开另外的页面，并获取数据
| done               | 向要求数据的页面传递数据
| exit               | 退出当前页面
| die                | 退出程序

View类中各方法的命名：

常见前缀

| 命名                | 含义 |
|--------------------|-----------------------------------------------------|
| set                | 设置View的状态（如果这个View是有状态的）
| get                | 获取View的状态
| show               | 显示控件或布局
| hide               | 隐藏控件或布局
| enable             | 启用控件或布局
| disable            | 禁用控件或布局
| switch             | 切换（多个状态）
| toggle             | 切换（两个状态）
| update             | 更新控件的显示数据（抹掉原来的）
| reset              | 重置控件的状态
| add                | 向控件添加数据（与原来的进行叠加或归并）
| remove             | 移除控件显示的数据（原来的数据可能还有剩余）
| check              | 验证数据（格式）
| clear              | 清除控件内容

常见实体

| 命名                | 含义 |
|--------------------|-----------------------------------------------------|
| Back               | 后退按钮或图标
| Submit             | 提交按钮
| Reset              | 重置按钮

常见后缀

| 命名                | 含义 |
|--------------------|-----------------------------------------------------|
| State              | 状态
| Mode               | 状态
| List               | 列表排列的数据
| Grid               | 网状排列的数据
| View               | 控件或布局
| Panel              | 布局
| Layout             | 布局
| Masking            | 遮罩（主要用于阻止用户的输入）
| Loading            | 加载动画
| Success            | 成功
| Failure            | 失败
| Mistake            | 
| Progress           | 进度条

Presenter类的命名方式：

常见前缀

| 命名                | 含义 |
|--------------------|-----------------------------------------------------|
| set                | 设置状态（Presenter一般都是有状态的）
| get                | 获取状态
| check              | 验证（对数据进行复杂的逻辑校验）
| begin              | 开始（遮罩，动画，进度条等）
| end                | 结束（遮罩，动画，进度条等）
| step               | 进行接下来的步骤（有可能是逻辑判断也有可能通过网络访问数据）
| pick               | 取得数据（同步）
| call               | 请求数据（通过调用另一个页面）
| pass               | 传入数据（另一个页面传回）
| need               | 请求数据（调用Interactor）
| gain               | 取得数据（由Interactor调用）
| tell               | 通知（成功或失败）
| exec               | 操作并获得结果
| feed               | 接收数据（用户在页面输入后同步到Presenter）
| sync               | 接收数据（用户在页面输入后同步到Presenter）
| require            | 获取数据（异步的，不论数据的来源）
| receive            | 接收数据
| notify             | 接收通知（一般是指成功的通知）
| fetch              | 获取数据（同步的，不论数据的来源）
| do                 | 操作并获得结果
| obtain             | 获取数据（同步的，不论数据的来源）
| verify             | 验证数据（范围与逻辑）

常见实体

| 命名                | 含义 |
|--------------------|-----------------------------------------------------|

常见后缀

| 命名                | 含义 |
|--------------------|-----------------------------------------------------|
| Failure            | 失败
| Success            | 成功

Interactor类的命名方式：

常见前缀

| 命名                | 含义 |
|--------------------|-----------------------------------------------------|
| get                | 从内存中读取数据（一般为同步操作）
| put                | 把数据写入内存（一般为同步操作）
| read               | 读取本地文件（同步或异步）
| write              | 写入本地文件（同步或异步）
| query              | 从数据中获取结果或状态（异步，包括数据库CRUD等各种方法）
| request            | 从网络上获取数据或状态（异步，包括HTTP的各种方法）
| process            | 大量的计算或执行操作（异步）

以上命名实体的来源：

View/Presenter中XXX的来源，最好与Entity的一致，比如我们需要从网络获取一些账户信息并显示在屏幕上，Entity命名为AccountEntity，相对应的View和Presenter命名为：

* View#showAccountView 如果Account只要一个需要显示
* View#showAccountListView 如果Account有多个，用一个列表显示
* View#updateAccountView 更新Account
* View#updateAccountListView 更新Account列表
* Presenter#showAccount 显示Account
* Presenter#showAccountList 显示Account列表

同时，其它VIPER结构的中跳转到这个页面的Router也可以命名为：

* Router#openAccoutListPage
* Router#openAccountListPage

但是，在对Interactor进行命名时，我们不一定，但是还是建议使用以上的原则，如下：

* Interactor#requestAccount （强烈建议使用）
* Interactor#requestAccountList （强烈建议使用）

也可以根据API提供的接口的名称来进行命名，比如API接口为https://host/path/getAccountList，那么，Interactor可以命名为：

* Interactor#getAccountList （可以使用，但不推荐）
* Interactor#requestGetAccountList （推荐使用）

