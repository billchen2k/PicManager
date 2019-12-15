<%@ page import="utils.DatabaseManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="bean.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="utils.Utils" %>
<%--
  Created by IntelliJ IDEA.
  User: billchen
  Date: 2019-12-03
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>用户管理 - PicManager</title>
    <link rel="stylesheet" href="css/mdui.min.css">
    <link rel="stylesheet" href="css/pm-style.css">
    <script src="js/mdui.min.js" type="text/javascript"></script>
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <meta charset="UTF-8" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
</head>
<%
    if (session.getAttribute("logined_user_role").equals("user")) {
        session.setAttribute("to_notify_no_privilege", "1");
        response.sendRedirect("/view");
        return;
    }
    System.out.println(session.getId() + session.getAttribute("logined_uid"));
    if (session.getAttribute("logined_uid") == null) {
        request.setAttribute("stat", "not_logined");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    if(session.getAttribute("update_user_stat") != null) {
        String attrUpdateStat = (String) session.getAttribute("update_user_stat");
        if (attrUpdateStat.equals("success")) {
%>
<script>var initMessage = "更新成功"</script>
<%
} else if (attrUpdateStat.equals("fail")) {
%>
<script>var initMessage = "更新失败"</script>
<%
} else {
%>
<script>var initMessage = "<%=attrUpdateStat%>"</script>
<%

        }

    }
%>
<body class="mdui-theme-primary-teal mdui-theme-accent-pink mdui-drawer-body-left mdui-appbar-with-toolbar">

<%--<%@include file="about.jsp"%>--%>
<header class="mdui-appbar mdui-appbar-fixed">
    <div class="mdui-toolbar mdui-color-theme">
        <a href="javascript:;" mdui-drawer="{target: '#drawer-main', swipe: true}" class="mdui-btn mdui-btn-icon"><i
                class="mdui-icon material-icons">menu</i></a>
        <span class="mdui-typo-title">PicManager</span>
        <div class="mdui-toolbar-spacer"></div>
        <a href="javascript:location.reload();" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '刷新'}"><i
                class="mdui-icon material-icons">refresh</i></a>
        <a mdui-menu="{target: '#menu-toolbar'}" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '更多'}"><i
                class="mdui-icon material-icons">more_vert</i></a>

        <ul class="mdui-menu" id="menu-toolbar">
            <li class="mdui-menu-item"><a class="mdui-ripple" href="/log.jsp">查看日志</a></li>
            <li class="mdui-menu-item"><a class="mdui-ripple" href="/logout">登出</a></li>
        </ul>

    </div>
</header>

<%
    DatabaseManager db = new DatabaseManager();
    db.getConnection();
//    Boolean ifLogin = request.getAttribute("ifLogin") == null ? true : false;
//    Boolean ifDownload = request.getAttribute("ifDownload") == null ? true : false;
//    Boolean ifUpload = request.getAttribute("ifUpload") == null ? true : false;
//    Boolean ifModify = request.getAttribute("ifModify") == null ? true : false;
//    Boolean ifDelete = request.getAttribute("ifDelete") == null ? true : false;
//    int startPos = request.getAttribute("startPos") == null ? 0 : Integer.parseInt(request.getAttribute("startPos").toString());
//    int endPos = request.getAttribute("endPos") == null ? 200 : Integer.parseInt(request.getAttribute("endPos").toString());
    ResultSet rs;
    rs = db.executeQuery("SELECT COUNT(logid) FROM `picmanager`.`log`;");
    rs.next();
    int logCount = rs.getInt("COUNT(logid)");
    String sqlQ = "SELECT * FROM `picmanager`.`user` ORDER BY uid;";
    Map<Integer, User> userMap = new HashMap<Integer, User>();
    try{
        rs = db.executeQuery(sqlQ);
        while (rs.next()) {
            userMap.put(Integer.parseInt(rs.getString("uid")), Utils.parseUser(rs));
        }
    }
    catch (Exception e){
        %><script>alert("数据库错误：<%=e.getStackTrace()%>")</script><%
    }

%>

<div class="mdui-drawer mdui-color-white" id="drawer-main">
    <ul class="mdui-list">
        <a href="view" class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-blue">image</i>
            <div class="mdui-list-item-content">浏览</div>
        </a>
        <li class="mdui-list-item mdui-ripple mdui-list-item-active">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-deep-orange">settings</i>
            <div class="mdui-list-item-content">管理</div>
        </li>
        <a href="me.jsp" class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-green">account_circle</i>
            <div class="mdui-list-item-content">我的</div>
        </a>
        <li class="mdui-subheader">关于</li>
        <li mdui-dialog="{target: '#dialog-about'}" class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-purple">info</i>
            <div class="mdui-list-item-content">关于</div>
        </li>

    </ul>
</div>

