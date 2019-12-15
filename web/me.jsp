<%@ page import="utils.DatabaseManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="bean.User" %>
<%@ page import="utils.Utils" %><%--
  Created by IntelliJ IDEA.
  User: billchen
  Date: 2019-12-03
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的 - PicManager</title>
    <link rel="stylesheet" href="css/mdui.min.css">
    <link rel="stylesheet" href="css/pm-style.css">
    <script src="js/mdui.js" type="text/javascript"></script>
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <meta charset="UTF-8" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
</head>
<%
    System.out.println(session.getId() + session.getAttribute("logined_uid"));
    if (session.getAttribute("logined_uid") == null) {
        request.setAttribute("stat", "not_logined");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    DatabaseManager db = new DatabaseManager();
    db.getConnection();
    ResultSet rs = db.executeQuery("SELECT * FROM `user` WHERE `user`.`uid`=" + session.getAttribute("logined_uid") + ";");
    rs.next();
    User userInfo = Utils.parseUser(rs);
%>
<body class="mdui-theme-primary-teal mdui-theme-accent-pink mdui-drawer-body-left mdui-appbar-with-toolbar">


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
            <li class="mdui-menu-item"><a class="mdui-ripple" href="log.jsp">查看日志</a></li>
            <li class="mdui-menu-item"><a class="mdui-ripple" href="/logout">登出</a></li>
        </ul>

    </div>
</header>

<%
    String attrStat = (String) request.getAttribute("stat");
    if (attrStat != null) {
        switch (attrStat) {
            case "wrong_old_password":
%>
<script type="text/javascript">var initMessage = "原密码输入错误，请重试。";</script>
<%
        break;
        case "change_success":
%>
<script type="text/javascript">var initMessage = "修改成功。";</script>
<%
            break;
    }
    request.removeAttribute("stat");
} else {
%>
<script type="text/javascript">
    var initMessage = "";
</script>
<%
    }
%>

<div class="mdui-drawer mdui-color-white" id="drawer-main">
    <ul class="mdui-list">
        <a href="view" class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-blue">image</i>
            <div class="mdui-list-item-content">浏览</div>
        </a>
        <% if (!session.getAttribute("logined_user_role").equals("user")) {
        %>
        <a href="manage" class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-deep-orange">settings</i>
            <div class="mdui-list-item-content">管理</div>
        </a>
        <%
            }%>

        <a href="me.jsp" class="mdui-list-item mdui-ripple mdui-list-item-active">
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
    <div id="wrapper">
        <canvas id="canvas" width="2500px" height="1280px"></canvas>
        <canvas id="canvasbg" width="2500px" height="1280px"></canvas>
    </div>

    <div class="mdui-row">
        <div class="mdui-col-xs-12">
            <div class="mdui-typo-display-3 mdui-m-t-5 mdui-m-b-2"><% out.print("你好，" + session.getAttribute("logined_username") + " ！"); %></div>
            <div class="mdui-typo-subheading-opacity mdui-m-b-2">这是你的UID：<% out.print(session.getAttribute("logined_uid")); %>。</div>
            <div class="mdui-typo-subheading-opacity mdui-m-b-2">
                您注册于 <b><%=userInfo.getRegistration_date()%></b>，具有的权限是 <b><%=userInfo.getRole()%></b>。
            </div>
        </div>
    </div>

    <div class="mdui-row">
        <div class="mdui-col-xs-12">
            <button mdui-dialog="{target: '#dialog-changepwd'}"
                    class="mdui-btn mdui-btn-raised mdui-color-theme-accent mdui-ripple">
                修改密码
            </button>
            <button onclick="window.location.href='/logout'"
                    class="mdui-btn mdui-btn-raised mdui-color-theme-accent  mdui-m-l-1 mdui-ripple">
                登出
            </button>
        </div>
    </div>

</div>

<div class="mdui-dialog" style="height: 600px; width: 400px;" id="dialog-changepwd">
    <div class="mdui-col-xs-12 mdui-color-deep-orange mdui-row-gapless">
        <button class="mdui-btn mdui-btn-icon mdui-text-color-white close" mdui-dialog-close>
            <i class="mdui-icon material-icons">close</i>
        </button>
    </div>
    <div class="mdui-dialog-title mdui-color-deep-orange dialog-login">
        <div style="margin-top: 100px; color:white">修改密码</div>
    </div>
    <div class="mdui-dialog-content dialog-changepwd">
        <form method="post" action="/changepassword">
            <div class="mdui-textfield mdui-textfield-floating-label">
                <label class="mdui-textfield-label">原密码</label>
                <input name="old_password" id="text-originpwd" class="mdui-textfield-input" name="password" type="password"
                       required="">
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label">
                <label class="mdui-textfield-label">新密码</label>
                <input name="new_password" id="text-newpassword" class="mdui-textfield-input" name="password" type="password"
                       pattern="^.*(?=.{6,})(?=.*[a-z])(?=.*[A-Z]).*$"
                       required="">
                <div class="mdui-textfield-error">密码至少 6 位，且至少包含大小写字母</div>
            </div>

            <div id="wrapper-repeatpassword" class="mdui-textfield mdui-textfield-floating-label">
                <label class="mdui-textfield-label">再次输入新密码</label>
                <input id="text-repeatpassword" class="mdui-textfield-input" name="password" type="password">
                <div class="mdui-textfield-error">两次输入的新密码不匹配</div>
            </div>
            <div class="actions mdui-clearfix">
                <button type="submit"
                        class="mdui-btn mdui-btn-raised mdui-color-deep-orange mdui-text-color-white mdui-float-right">修改密码
                </button>
            </div>
        </form>

    </div>
</div>

<%@include file="about.jsp"%>

</body>
<script src="js/canvas.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        if (initMessage != "") {
            mdui.snackbar(initMessage);
            if(initMessage=="原密码输入错误，请重试。"){
                new mdui.Dialog("#dialog-changepwd").open();
            }

        }
    })

    $("#text-reg-repeatpassword").bind("input propertychange", function () {

        if ($("#text-newpassword").val() != $("#text-repeatpassword").val()) {
            $("#wrapper-repeatpassword").addClass("mdui-textfield-invalid");
            console.log("INVALID");
        } else {
            $("#wrapper-repeatpassword").removeClass("mdui-textfield-invalid");
            console.log("VALID");
        }
    })

</script>
</html>
