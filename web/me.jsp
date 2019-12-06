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
    <title>浏览图片 - PicManager</title>
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


<div class="mdui-drawer mdui-color-white" id="drawer-main">
    <ul class="mdui-list">
        <a href="view.jsp" class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-blue">image</i>
            <div class="mdui-list-item-content">浏览</div>
        </a>
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-deep-orange">settings</i>
            <div class="mdui-list-item-content">管理</div>
        </li>
        <a href="me.jsp" class="mdui-list-item mdui-ripple mdui-list-item-active">
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
            <div class="mdui-typo-display-3 mdui-m-t-5 mdui-m-b-2"><% out.print("你好，" + session.getAttribute("logined_username") + " ！"); %></div>
            <div class="mdui-typo-subheading-opacity mdui-m-b-2">这是你的UID：<% out.print(session.getAttribute("logined_uid")); %></div>
        </div>
    </div>
    </div>


</body>
</html>
