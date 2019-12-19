## PicManager (J2EE 项目) 后端文档

> Version 0.1.191219

### 类文档

####  utils.Config

全局配置类。在这个类中存储了系统运行的常见变量。

变量：

| 变量名        | 数据类型 | 备注       |
| ------------- | -------- | ---------- |
| THEME_PRIMARY | String   | 全局主题色，可以使用 MDUI 中的主题 |
| THEME_ACCENT | String   | 全局强调色，可以使用 MDUI 中的主题 |
| MYSQL_URL | String | 数据库 url，以JDBC格式存储 |
| MYSQL_USER | String | 数据库用户名 |
| MYSQL_PASS | String | 数据库密码 |
| UPLOAD_DIRECTORY | String | 上传文件的储存目录 |
| MEMORY_THRESHOLD | int | 上传文件时的最大内存 |
| MAX_REQUEST_SIZE | int | 上传文件时的最大请求大小 |
| MAX_FILE_SIZE | int | 上传文件时的最大文件大小 |

方法：无

#### utils.DatabaseManager

数据库连接类。任何需要对数据库进行都可以通过本类取得数据库连接并且可以方便地执行查询和更新语句。

已经包含了错误处理。

变量 ：

| 变量名        | 数据类型 | 备注       |
| ------------- | -------- | ---------- |
| JDBC_DRIVER | String | mysql驱动 |
| conn | Connection | 数据库连接 |
| stat | Statement | 用于执行简单sql语句 |
| rs | ResultSet | 返回结果类 |

方法：

| 方法名          | 域     | 输入值 | 返回值 | 备注 |
| --------------- | ------ | ------|--- | ---- |
| DatabaseManager | Public | 无 | 无 | 加载数据库驱动 |
| getConnection | Public | 无 | Connection | 取得数据库连接，如果成功返回 Connection 连接，失败则打印错误信息并返回 null。 |
| executeQuery | Public | String | ResultSet | 执行查询指令。如果成功返回结果集，失败则打印错误信息并返回 null。 |
| executeUpdate | Public | String | int | 执行更新指令。如果成功则执行影响的行数，失败则打印错误信息并返回 -1。 |
| close | Public | 无 | void | 关闭数据库连接 |

#### utils.Encrypt

加密类

变量： 无 

方法 ：

| 方法名          | 域     | 输入值 | 返回值 | 备注 |
| --------------- | ------ | ------|--- | ---- |
| SHA1 | Public | String | String | 使用 SHA1 加密，返回密码加密后结果 |


#### utils.Utils

实用工具类。

变量：无

| 方法名          | 域     | 输入值 | 返回值 | 备注 |
| --------------- | ------ | ------|--- | ---- |
| getRealRemoteIP | Public | HttpServletRequest request | String |取得 request 中的真实 IP。用于处理通过 localhost 访问网站时的日志异常。|
| getCurrentDateTime | Public | 无 | String | 获取 MySQL 数据库格式存储当前时间 |
| parseAsset | Public | ResultSet | Asset | 通过数据库查询的返回结果整合信息，将获得信息形成 bean类里Asset 的对象 |
| parseUser | Public | ResultSet | User | 用所获得信息形成 bean类里User 的对象 |
#### bean.Asset

资源的 Java Bean，用户沟通数据库和后端。

具有以下字段的 Setter 和 Getter:

| Variation          | Type    | Default Value |
| ------------------ | ------- | ------------- |
| id                 | int     | -1            |
| name               | String  | N/A           |
| type               | String  | N/A           |
| category           | String  | N/A           |
| url                | String  | N/A           |
| acq_date           | String  | N/A           |
| upload_time        | Stringn | N/A           |
| uploader_uid       | int     | -1            |
| last_modified_date | String  | N/A           |
| scale              | String  | N/A           |
| country            | String  | N/A           |
| location           | String  | N/A           |
| latitude           | String  | N/A           |
| longitude          | String  | N/A           |

#### bean.User

用户的 Java Bean，用户沟通数据库和后端。

具有以下字段的 Setter 和 Getter：

| 字段                  | 数据类型 | 缺省值 |
| --------------------- | -------- | ------ |
| uid                   | int      | -1     |
| username              | String   | N/A    |
| password              | String   | N/A    |
| email                 | String   | N/A    |
| registration_date     | String   | N/A    |
| registration_ip       | String   | N/A    |
| role                  | String   | user   |
| password_last_changed | String   | N/A    |

### Servlet 文档

#### Login

登录用户。

方法： Post / Get

URL： /login

先判断是否 session 中已记录信息，如有则直接登录，否则需用户名密码登录

参数 | 合法值 |备注
---|---|--- 
identifier | *String* | 用户的标识符，可以是用户名或密码 
password | *String* | 验证密码
AutoLogin | String | 是否通过 cookie 记住的密码登录 

密码正确则跳转到浏览界面，如密码错误在 session 中设置 Attribute, 将 `stat` 设置成 `wrong_password`。

