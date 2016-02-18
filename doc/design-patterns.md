# 常用设计模式
## 摘要
* Activity与Fragment的通信

### Activity与Fragment的通信

Activity作为Fragment的总控制器，一般情况下，一个Activity会管理多个Fragment实例，但一个Fragment实例只对应一个Activity，通信原则如下：

* Activity通过调用自己管理的Fragment的方法进行通信；
* Fragment通过调用Activity的回调接口进行通信；
* 同一Activity管理下的Fragment不能直接通信；

Activity通过调用自己管理的Fragment的方法进行通信，但为了统一起风，一般不要过多暴露Fragment的公有方法，而是采用接口的方式：

```Java
	public void foo(int id, Bundle bundle) {
		Fragment fragment = getSupportFragmentManager().findFragmentById(R.id.fragment);
		if (fragment instanceof FragmentCallback) {
			FragmentCallback callback = (FragmentCallback) fragment;
			callback.update(id, bundle);
		}
	}
```

Fragment通过调用Activity的回调接口进行通信，而且这是唯一的方式：

```Java
	private void bar() {
		// 显示标题和返回按钮
		final Bundle bundle = new Bundle();
		bundle.putString("title", "任务");
		bundle.putBoolean("showLeftButton", true);
		final ActivityCallback callback = (ActivityCallback) getActivity();
		callback.onFragmentEvent(0, bundle);
	}
```

Fragment之前不能直接通信，如果需要通信，请通过Activity进行。