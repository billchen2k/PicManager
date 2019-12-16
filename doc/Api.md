# PicManager (J2EE 项目) 后端文档

## Login

登录用户。

方法： Post / Get

URL： /login

先判断是否session中已记录信息，如有则直接登录，否则需用户名密码登录

参数 | 合法值 |备注
---|---|--- 
identifier | *String* | 验证所用用户名
password | *String* | 验证密码
ipAddress | *String* | 用于记录日志（登录、下载和管理操作都存在，以下略）

密码正确则跳转到浏览界面，
如密码错误在 session 中设置 Attribute, 将 stat 设置成 wrong_password。
## Logout

登出用户。

方法： Post / Get

URL： /logout

参数：无。

## ManageAssetSearch

实现管理页面的筛选功能

方法：Post

URL:  /manageassetsearch

先用logined_uid 判断是否登录，如未登录跳转到/view界面

（除登录注册界面都有判断）

用logined_user_role判断身份，如非管理员则显示无权限进行管理，不显示管理界面

（则不存在上传，更改，删除操作）

参数 | 合法值 |备注
---|---|--- 
searchName | *String* | 所筛选图片名字
searchCountry | *String* | 所筛选国家
searchScale | *String* | 所筛选比例尺

完成后跳转至所筛选内容

## ChangePassword
。
用于修改密码。

方法：Post 

URL: /changepassword

参数 | 合法值 | 备注
---|---|---
oldPassword | *String* | 原密码，用于验证身份
newPassword | *String* | 新密码

更新后在session 中设置 Attribute，将 stat 设置成change_success 或 wrong_old_password。

## DeleteFile

用于删除已上传的图片

方法：Post

URL: /deletefile

参数 | 合法值 | 备注
---|---|---
aid | *String* | 所删除图片id

删除后在session 中设置 Attribute, 将delete_stat 设置为 success 或 fail。

## DownloadFile

用于下载已上传图片。

方法：Post / Get

URL: /downloadfile

参数：无

##Register

用于注册用户。

方法：Post

URL： /register

可在注册页面注册 或 在管理页面手动创建

参数 | 合法值 | 备注
---|---|---
name | *String* | 用户名,判断是否已经存在
password | *String* | 密码
email | *String* | 邮箱
date | *String* | 注册时间
ip | *String* | 注册ip

注册界面：

如用户名未冲突将session中设置 Attribute，将 stat 设为registration_success

如用户名已存在将session中设置 Attribute，将 stat 设为already_exist。
而后跳转至登录界面

管理界面：

如用户名未冲突将session中设置 Attribute，将 update_user_stat 设为 添加成功 

如用户名已存在将session中设置 Attribute，将 update_user_stat 设为 无法添加：用户名已存在 。
跳转回管理界面

##UpdateAsset

用于更新图片信息。

方法：Post

URL：/updateasset

参数 | 合法值 | 备注
---|---|---
aid | *Int* | 图片id
name | *String* | 图片名称
country | *String* | 国家
location | *String* | 具体位置
latitude | *String* | 经度
longitude | *String* | 纬度

更新后在 session 中设置 Attribute, 将 edit_stat 设置成 success 或 编辑失败。

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

##UploadFile

用于上传图片

方法：Post

URL：/uploadfile

参数 | 合法值 | 备注
---|---|---
newAsset.getName() | *String* | 上传图片名称
newAsset.getCategory()  | {photograph,gis,cloud} | 上传图片类型
newAsset.getUrl() | *String* | 图片链接
newAsset.getCountry() | *String* | 所在国家
newAsset.getLocation() | *String* | 具体位置
newAsset.getLatitude() | *String* | 经度
newAsset.getLongitude() | *String* | 纬度
Utils.getCurrentDateTime() | *datetime* | 当前时间（上传时间和最后一次更改时间）
newAsset.getScale() | *String* | 比例尺
session.getAttribute("logined_uid") | *Int* | 上传用户id

上传后在 session 中设置 Attribute, 将 upload_stat 设置成 success 或 fail。

##ViewSearch

实现浏览页面的筛选功能

参数 | 合法值 |备注
---|---|--- 
searchName | *String* | 所筛选图片名字
searchCountry | *String* | 所筛选国家
searchScale | *String* | 所筛选比例尺

完成后跳转至所筛选内容





