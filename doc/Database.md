# PicManager (J2EE 项目) 数据库结构

## 连接信息

服务器地址: 34.92.201.227

端口：3306

## 表结构

### asset

存储资源信息。

| 字段               | 数据类型                         | 含义                                     |
| ------------------ | -------------------------------- | ---------------------------------------- |
| assetid            | int                              | 图片id                                   |
| assetname          | Varchar(100)                     | 名称                                     |
| assettype          | enum('pic','video')              | 类型（图片或视频）                       |
| category           | enum('photograph','gis','cloud') | 图片类型（实景摄影，遥感图像，卫星云图） |
| url                | varchar(300)                     | 图片链接                                 |
| country            | varchar(100)                     | 图片所在国家                             |
| location           | varchar(100)                     | 具体地点                                 |
| latitude           | varchar(20)                      | 经度                                     |
| longitude          | varchar(20)                      | 纬度                                     |
| acq_date           | datetime                         | 获取时间                                 |
| scale              | varchar(100)                     | 比例尺                                   |
| upload_date        | datetime                         | 上传日期                                 |
| last_modified_date | datetime                         | 最后一次修改日期                         |
| uploader_uid       | int(11)                          | 上传者id                                 |

### user

存储用户信息。

| 字段               | 数据类型                         | 备注   |
| --------------------- | -------------------------------------- | ------------------------------------ |
| uid                   | int(11)(primary key ,  auto_increment) | 用户id|
| username              | varchar(100)(unique)                   | 用户名                               |
| password              | varchar(100)                           | 密码（SHA1加密存储）               |
| password_last_changed | datetime                               | 密码最后一次修改时间                 |
| email                 | varchar(100)                           | 邮箱                                 |
| security_problem      | varchar(1000)                          | 安全问题                             |
| security_answer       | varchar(1000)                          | 安全应答                             |
| registration_date     | datetime                               | 注册时间                             |
| registration_ip       | varchar(255)                           | 注册ip                               |
| role                  | varchar(50)                            | 身份（普通用户，管理员，超级管理员） |

 ### log

存储日志信息。

| 字段               | 数据类型                         | 备注                                   |
| ------------------ | -------------------------------- | ---------------------------------------- |
| logid      | int(11)(primary key ,auto_increment)                         | 记录操作次数 |
| uid        | varchar(100)                                                 | 操作者id     |
| username   | varchar(255)                                                 | 操作者用户名 |
| assetid    | varchar(100)                                                 | 操作图片id   |
| type       | enum('upload','download','delete','modify','login','logout') | 操作类型     |
| assetname  | varchar(255)                                                 | 操作图片名称 |
| date       | datetime                                                     | 操作时间     |
| request_ip | varchar(255)                                                 | 请求ip       |
| notes      | varchar(1000)                                                | 注释         |