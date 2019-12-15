# PicManager (J2EE 项目) 前端文档

### /index.jsp。

主页。同时该页面具有动态背景，有注册和登录功能。

在界面加载时会读取 request 中 的 stat 参数选择是否弹出提示：

stat 值 | initMessage
---|---
not_logined | 请先登录或注册账号
logged_out|已登出
wrong_password | 登录失败：密码错误
user_not_found | 登录失败：用户不存在
registration_success | 注册成功
already_exist | 用户名已存在
*null* | 无

### /view.jsp

查看图片的界面。具有筛选器功能，在筛选后提交表单。具有图片下载、放大浏览等功能。

如果用户未登录，将会跳转 index.jsp 并将 stat 设置未 not_logined。

### /manageasset.jsp

管理图片的界面。该界面只有当用户权限为 role 或 admin 时才可访问。

如果用户未登录，将会跳转 index.jsp 并将 stat 设置未 not_logined。

如果用户权限不足，会跳转到 view.jsp。

### /manageuser.jsp

管理用户的界面。该界面只有当用户权限为 role 或 admin 时才可访问。

### /log.jsp

查看日志。对于 root/admin 权限的用户可以看到管理图片和管理用户的跳转接口。

### /me.jsp

我的界面。同时提供修改密码功能。