<div class="mdui-container">

    <div class="mdui-row">
        <div class="mdui-col-sm-8">
            <div class="mdui-typo-display-3 mdui-m-t-5 mdui-m-b-2">Manage User</div>
            <div class="mdui-typo-subheading-opacity mdui-m-b-2">你可以在这里管理用户。</div>
        </div>

        <div class="mdui-col-sm-4">
            <div class="mdui-row mdui-m-t-5 mdui-p-t-2">

                <div class="mdui-row mdui-m-b-2">
                    <button onclick="window.location.href='/log.jsp'"
                            class="mdui-btn mdui-ripple mdui-color-theme mdui-btn-block">
                        <i class="mdui-icon material-icons mdui-icon-left">history</i>查看日志
                    </button>
                </div>

                <div class="mdui-row mdui-m-b-2">
                    <button onclick="window.location.href='/manage'"
                            class="mdui-btn mdui-ripple mdui-color-theme mdui-btn-block">
                        <i class="mdui-icon material-icons mdui-icon-left">image</i>图片管理
                    </button>
                </div>

            </div>

        </div>
    </div>


    <div class="mdui-row mdui-m-t-2 mdui-m-b-5">
        <div class="mdui-table-fluid">
            <table class="mdui-table mdui-table-hoverable">
                <thead>
                <tr>
                    <th>UID</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>角色</th>
                    <th>上次修改密码日期</th>
                    <th>注册时间</th>
                    <th>注册 IP</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <% for(Integer one: userMap.keySet()) {
                    out.println("<tr>");
                    %>
                        <td><%=userMap.get(one).getUid()%></td>
                        <td><%=userMap.get(one).getUsername()%>
                            <button mdui-dialog="{target : '#dialog-changeusername-<%=one%>'}" mdui-tooltip="{content: '编辑用户名'}"
                                    class="mdui-float-right mdui-btn mdui-btn-icon mdui-btn-dense mdui-color-theme mdui-ripple"><i
                                    class="mdui-icon material-icons">edit</i>
                            </button>
                        </td>
                        <td><button mdui-dialog="{target: '#dialog-changepassword-<%=one%>'}"class="mdui-btn mdui-color-theme mdui-ripple">修改密码</button></td>
                        <td><%=userMap.get(one).getRole()%>
                            <button mdui-menu="{target: '#menu-role-<%=one%>'}" mdui-tooltip="{content: '编辑角色'}"
                                    class="mdui-float-right mdui-btn mdui-btn-icon mdui-btn-dense mdui-color-theme mdui-ripple"><i
                                    class="mdui-icon material-icons">edit</i>
                            </button>
                            <ul class="mdui-menu" id="menu-role-<%=one%>">
                                <li class="mdui-menu-item"><a class="mdui-ripple" href="/updateUser?uid=<%=one%>&type=setRole&newRole=user">普通用户 (user)</a></li>
                                <li class="mdui-menu-item"><a class="mdui-ripple" href="/updateUser?uid=<%=one%>&type=setRole&newRole=admin">管理员 (admin)</a></li>
                                <% if (session.getAttribute("logined_user_role").equals("root")) { %>
                                    <li class="mdui-menu-item"><a class="mdui-ripple" href="/updateUser?uid=<%=one%>&type=setRole&newRole=root">超级管理员 (root)</a></li>
                                <%}%>
                            </ul>
                        </td>
                        <td><%=userMap.get(one).getPassword_last_changed() == null ? "从未修改" : userMap.get(one).getPassword_last_changed()%></td>
                        <td><%=userMap.get(one).getRegistration_date()%></td>
                        <td><%=userMap.get(one).getRegistration_ip()%></td>
                        <td>
                            <% if (userMap.get(one).getRole().equals("root")) {
                            	if (session.getAttribute("logined_user_role").equals("root")){
                                    %>
                                    <button mdui-tooltip="{content: '删除'}"
                                            class="mdui-btn mdui-btn-icon mdui-btn-dense mdui-color-theme mdui-ripple"
                                            onclick="deleteUser(<%=userMap.get(one).getUid()%>, '<%=userMap.get(one).getUsername()%>')">
                                        <i class="mdui-icon material-icons">delete</i></button>
                                    <%
                                }
                            }
                            else{
                                    %>
                                    <button mdui-tooltip="{content: '删除'}"
                                            class="mdui-btn mdui-btn-icon mdui-btn-dense mdui-color-theme mdui-ripple"
                                            onclick="deleteUser(<%=userMap.get(one).getUid()%>, '<%=userMap.get(one).getUsername()%>')">
                                        <i class="mdui-icon material-icons">delete</i></button>
                                    <%
                                }
                            %>

                        </td>


                        <div class="mdui-dialog" style="max-width: 400px" id="dialog-changeusername-<%=one%>">
                            <form method="post" action="/updateuser">
                                <div class="mdui-dialog-content">
                                    请为 <%=userMap.get(one).getUsername()%> 输入新用户名：
                                    <div class="mdui-textfield">
                                        <input name="newUsername" class="mdui-textfield-input" required="" maxlength="24"/>
                                    </div>
                                    <input name="type" class="mdui-hidden" value="setUsername"/>
                                    <input name="uid" class="mdui-hidden" value="<%=one%>"/>
                                    <div class="mdui-row mdui-m-t-2">

                                        <button class="mdui-btn mdui-ripple mdui-float-right mdui-text-color-theme-accent mdui-btn-bold"
                                                type="submit">更新
                                        </button>
                                        <button class="mdui-btn mdui-ripple mdui-float-right mdui-text-color-theme-accent"
                                                mdui-dialog-close>取消
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="mdui-dialog" style="max-width: 400px" id="dialog-changepassword-<%=one%>">
                            <form method="post" action="/updateuser">
                                <div class="mdui-dialog-content">
                                    请为 <%=userMap.get(one).getUsername()%> 输入新密码：
                                    <div class="mdui-textfield">
                                        <input name="newPassword" class="mdui-textfield-input" placeholder="密码将明文显示" required="" maxlength="24"/>
                                    </div>
                                    <input name="type" class="mdui-hidden" value=setPassword"/>
                                    <input name="uid" class="mdui-hidden" value="<%=one%>"/>
                                    <div class="mdui-row mdui-m-t-2">

                                        <button class="mdui-btn mdui-ripple mdui-float-right mdui-text-color-theme-accent mdui-btn-bold" type="submit">更新</button>
                                        <button class="mdui-btn mdui-ripple mdui-float-right mdui-text-color-theme-accent" mdui-dialog-close>取消
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    <%
                    out.println("<tr>");
                }%>
                </tbody>
            </table>
        </div>
    </div>

    <div class="mdui-dialog" style="height: 600px; width: 400px;" id="dialog-register">
        <div class="mdui-col-xs-12 mdui-color-green mdui-row-gapless">
            <button class="mdui-btn mdui-btn-icon mdui-text-color-white close">
                <i class="mdui-icon material-icons">close</i>
            </button>
        </div>
        <div class="mdui-dialog-title mdui-color-green dialog-login">
            <div style="margin-top: 100px; color:white">新建用户</div>
            <div class="mdui-text-color-white mdui-typo-body-2">新建的用户默认权限为 user。</div>
        </div>
        <div class="mdui-dialog-content">
            <form method="post" name="register" action="/register">
                <div class="mdui-textfield mdui-textfield-floating-label">
                    <label class="mdui-textfield-label">用户名</label>
                    <input class="mdui-textfield-input" name="name" maxlength="24" type="text" required="">
                    <div class="mdui-textfield-error">用户名不能为空</div>
                </div>

                <div class="mdui-textfield mdui-textfield-floating-label" type="email" required="">
                    <label class="mdui-textfield-label">邮箱</label>
                    <input class="mdui-textfield-input" name="email" type="text">
                    <div class="mdui-textfield-error">邮箱格式错误</div>

                </div>
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">密码</label>
                    <input id="text-reg-password" class="mdui-textfield-input" name="password" type="password"
                           required="">
                </div>

                <!-- 传递创建参数 -->
                <input class="mdui-hidden" value="1" name="isFromManage" />

                <div id="wrapper-repeatpassword" class="mdui-textfield mdui-textfield-floating-label">
                    <label class="mdui-textfield-label">再次输入密码</label>
                    <input id="text-reg-repeatpassword" class="mdui-textfield-input" name="password" type="password">
                    <div class="mdui-textfield-error">密码不匹配</div>
                </div>

                <div class="mdui-dialog-actions mdui-clearfix">
                    <button type="submit"
                            class="mdui-btn mdui-btn-raised mdui-color-green mdui-text-color-white mdui-float-right">添加
                    </button>
                </div>
            </form>
        </div>
    </div>


    <button mdui-tooltip="{content : '新建用户'}" mdui-dialog="{target: '#dialog-register'}"
            class="mdui-color-theme-accent mdui-fab mdui-fab-fixed mdui-ripple"><i
            class="mdui-icon material-icons">add</i></button>

</div>
<%@include file="about.jsp" %>
</body>

<script type="text/javascript">
    $(document).ready(function () {
        if (initMessage != "") {
            mdui.snackbar(initMessage);
            initMessage = "";
            <% session.removeAttribute("update_user_stat"); %>
        }
    })

    function deleteUser(uid, username){
        var msg = confirm("确认删除用户 " + username + "？该操作不可撤销。");
        if (msg == true){
            window.location.href="/updateuser?type=delete&uid=" + uid;
        }
    }

    $("#text-reg-repeatpassword").bind("input propertychange", function () {
        if ($("#text-reg-password").val() != $("#text-reg-repeatpassword").val()) {
            $("#wrapper-repeatpassword").addClass("mdui-textfield-invalid");
            console.log("INVALID");
        } else {
            $("#wrapper-repeatpassword").removeClass("mdui-textfield-invalid");
            console.log("VALID");
        }
    })

</script>
</html>
