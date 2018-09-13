# 使用OkHttp进行HTTP请求
## 摘要
* 同步Get请求
* 同步Post请求（提交Form表单）
* 同步Post请求（提交分块请求，用于上传小文件）
* 同步Post请求（提交文件流，用于上传大文件）
* 异步请求
* 缓存
* 超时

### 同步Get请求
访问Google的主页，并把响应头和响应内容以String的形式打印出来。

```Java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
		.header("User-Agent", "OkHttp") // The customer-designed user agent.
		.url("http://www.google.com")
		.build();

Response response = client.newCall(request).execute();
if (!response.isSuccessful()) {
    /* Print the headers */
    Headers headers = response.headers();
    for (int i = 0; i < headers.size(); i++) {
    	System.out.println(headers.name(i) + ": " + headers.value(i));
    }
    /* Print the response */
    System.out.println(response.body().string());
} else {
	System.out.println("Response is not successful.");
}
```

### 同步Post请求（提交Form表单）
对应于Content-Type为"application/x-www-form-urlencoded;charset=UTF-8"的情况。

```Java
OkHttpClient client = new OkHttpClient();

RequestBody requestBody = new FormEncodingBuilder()
		.add("key", "value")
		.build();
		
Request request = new Request.Builder()
		.header("User-Agent", "OkHttp") // The customer-designed user agent.
		.url("http://www.google.com")
		.post(requestBody)
		.build();
		
client.newCall(request).execute();
```

### 同步Post请求（提交分块请求，用于上传小文件）
对应于Content-Type为"multipart/form-data; boundary=${bound}"的情况。

```Java
OkHttpClient client = new OkHttpClient();

RequestBody requestBody = new MultipartBuilder()
		.type(MultipartBuilder.FORM)
		.addPart(Headers.of("Content-Disposition", "form-data; name=\"title\""),
				RequestBody.create(null, "Square Logo"))
		.addPart(Headers.of("Content-Disposition", "form-data; name=\"image\""),
				RequestBody.create(MediaType.parse("image/png"), new File("/tmp/foo.png")))
		.build();
		
Request request = new Request.Builder()
		.header("User-Agent", "OkHttp") // The customer-designed user agent.
		.url("http://www.google.com")
		.post(requestBody)
		.build();
		
client.newCall(request).execute();
```

### 同步Post请求（提交文件流，用于上传大文件）
```Java
OkHttpClient client = new OkHttpClient();

RequestBody requestBody = new RequestBody() {
	@Override
	public MediaType contentType() {
		return MediaType.parse("text/x-markdown; charset=utf-8");
	}

    @Override
    public void writeTo(BufferedSink sink) throws IOException {
    	sink.writeUtf8("Numbers\n");
    	sink.writeUtf8("-------\n");
    	for (int i = 2; i <= 997; i++) {
    		sink.writeUtf8(String.format(" * %s = %s\n", i, factor(i)));
    	}
	}

	private String factor(int n) {
		for (int i = 2; i < n; i++) {
			int x = n / i;
			if (x * i == n) return factor(x) + " × " + i;
		}
		return Integer.toString(n);
	}
};

Request request = new Request.Builder()
		.header("User-Agent", "OkHttp") // The customer-designed user agent.
		.url("http://www.google.com")
		.post(requestBody)
		.build();
		
client.newCall(request).execute();
```

### 异步请求
异步请求的Request和RequestBody的构造与同步请求相同，不同的只是Call的调用方式不同。

```Java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
        .header("User-Agent", "OkHttp") // The customer-designed user agent.
        .url("http://www.google.com")
        .build();

client.newCall(request).enqueue(new Callback() {
	@Override
	public void onResponse(Response response) throws IOException {
		if (!response.isSuccessful()) {
		    /* Print the headers */
		    Headers headers = response.headers();
		    for (int i = 0; i < headers.size(); i++) {
		        System.out.println(headers.name(i) + ": " + headers.value(i));
		    }
		    /* Print the response */
		    System.out.println(response.body().string());
		} else {
		    System.out.println("Response is not successful.");
		}
	}

	@Override
	public void onFailure(Request request, IOException e) {
		// TODO Auto-generated method stub
	}
});
```

### 缓存
为了缓存响应，你需要一个你可以读写的缓存目录，和缓存大小的限制。这个缓存目录应该是私有的，不信任的程序应不能读取缓存内容。

```Java
OkHttpClient client = new OkHttpClient();
Cache cache = new Cache(new File("/tmp/cache"), 10 * 1024 * 1024);
client.setCache(cache);
```

### 超时
没有响应时使用超时结束call。没有响应的原因可能是客户点链接问题、服务器可用性问题或者这之间的其他东西。OkHttp支持连接，读取和写入超时。

```Java
OkHttpClient client = new OkHttpClient();
client.setConnectTimeout(10, TimeUnit.SECONDS);
client.setWriteTimeout(10, TimeUnit.SECONDS);
client.setReadTimeout(30, TimeUnit.SECONDS);
```