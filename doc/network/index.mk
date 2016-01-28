#网络请求
## 摘要
* OkHttp

### 目前Android开发中常用的网络访问库
目前Android开发中使用网络请求数据的方式主要有以下几种方式：

* 使用HttpUrlConnection
* 使用ApacheHttpClient
* Android Asynchronous Http Client
* Volley
* OkHttp
* RoboSpice
* Retrofit

#### 使用HttpUrlConnection

#### 使用ApacheHttpClient

#### Android Asynchronous Http Client

#### Volley

#### OkHttp

#### RoboSpice

#### Retrofit

如果是严谨的REST API , Retrofit 会非常好用！各种 annotation 用起来省事又省心！唯独不好的地方是很多时候我们的接口不是完全的 REST 结构，同时需要针对每个 request 做单独的处理，这时候 Retrofit 就显得有些尴尬了。这时候我会用 volley，volley 的请求自定义和管理支持很好。