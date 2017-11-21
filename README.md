# docker-compose安装nginx+php+mysql+redis
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
nginx:1.13.6
mysql:5.7.20
php:7.1.11-fpm
redis:4.0.2
```


### 开始使用
```
git clone https://github.com/codingcn/docker-lnmp.git
cd docker-lnmp
docker-compose up -d
```

使用composer
```
docker run --rm -it \
  -v $(pwd):/usr/src/app \
  -v ~/.composer:/home/composer/.composer \
  -v ~/.ssh/id_rsa:/home/composer/.ssh/id_rsa:ro \
  composer
```
>或者不想每次使用composer都写那么一长串
那么我们可以为主机添加一个别名


```
mkdir ~/alias
vim  ~/alias/composer.sh

#!/bin/bash
docker run --rm -it -v $(pwd):/usr/src/app -v ~/.composer:/home/composer/.composer -v ~/.ssh/id_rsa:/home/composer/.ssh/id_rsa:ro composer $@


chmod +x  ~/alias/composer.sh



vim ~/.bashrc
alias composer="~/alias/composer.sh"

source ~/.bashrc


composer config -g repo.packagist composer https://packagist.phpcomposer.com
```
这样就可以直接在主机上`composer something...`

>作者实测，配置好点的服务器，可实现三分钟搭建好lnmp，很爽有木有！