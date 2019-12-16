# PicManager (J2EE 项目) 后端文档


## Logout

登出用户。

方法： Post / Get

URL： /Logout

参数：无。

## ManageAssetSearch

根据筛选器提供图片数据，并传递给 manage.jsp 供浏览显示。

方法：Post


## UpdateUser

用于更新用户信息。

方法：Post

URL：/updateuser

参数 | 合法值 | 备注
---|---|---
uid | *Integer* | 要操作的用户 ID
type | {delete, setPassword, setUsername, setRole} | 指定修改的类型
newPassword | *String* | 当type为setPassword时的新密码
newUsername | *String* | 当type为setUsername时的新用户名
newRole | {user, admin} | 当type为setRole时的新角色

更新后在 session 中设置 Attribute, 将 user_update_stat 设置成 success 或 fail。

## ChangePassword

用于修改密码。