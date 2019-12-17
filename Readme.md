# PicManager

## Intro

数据库可视化 & 用户与图片的增删改查。

Based On J2EE, MDUI, MySQL。

![image-20191216145255283](Readme.assets/image-20191216145255283.png)

## Demo

项目部署地址：http://picmanager.billc.io/

超级管理员账户：root，密码：root

管理员账户：admin，密码：admin

普通用户账户：user，密码：user

新注册的用户默认权限：user。

## 前端文档

### 跳转逻辑

左侧导航栏可以在 view, manageasset.jsp, me.jsp 之间互相跳转。

```mermaid
graph TD
in(index.jsp)--> |已登录则自动跳转| vs[ViewSearch]
vs--> vi(view.jsp)
in-->|管理员有权限访问|mas[ManageAssetSearch]-->ma(manageasset.jsp)
ma-->u[UpdateAsset,deleteFile,UploadFile...]
mu(manageuser.jsp)
mu-->uu[UpdateUser, Register...]
log(log.jsp)
me(me.jsp)
ma-->log
ma-->mu
in-->me
me-->cp[ChangePassword]
in-->r[Register]-->in
me-->lo[Logout]



```

### 权限控制

在本网站中，不同的用户角色具有不同在站点具有权限，详细介绍如下：

|                  | 未登录 | 普通用户(user) | 管理员(admin) | 超级管理员(root) |
| ---------------- | ------ | -------------- | ------------- | ---------------- |
| 注册新账号       | √      | √              | √             | √                |
| 查阅图片         | x      | √              | √             | √                |
| 下载图片         | x      | √              | √             | √                |
| 查看日志         | x      | √              | √             | √                |
| 管理图片         | x      | x              | √             | √                |
| 提升用户为 admin | x      | x              | √             | √                |
| 提升用户为 root  | x      | x              | x             | √                |
| 管理 user        | x      | x              | √             | √                |
| 修改 admin 密码  | x      | x              | √             | √                |
| 修改 root 密码   | x      | x              | x             | √                |

*管理图片 = 图片的增删改查。

*管理用户 = 修改用户名、密码、删除用户的权限。

### 页面简介

#### /index.jsp

主页。该页面具有动态背景，具有注册用户和登录用户功能，分别封装在两个对话框内。

在界面加载时会读取 request 中 的 stat 参数选择是否弹出提示：

| stat 值              | initMessage          |
| -------------------- | -------------------- |
| not_logined          | 请先登录或注册账号   |
| logged_out           | 已登出               |
| wrong_password       | 登录失败：密码错误   |
| user_not_found       | 登录失败：用户不存在 |
| registration_success | 注册成功             |
| already_exist        | 用户名已存在         |
| *null*               | 无                   |

该页面会读取浏览器中的 cookie，如果读取到了 identifier 和 password 将会自动将信息提交给 Login 类。

Cookie 的有效期为 3 天。

#### /view.jsp

查看图片的界面。具有筛选器功能，在筛选后提交表单。具有图片下载、图片元数据浏览、放大浏览等功能。

该页面作为展示层，无法直接访问。需要通过后端的 ViewSearch 类提供数据，再跳转到本页面。

如果在 session 中找不到 logined_uid 参数，则说明用户未登录，会自动跳转到 index.jsp。

在页面加载完成后，会读取 session 中的若干参数是否为 null 决定是否弹出消息提示。具有以下参数：

| session 中的参数 | 值       | initMessage        |
| ---------------- | -------- | ------------------ |
| edit_stat        | success  | 编辑成功           |
| edit_stat        | *String* | 编辑失败：*String* |
| upload_stat      | success  | 登陆成功           |
| upload_stat      | *String* | 上传失败：*String* |
| delete_stat      | Success  | 删除成功           |
| delete_stat      | *String* | 删除失败：*String* |

#### /manageasset.jsp

管理图片的界面。该界面只有当用户权限为 role 或 admin 时才可访问。如果用户不具有相应权限，将会被跳转至浏览界面。

该页面作为展示层，无法直接访问。需要通过后端的 ManageAssetSearch 类提供数据，再跳转到本页面。

如果在 session 中找不到 logined_uid 参数，则说明用户未登录，会自动跳转到 index.jsp。

如果用户权限不足，会跳转到 view.jsp。

在页面加载完成后，会读取 session 中的若干参数是否为 null 决定是否弹出消息提示。具有以下参数：

| 参数                | initMessage              |
| ------------------- | ------------------------ |
| to_notify_success   | 登陆成功                 |
| to_notify_no_access | 您没有权限管理图片和用户 |

#### /manageuser.jsp

管理用户的界面。该界面只有当用户权限为 role 或 admin 时才可访问。

如果在 session 中找不到 logined_uid 参数，则说明用户未登录，会自动跳转到 index.jsp。

如果用户权限不足，会跳转到 view.jsp。

在页面加载完成后，会读取 session 中的参数 update_user_stat 的值来决定是否弹出消息。具有以下参数：

| update_user_stat 值 | initMessage |
| ------------------- | ----------- |
| success             | 更新成功    |
| fail                | 已登出      |
| *String*            | *String*    |

#### /log.jsp

查看日志。对于 root/admin 权限的用户可以看到管理图片和管理用户的跳转接口。

如果在 session 中找不到 logined_uid 参数，则说明用户未登录，会自动跳转到 index.jsp。

日志具有登录、删除、上传、更新四种类型，每一种日志都会在这里显示。支持显示最近 1000 条日志，按照日期从新到旧排序。

#### /me.jsp

个人信息界面，具有动态背景。会展示用户的用户名、UID 和注册时间。

如果在 session 中找不到 logined_uid 参数，则说明用户未登录，会自动跳转到 index.jsp。

提供修改自己账户的密码和登出功能。

#### /about.jsp

封装了一个「关于」对话框。便于一次修改在所有界面更新。

## 后端文档

//todo

## 部署文档

