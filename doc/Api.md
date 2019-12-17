# PicManager (J2EE 项目) 后端文档

## 类介绍

###  utils.Config

全局配置类。

变量：

| 变量名        | 数据类型 | 备注       |
| ------------- | -------- | ---------- |
| THEME_PRIMARY | String   | 全局主题色 |

方法：无

### utils.Utils

实用工具类。

变量：无

| 方法名          | 域     | 输入值 | 返回值 | 备注 |
| --------------- | ------ | ------|--- | ---- |
| getRealRemoteIP | Public | HttpServletRequest request | String IP |取得 request 中的访问 IP|

## Servlet 介绍

### Login

登录用户。

方法： Post / Get

URL： /login

先判断是否 session 中已记录信息，如有则直接登录，否则需用户名密码登录

参数 | 合法值 |备注
---|---|--- 
identifier | *String* | 验证所用用户名
password | *String* | 验证密码
ipAddress | *String* | 用于记录日志（登录、下载和管理操作都存在，以下略）
AutoLogin | String | 是否通过 cookie 记住的密码登录 

密码正确则跳转到浏览界面，如密码错误在 session 中设置 Attribute, 将 stat 设置成 wrong_password。

登录成功后将会在 session 中记录 logined_uid、logined_username、logined_user_role 三个参数供其他页面访问。

### Logout

登出用户。

方法： Post / Get

URL： /logout

参数：无。

### ManageAssetSearch

实现管理页面的筛选功能

方法：Post

URL:  /manageassetsearch

通过判断 session 中的参数 logined_uid 是否为空来判断用户是否登录，如果没有登录则跳转到 index.jsp。

用 session 中的参数 logined_user_role 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 view。

（则不存在上传，更改，删除操作）

参数 | 合法值 |备注
---|---|--- 
searchName | *String* | 所筛选图片名字
searchCountry | *String* | 所筛选国家
searchScale | *String* | 所筛选比例尺

完成搜索后将所搜索到的所有数据放入 assetMap 内，通过 request.setAttribute 传递数据，跳转至 manageasset.jsp。

### ChangePassword
用于修改密码。

方法：Post 

URL: /changepassword

通过判断 session 中的参数 logined_uid 是否为空来判断用户是否登录，如果没有登录则跳转到 index.jsp。

用 session 中的参数 logined_user_role 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 view。

参数 | 合法值 | 备注
---|---|---
oldPassword | *String* | 原密码，用于验证身份
newPassword | *String* | 新密码

更新后在session 中设置 Attribute，将 stat 设置成change_success 或 wrong_old_password。

### DeleteFile

用于删除已上传的图片

方法：Post

URL: /deletefile

通过判断 session 中的参数 logined_uid 是否为空来判断用户是否登录，如果没有登录则跳转到 index.jsp。

用 session 中的参数 logined_user_role 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 view。

参数 | 合法值 | 备注
---|---|---
aid | *String* | 所删除图片id

删除后在session 中设置 Attribute, 将delete_stat 设置为 success 或 fail。

### DownloadFile

用于下载已上传图片。

方法：Post / Get

URL: /downloadfile

通过判断 session 中的参数 logined_uid 是否为空来判断用户是否登录，如果没有登录则跳转到 index.jsp。

参数 | 合法值 | 备注
---|---|---
aid | *String* | 下载图片id
assetname | *String* | 下载图片名称

### Register

用于注册用户。

方法：Post

URL： /register

可在注册页面注册或在管理页面手动创建。

参数 | 合法值 | 备注
---|---|---
name | *String* | 用户名,判断是否已经存在
password | *String* | 密码
email | *String* | 邮箱
date | *String* | 注册时间
ip | *String* | 注册ip

注册界面：

如用户名未冲突将 session中设置 Attribute，将 stat 设为registration_success

如用户名已存在将 session中设置 Attribute，将 stat 设为already_exist。
而后跳转至登录界面

管理界面：

如用户名未冲突将session中设置 Attribute，将 update_user_stat 设为 添加成功 

如用户名已存在将session中设置 Attribute，将 update_user_stat 设为 无法添加：用户名已存在 。
跳转回管理界面

### UpdateAsset

用于更新图片信息。

方法：Post

URL：/updateasset

通过判断 session 中的参数 logined_uid 是否为空来判断用户是否登录，如果没有登录则跳转到 index.jsp。

用 session 中的参数 logined_user_role 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 view。

参数 | 合法值 | 备注
---|---|---
aid | *Int* | 图片id
name | *String* | 图片名称
country | *String* | 国家
location | *String* | 具体位置
latitude | *String* | 经度
longitude | *String* | 纬度

更新后在 session 中设置 Attribute, 将 edit_stat 设置成 success 或 编辑失败的信息。

### UpdateUser

用于更新用户信息。

方法：Post

URL：/updateuser

通过判断 session 中的参数 logined_uid 是否为空来判断用户是否登录，如果没有登录则跳转到 index.jsp。

用 session 中的参数 logined_user_role 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 view。

参数 | 合法值 | 备注
---|---|---
uid | *Integer* | 要操作的用户 ID
type | {delete, setPassword, setUsername, setRole} | 指定修改的类型
newPassword | *String* | 当type为setPassword时的新密码
newUsername | *String* | 当type为setUsername时的新用户名
newRole | {user, admin} | 当type为setRole时的新角色


更新后在 session 中设置 Attribute, 将 user_update_stat 设置成 success 或 fail。

### UploadFile

用于上传图片

方法：Post, enctype="multipart/form-data"

URL：/uploadfile

通过判断 session 中的参数 logined_uid 是否为空来判断用户是否登录，如果没有登录则跳转到 index.jsp。

用 session 中的参数 logined_user_role 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 view。

参数 | 合法值 | 备注
---|---|---
uploadName | *String* | 上传图片名称
uploadCategory  | {photograph,gis,cloud} | 上传图片类型
uploadCountry | *String* | 所在国家
uploadLocation | *String* | 具体位置
uploadLatitude | *String* | 经度
uploadLongitude | *String* | 纬度
uploadScale | *String* | 比例尺

上传后在 session 中设置 Attribute，根据结果将 upload_stat 设置成 success 或 fail。

### ViewSearch

提供筛选功能，为 view.jsp 提供数据。

参数 | 合法值 |备注
---|---|--- 
searchName | *String* | 所筛选图片名字
searchCountry | *String* | 所筛选国家
searchScale | *String* | 所筛选比例尺

如果缺失任意一个参数，表示用户没有设置筛选器，将默认获取所有信息。

完成搜索后将所搜索到的所有数据放入 assetMap 内，通过 request.setAttribute 传递数据，跳转至 view.jsp。





