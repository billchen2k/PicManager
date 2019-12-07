<%@ page import="bean.Asset" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="utils.DatabaseManager" %>
<%@ page import="java.sql.ResultSet" %>
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
    <title>查看日志 - PicManager</title>
    <link rel="stylesheet" href="css/mdui.min.css">
    <link rel="stylesheet" href="css/pm-style.css">
    <script src="js/mdui.min.js" type="text/javascript"></script>
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <meta charset="UTF-8" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
</head>
<%
    System.out.println(session.getId() + session.getAttribute("logined_uid"));
    if (session.getAttribute("logined_uid") == null) {
        request.setAttribute("stat", "not_logined");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<body class="mdui-theme-primary-teal mdui-theme-accent-pink mdui-drawer-body-left mdui-appbar-with-toolbar">

<%--<%@include file="header.jsp"%>--%>
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
            <li class="mdui-menu-item"><a class="mdui-ripple">查看日志</a></li>
            <li class="mdui-menu-item"><a class="mdui-ripple" href="/logout">登出</a></li>
        </ul>

    </div>
</header>

<%
    final int LIMIT = 1000;
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
    int logCount = rs.getInt ("COUNT(logid)");
    String sqlQ = "SELECT * FROM `picmanager`.`log` ORDER BY logid DESC LIMIT 0," + LIMIT + ";";
    rs = db.executeQuery(sqlQ);
%>

<div class="mdui-drawer mdui-color-white" id="drawer-main">
    <ul class="mdui-list">
        <a href="view.jsp" class="mdui-list-item mdui-ripple">
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
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-purple">info</i>
            <div class="mdui-list-item-content">关于</div>
        </li>

    </ul>
</div>

<div class="mdui-container">

    <div class="mdui-row">
        <div class="mdui-col-xs-12">
            <div class="mdui-typo-display-3 mdui-m-t-5 mdui-m-b-2">Log</div>
            <div class="mdui-typo-subheading-opacity mdui-m-b-2">在这里查看日志。将会显示最近 1000 条日志。</div>
        </div>
    </div>

<%--    <div class="mdui-row">--%>
<%--        <div class="mdui-col-sm-2">--%>
<%--            <label class="mdui-checkbox">--%>
<%--                <input id="check-login" type="checkbox" <%if (ifLogin) out.print("checked"); %> />--%>
<%--                <i class="mdui-checkbox-icon"></i>--%>
<%--                登录日志--%>
<%--            </label>--%>
<%--        </div>--%>
<%--        <div class="mdui-col-sm-2">--%>
<%--            <label class="mdui-checkbox">--%>
<%--                <input id="check-download" type="checkbox" <%if (ifDownload) out.print("checked"); %>/>--%>
<%--                <i class="mdui-checkbox-icon"></i>--%>
<%--                下载日志--%>
<%--            </label>--%>
<%--        </div>--%>
<%--        <div class="mdui-col-sm-2">--%>
<%--            <label class="mdui-checkbox ">--%>
<%--                <input id="check-upload" type="checkbox" <%if (ifUpload) out.print("checked"); %>/>--%>
<%--                <i class="mdui-checkbox-icon"></i>--%>
<%--                上传日志--%>
<%--            </label>--%>
<%--        </div>--%>
<%--        <div class="mdui-col-sm-2">--%>
<%--            <label class="mdui-checkbox ">--%>
<%--                <input id="check-modify" type="checkbox" <%if (ifModify) out.print("checked"); %>/>--%>
<%--                <i class="mdui-checkbox-icon"></i>--%>
<%--                修改日志--%>
<%--            </label>--%>
<%--        </div>--%>
<%--        <div class="mdui-col-sm-2">--%>
<%--            <label class="mdui-checkbox">--%>
<%--                <input id="check-delete" type="checkbox" <%if (ifDelete) out.print("checked"); %>/>--%>
<%--                <i class="mdui-checkbox-icon"></i>--%>
<%--                删除日志--%>
<%--            </label>--%>
<%--        </div>--%>
<%--        <div class="mdui-col-sm-2">--%>
<%--            <button onclick="search()" class="mdui-btn mdui-btn-raised mdui-color-theme-accent mdui-btn-block mdui-ripple">--%>
<%--                确定--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="mdui-row mdui-m-t-2">
        <div class="mdui-table-fluid">
            <table class="mdui-table mdui-table-hoverable">
                <thead>
                <tr>
                    <th>日志 ID</th>
                    <th>用户</th>
                    <th>资源</th>
                    <th>操作类型</th>
                    <th>日期</th>
                    <th>来源 IP</th>
                    <th>备注</th>
                </tr>
                </thead>
                <tbody>
                <% while (rs.next()) {
                    String typeName;
                    switch (rs.getString("type")) {
                        case "login":
                            typeName = "登录";
                            break;
                        case "download":
                            typeName = "下载";
                            break;
                        case "delete":
                            typeName = "删除";
                            break;
                        case "logout":
                            typeName = "登出";
                            break;
                        case "modify":
                            typeName = "修改";
                            break;
                        case "upload":
                            typeName = "上传";
                            break;
                        default:
                            typeName = rs.getString("type");
                    }
                    String notes = rs.getString("notes");
                    if (notes == null){
                    	notes = "";
                    }
                    out.println("<tr>");
                	out.println("<td>" + rs.getInt("logid") + "</td>");
                    out.println("<td>" + "" + rs.getString("username") + " (UID:" + rs.getString("uid") + ")" + "</td>");
                    out.println("<td>" + rs.getString("assetname") + "</td>");
                    out.println("<td>" + typeName + "</td>");
                    out.println("<td>" + rs.getString("date") + "</td>");
                    out.println("<td>" + rs.getString("request_ip") + "</td>");
                    out.println("<td>" + notes + "</td>");
                    out.println("<tr>");
                }%>
                </tbody>
            </table>
        </div>
    </div>



</div>

</body>

<script type="text/javascript">

</script>
</html>
