# docker-compose安装LNPM
### 前置条件
* docker
* [docker-compose](https://github.com/docker/compose/releases)

### 默认使用以下镜像环境，可快速自定义修改
```
nginx:1.15.12
mysql:8.0.16
php:7.3.5-fpm
redis:5.0.5
swoole:4.3(因为和xdebug冲突，默认注释了，需要的话可以自行打开)
xdebug:2.7
composer
```
### 如何使用Docker加速器
>由于pull的是docker官方仓库的镜像，国内用户建议开启国内镜像加速，阿里云和网易蜂巢都有提供

例：开启阿里云docker镜像加速

加速地址申请链接https://dev.aliyun.com
centos7.4测试，针对Docker客户端版本大于1.10的用户
```
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://xxxxx.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```



### 开始使用

权限(根据自定义配置来给权限)
```
mkdir -p /var/run/mysqld
chmod -R 777 /var/run/mysqld

mkdir -p /data/log/www/
chmod -R 755 /data/log/www/
```
运行
```
git clone https://github.com/codingcn/docker-lnmp.git
cd docker-lnmp
docker-compose up -d
```

使用composer创建laravel项目示例：
```
# 注意这儿的目录需要指定的是/data/www/blog容器绝对路径，而不是blog
docker exec -it php composer create-project --prefer-dist laravel/laravel /data/www/blog
```

# 小技巧
我们可以通过别名在主机上为其它容器添加一些快捷命令。
比如：

```
vim ~/.bashrc
# 添加php与mysql容器执行命令
alias php='docker exec -it php php'
alias composer='docker exec -it php composer'
alias mysql='docker exec -it mysql mysql'

# 生效
source ~/.bashrc
```

这样操作之后，我们就可以直接在主机下面直接运行容器内的php与mysql等命令了。

>作者实测，配置好点的服务器，可实现三分钟搭建好lnmp，很爽有木有！