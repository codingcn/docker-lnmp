# docker-compose安装nginx+php+mysql+redis+swoole
### 前置条件
```
docker
docker-compose
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
### 默认使用以下镜像，可自行修改
```
nginx:1.13.7
mysql:5.7.20
php:7.1.11-fpm
redis:4.0.2
swoole:2
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


使用composer
```
vim ~/.bashrc
# 添加composer方法
composer () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $(pwd):/app \
        composer "$@"
}

# 生效
source ~/.bashrc

# 配置国内镜像
composer config -g repo.packagist composer https://packagist.phpcomposer.com
```
这样就可以直接在主机上`composer something...`

# 小技巧
通过composer镜像使用的启发，我们同样可以在主机上为其它容器添加一些命令。
比如：
```
vim ~/.bashrc
# 添加php与mysql容器执行命令
alias php='docker exec -it php php'
alias mysql='docker exec -it mysql mysql'

# 生效
source ~/.bashrc
```

这样操作之后，我们就可以直接在主机下面直接运行容器内的php与mysql等命令了。

>作者实测，配置好点的服务器，可实现三分钟搭建好lnmp，很爽有木有！