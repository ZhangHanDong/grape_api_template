# 说明

基于Grape的API 微服务Docker化模板项目，对于简单的服务开发来说方便快捷。

# 配置说明

在app.default.env里配置依赖，比如：

```
RACK_ENV=production

```


# Docker
```
$ docker-compose up -d
```


### 部署后需手动执行migrate命令

```
$ docker-compose run demo rails db:migrate
```
