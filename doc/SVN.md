# SVN使用建议

## 摘要
* SVN的目录结构
* SVN相关命名规范

### SVN的目录结构
```
repository
├─ branches
├─ tags
└─ trunk
```

其中trunk为项目的主分支目录，是经常要变动的分支；branches为实现特别功能或修复Bug而建立的分支，不经常发去；tags为trunk或branches中的版本快照，为只读目录。

### SVN相关命名规范
SVN标签用来记录特定的SVN版本，采用Maven的版本号规范:x.y.z-TYPE的方式，如果0.12.34-Beta, 1.23.45-Test等。其中后缀可以是:

- Dev或Test: 用于内部测试的版本
- Alpha: Alpha测试版本
- Beta: Beta测试版本
- RC: 发布版本

比如 1.2.3-Dev, 2.5.8-RC1, 都是合法而规范的标签名。


