# 总体架构

## 层次结构

项目层次结构


```
all-projects
├─ library-foobar
├─ app
│  ├─ libs
│  ├─ src
│  │  ├─ androidTest
│  │  │  └─ java
│  │  │     └─ com/futurice/project
│  │  └─ main
│  │     ├─ java
│  │     │  ├─ droid
│  │     │  │  ├─ app
│  │     │  │  └─ util
│  │     │  └─ app
│  │     │     ├─ client
│  │     │     │  ├─ activity
│  │     │     │  ├─ fragment
│  │     │     │  ├─ view
│  │     │     │  ├─ adapter
│  │     │     │  └─ ...
│  │     │     ├─ manager
│  │     │     ├─ model
│  │     │     ├─ service
│  │     │     │  ├─ http
│  │     │     │  ├─ sqlite
│  │     │     │  └- ...
│  │     │     ├─ util
│  │     │     └─ ...
│  │     ├─ res
│  │     └─ AndroidManifest.xml
│  ├─ build.gradle
│  └─ proguard-rules.pro
├─ fooLibrary
├─ barLibrary
├─ build.gradle
└─ settings.gradle
```

### 界面交互层 [app.client]

界面，拥有窗口，可以调用同一层次及下层的所有类

### 数据逻辑层 [app.manager, app.model]

不拥有窗口，可以持有Context，可以调用同一层次及下层的所有类

### 通用功能层 [app.service, app.util]

不可以持有Context，只能调用同一层次的类