登录成功后将会在 session 中记录 `logined_uid`、``logined_username`、`logined_user_role` 三个参数供其他页面访问。

#### Logout

登出用户。

方法： Post / Get

URL： /logout

参数：无。

#### ManageAssetSearch

实现管理页面的筛选功能，为 `manage.jsp`提供数据。将会将所有查询到的数据放置到 `HashMap <Interget, Asset> assetMap`内通过 `request.setAttribute`传递给前端。

方法：Post

URL:  /manageassetsearch

在处理请求之前，通过判断session 中的参数`logined_uid` 是否为空来判断用户是否登录，如果没有登录则跳转到 `index.jsp`。

用 session 中的参数`logined_user_role` 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 `view`。

（则不存在上传，更改，删除操作）

参数 | 合法值 |备注
---|---|--- 
searchName | *String* | 所筛选图片名字
searchCountry | *String* | 所筛选国家
searchScale | *String* | 所筛选比例尺

完成搜索后将所搜索到的所有数据放入 assetMap 内，通过 request.setAttribute 传递数据，跳转至 manageasset.jsp。

#### ChangePassword

用于由用户主动修改自己的密码。管理员修改密码使用的 Servelt 是 `UpdateUser`。

方法：Post 

URL: /changepassword

在处理请求之前，通过判断session 中的参数`logined_uid` 是否为空来判断用户是否登录，如果没有登录则跳转到 `index.jsp`。

用 session 中的参数`logined_user_role` 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 `view`。

参数 | 合法值 | 备注
---|---|---
oldPassword | *String* | 原密码，用于验证身份
newPassword | *String* | 新密码

更新后在session 中设置 Attribute，将 stat 设置成change_success 或 wrong_old_password。

#### DeleteFile

用于删除已上传的图片。

方法：Post

URL: /deletefile

在处理请求之前，通过判断session 中的参数`logined_uid` 是否为空来判断用户是否登录，如果没有登录则跳转到 `index.jsp`。

用 session 中的参数`logined_user_role` 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 `view`。

参数 | 合法值 | 备注
---|---|---
aid | *String* | 所删除图片id

删除后在session 中设置 Attribute, 将delete_stat 设置为 success 或 fail。

#### DownloadFile

用于下载已上传图片。主要的作用为记录日志，文件下载本身应当由发出请求的前端页面实现。

方法：Post / Get

URL: /downloadfile

在处理请求之前，通过判断session 中的参数`logined_uid` 是否为空来判断用户是否登录，如果没有登录则跳转到 `index.jsp`。

参数 | 合法值 | 备注
---|---|---
aid | *String* | 下载图片id
assetname | *String* | 下载图片名称

#### Register

用于注册用户。管理员注册和用户自行注册都使用的本类。

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

如用户名未冲突将 `session`中设置 `Attribute`，将 `stat` 设为``registration_success`

如用户名已存在将 `session`中设置 `Attribute`，将 `stat` 设为``already_exist`。
而后跳转至登录界面

管理界面：

如用户名未冲突将session中设置 Attribute，将 update_user_stat 设为 添加成功 

如用户名已存在将session中设置 Attribute，将 update_user_stat 设为 无法添加：用户名已存在 。
跳转回管理界面

#### UpdateAsset

用于更新图片信息。

方法：Post

URL：/updateasset

在处理请求之前，通过判断session 中的参数`logined_uid` 是否为空来判断用户是否登录，如果没有登录则跳转到 `index.jsp`。

用 session 中的参数`logined_user_role` 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 `view`。

参数 | 合法值 | 备注
---|---|---
aid | *Int* | 图片id
name | *String* | 图片名称
country | *String* | 国家
location | *String* | 具体位置
latitude | *String* | 经度
longitude | *String* | 纬度

更新后在 session 中设置 Attribute, 将 edit_stat 设置成 success 或 编辑失败的信息。

#### UpdateUser

用于更新用户信息。

方法：Post

URL：/updateuser

在处理请求之前，通过判断session 中的参数`logined_uid` 是否为空来判断用户是否登录，如果没有登录则跳转到 `index.jsp`。

用 session 中的参数`logined_user_role` 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 `view`。

参数 | 合法值 | 备注
---|---|---
uid | *Integer* | 要操作的用户 ID
type | {delete, setPassword, setUsername, setRole} | 指定修改的类型
newPassword | *String* | 当type为setPassword时的新密码
newUsername | *String* | 当type为setUsername时的新用户名
newRole | {user, admin} | 当type为setRole时的新角色


更新后在 session 中设置 Attribute, 将 user_update_stat 设置成 success 或 fail。

#### UploadFile

用于上传图片

方法：Post, enctype="multipart/form-data"

URL：/uploadfile

在处理请求之前，通过判断session 中的参数`logined_uid` 是否为空来判断用户是否登录，如果没有登录则跳转到 `index.jsp`。

用 session 中的参数`logined_user_role` 判断身份，如非管理员则显示无权限进行管理。在前端不会显示管理界面，即使通过地址栏访问也会跳转到 `view`。

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

#### ViewSearch

提供筛选功能，沟通数据库，为 view.jsp 提供供显示的数据。将会将所有查询到的数据放置到 `HashMap <Interget, Asset> assetMap`内通过 `request.setAttribute`传递给前端。

参数 | 合法值 |备注
---|---|--- 
searchName | *String* | 所筛选图片名字
searchCountry | *String* | 所筛选国家
searchScale | *String* | 所筛选比例尺

如果缺失任意一个参数，表示用户没有设置筛选器，将默认获取所有信息。

完成搜索后将所搜索到的所有数据放入 assetMap 内，通过 request.setAttribute 传递数据，跳转至 view.jsp。