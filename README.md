# docker-lnmp
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
https://github.com/codingcn/docker-lnmp.git
cd docker-lnmp
docker-compose up -d
```

