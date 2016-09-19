# 运行时配置

## 配置

### RuntimeMode

决定程序是以调度模式运行还是生产模式运行，这个设置与BuildType没有关系，主要用于在生产模式下做一些与调试模式相关的操作（比如输出日志）。

### UpdateMode

是否支持升级，主要用于调试升级逻辑。

### BootMode

决定程序启动时，优先级最高的是哪个配置文件。

### StorageMode

决定程序运行过程中，使用什么类型的存储。

## BootMode与StorageMode下的文件读写权限

|          | Source         | Internal   | External   | Public |
| -------- |:--------------:| :--------: | :--------: | :-----:|
| Fixed    | Network/Assets | -          | W          | W      |
| Selected | Network/Assets | -          | W          | W      |
| Assets   | Assets         | -          | W          | W      |
| Local    | Public         | R          | R/W        | R/W    |
| Ignored  | -              | -          | R          | R      |