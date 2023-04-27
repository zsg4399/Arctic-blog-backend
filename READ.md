# 欢迎使用北极风的个人博客系统
## 项目运行环境的一些版本配置：
* MySQL `8.0.28`
* Redis `6.0版本`
* MongoDB  `4.4.17`
* JAVA `8`
## 如何本地运行这个项目
### 1.拉取项目到本地 
`git clone https://github.com/zsg4399/Arctic-blog-backend.git`

### 2.修改application.yml
* 将druid配置下的 `username`和 `password`配置项修改成自己的，并且确认自己的MySQL版本高于5
* 将Redis部分相关的配置根据注释进行修改
`mail:
host: smtp.qq.com  #设置邮箱类型 
username: yourEmail       #邮箱地址 
password: yourSmtpToken   #授权码 
default-encoding: UTF-8`
* MongoDB自行安装好后修改application.yml中的配置
### 3.修改图片上传功能
在`imagecontroller`下的`getUploadToken`接口是返还smms的api token，前端拿到这个token后就能直接进行图片上传功能，如果需要使用这个功能，只需要注册smms后拿到自己账号的api token，然后将ImageController下的Access_Token常量修改为你的api token即可
# 项目功能介绍
