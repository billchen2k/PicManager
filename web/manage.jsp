<%@ page import="bean.Asset" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="utils.DatabaseManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Map" %>
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
    <title>管理 - PicManager</title>
    <link rel="stylesheet" href="css/mdui.min.css">
    <link rel="stylesheet" href="css/pm-style.css">
    <script src="js/mdui.min.js" type="text/javascript"></script>
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <meta charset="UTF-8" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
</head>
<%
    System.out.println(session.getId() + session.getAttribute("logined_uid"));
    if (session.getAttribute("logined_uid") == null) {
        request.setAttribute("stat", "not_logined");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    Map<Integer, Asset> assetMap = (Map<Integer, Asset>)request.getAttribute("assetMap");
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
            <li class="mdui-menu-item"><a class="mdui-ripple">查看日志</a></li>
            <li class="mdui-menu-item"><a class="mdui-ripple" href="/logout">登出</a></li>
        </ul>

    </div>
</header>

<%
    DatabaseManager db = new DatabaseManager();
    db.getConnection();
    ResultSet rs;
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
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-purple">info</i>
            <div class="mdui-list-item-content">关于</div>
        </li>

    </ul>
</div>

<div class="mdui-container">

    <div class="mdui-row">
        <div class="mdui-col-xs-8">
            <div class="mdui-typo-display-3 mdui-m-t-5 mdui-m-b-2">Manage</div>
            <div class="mdui-typo-subheading-opacity mdui-m-b-2">检索出了 <%= Integer.toString(assetMap.size()) %>
                张图片。你可以在下面编辑元数据，使用右下角的按钮上传图片。
            </div>
        </div>

        <button mdui-tooltip="{content : '上传新的'}"
                class="mdui-color-theme-accent mdui-fab mdui-fab-fixed mdui-ripple"><i
                class=" mdui-icon material-icons">add</i></button>


        <div class="mdui-col-sm-4">
            <div class="mdui-row mdui-m-t-5 mdui-p-t-2">

                <div class="mdui-row mdui-m-b-2">
                    <button onclick="window.location.href='/log.jsp'"
                            class="mdui-btn mdui-ripple mdui-color-theme mdui-btn-block">
                        <i class="mdui-icon material-icons mdui-icon-left">history</i>查看日志
                    </button>
                </div>

                <div class="mdui-row mdui-m-b-2">
                    <button onclick="window.location.href='/log.jsp'"
                            class="mdui-btn mdui-ripple mdui-color-theme mdui-btn-block">
                        <i class="mdui-icon material-icons mdui-icon-left">account_circle</i>用户管理
                    </button>
                </div>

            </div>

        </div>
    </div>

    <div class="mdui-row mdui-m-b-3">
        <div class="mdui-panel" mdui-panel>
            <div class="mdui-panel-item">
                <div class="mdui-panel-item-header">
                    <div class="mdui-panel-item-title">过滤器</div>
                    <div class="mdui-panel-item-summary"><%=request.getAttribute("filterNote")%>
                    </div>
                    <div class="mdui-panel-item-summary"></div>
                    <i class="mdui-panel-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                </div>
                <div class="mdui-panel-item-body">
                    <form method="post" action="/manage">
                        <div class="mdui-row">
                            <div class="mdui-col-sm-12">
                                <div class="mdui-textfield">
                                    <i class="mdui-icon material-icons">search</i>
                                    <input name="searchName" class="mdui-textfield-input" type="text"
                                           mdui-tooltip="{content: '全局查找（支持名称及元数据）'} " placeholder="全局查找（支持名称及元数据）"/>
                                </div>
                            </div>
                        </div>
                        <div class="mdui-row">
                            <div class="mdui-col-sm-6">
                                <div class="mdui-textfield">
                                    <i class="mdui-icon material-icons">date_range</i>
                                    <input class="mdui-textfield-input" mdui-tooltip="{content: '选择录入日期范围'} "
                                           name="daterange" type="text" value=""/>
                                    <script>
                                        $(function () {
                                            $('input[name="daterange"]').daterangepicker({
                                                "locale": {
                                                    "format": "YYYY/MM/DD",
                                                    "separator": " - ",
                                                    "applyLabel": "确定",
                                                    "cancelLabel": "取消",
                                                    "fromLabel": "From",
                                                    "toLabel": "To",
                                                    "customRangeLabel": "Custom",
                                                    "weekLabel": "W",
                                                    "daysOfWeek": [
                                                        "Su",
                                                        "Mo",
                                                        "Tu",
                                                        "We",
                                                        "Th",
                                                        "Fr",
                                                        "Sa"
                                                    ],
                                                    "monthNames": [
                                                        "January",
                                                        "February",
                                                        "March",
                                                        "April",
                                                        "May",
                                                        "June",
                                                        "July",
                                                        "August",
                                                        "September",
                                                        "October",
                                                        "November",
                                                        "December"
                                                    ],
                                                    "firstDay": 1
                                                },
                                                opens: 'right'
                                            }, function (start, end, label) {
                                                console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                                            });
                                        });
                                    </script>
                                </div>
                            </div>

                            <div class="mdui-col-sm-3">
                                <div class="mdui-textfield">
                                    <i class="mdui-icon material-icons">my_location</i>
                                    <input name="searchCountry" mdui-tooltip="{content: '按国家查找'} "
                                           class="mdui-textfield-input" type="text" placeholder="查找国家"/>
                                </div>
                            </div>

                            <div class="mdui-col-sm-3">
                                <div class="mdui-textfield">
                                    <span>比例尺： </span>
                                    <select name="searchScale" class="mdui-select" mdui-tooltip="{content: '选择比例尺'} ">
                                        <option value="all">全部</option>
                                        <option value="1:1">1:1</option>
                                        <option value="1:10">1:10</option>
                                        <option value="1:100">1:100</option>
                                        <option value="1:1000">1:1000</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="mdui-panel-item-actions">
                            <button class="mdui-btn mdui-ripple" onclick="window.location.href='/view'">重置
                            </button>
                            <%--<button class="mdui-btn mdui-ripple" mdui-panel-item-close>取消</button>--%>
                            <button class="mdui-btn mdui-ripple" type="submit">应用筛选器</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="mdui-row mdui-m-t-2 mdui-m-b-5">
        <div class="mdui-table-fluid mdui-table-hoverable mdui-col-sm-12">
            <table class="mdui-table">
                <thead>
                <tr>
                    <th>AID</th>
                    <th>预览</th>
                    <th>标题</th>
                    <th>分类</th>
                    <th>国家</th>
                    <th>地点</th>
                    <th>经度</th>
                    <th>纬度</th>
                    <th>比例尺</th>
                    <th>上传时间</th>
<%--                    <th>修改时间</th>--%>
                    <th>UID</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <img
                <%
                    for(Integer one: assetMap.keySet()){
                    	String categoryName = "";
                    	switch(assetMap.get(one).getCategory()){
                            case "photograph":
                            	categoryName = "实景摄影";
                            	break;
                            case "gis":
                            	categoryName = "遥感图像";
                            	break;
                            case "cloud":
                            	categoryName = "卫星云图";
                            	break;
                        }
                        out.println("<tr>");
                    	out.println("<td>"+ assetMap.get(one).getId() +"</td>");
                        out.println("<td><img style='max-height: 30px; max-width: 30px;' src='" + assetMap.get(one).getUrl() + "'></img></td>");
                        out.println("<td>" + assetMap.get(one).getName() + "</td>");
                        out.println("<td>" + categoryName + "</td>");
                        out.println("<td>" + assetMap.get(one).getCountry() + "</td>");
                        out.println("<td>" + assetMap.get(one).getLocation() + "</td>");
                        out.println("<td>" + assetMap.get(one).getLatitude() + "</td>");
                        out.println("<td>" + assetMap.get(one).getLongitude() + "</td>");
                        out.println("<td>" + assetMap.get(one).getScale() + "</td>");
                        out.println("<td>" + assetMap.get(one).getUpload_time() + "</td>");
//                      out.println("<td>" + assetMap.get(one).getLast_modified_date() + "</td>");
                        out.println("<td>" + assetMap.get(one).getUploader_uid() + "</td>");
                        %>
                        <td>
                            <button mdui-tooltip="{content: '编辑'}"class="mdui-btn mdui-btn-icon mdui-btn-dense mdui-color-theme mdui-ripple"><i
                                    class="mdui-icon material-icons" mdui-dialog="{target : '#dialog-edit-<%=one%>'}">edit</i></button>
                            <button mdui-tooltip="{content: '删除'}"
                                    class="mdui-btn mdui-btn-icon mdui-btn-dense mdui-color-theme mdui-ripple"><i
                                    class="mdui-icon material-icons" onclick="
                                    mdui.confirm('该操作不可撤销。', '确认删除 <%=assetMap.get(one).getName()%>？', function(){
                                              mdui.alert('确认删除。<%=assetMap.get(one).getId()%>');});">Delete</i></button>
                        </td>
                        <%
                        out.println("</tr>");
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <%
        for (Integer one : assetMap.keySet()){
        	%>
                <div class="mdui-dialog" style="height: 600px; max-width: 50%;" id="dialog-edit-<%=one%>">
                    <div class="mdui-col-xs-12 mdui-color-blue mdui-row-gapless">
                        <button class="mdui-btn mdui-btn-icon mdui-text-color-white close" mdui-dialog-close>
                            <i class="mdui-icon material-icons">close</i>
                        </button>
                    </div>
                    <div class="mdui-dialog-title mdui-color-blue dialog-login">
                        <div style="margin-top: 50px; color:white">以 <%=session.getAttribute("logined_username").toString()%> 的身份编辑</div>
                    </div>
                    <div class="mdui-container">
                        <form method="post" name="updateAsset" action="/updateasset">
                            <div class="mdui-container-fluid">
                                <div class="mdui-row">
                                    <div class="mdui-col-sm-4">
                                        <img width="100%" class="mdui-shadow-3 mdui-m-t-3 mdui-m-r-1" src="<%=assetMap.get(one).getUrl()%>">
                                    </div>
                                    <div class="mdui-col-sm-8">
                                        <div class="mdui-textfield">
                                            <label class="mdui-textfield-label">标题</label>
                                            <input required="" name="assetname" class="mdui-textfield-input" type="text" value="<%=assetMap.get(one).getName()%>"/>
                                        </div>

                                        <div class="mdui-row">
                                            <div class="mdui-col-xs-6">
                                                <div class="mdui-textfield">
                                                    <label class="mdui-textfield-label">国家</label>
                                                    <input name="newCountry" class="mdui-textfield-input" type="text" value="<%=assetMap.get(one).getCountry()%>"/>
                                                </div>
                                            </div>
                                            <div class="mdui-col-xs-6">
                                                <div class="mdui-textfield">
                                                    <label class="mdui-textfield-label">地区</label>
                                                    <input name="newLocation" class="mdui-textfield-input" type="text"
                                                           value="<%=assetMap.get(one).getLocation()%>"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mdui-row">
                                            <div class="mdui-col-xs-6">
                                                <div class="mdui-textfield">
                                                    <label class="mdui-textfield-label">经度</label>
                                                    <input name="newLatitude" class="mdui-textfield-input" type="text"
                                                           value="<%=assetMap.get(one).getLatitude()%>"/>
                                                </div>
                                            </div>
                                            <div class="mdui-col-xs-6">
                                                <div class="mdui-textfield">
                                                    <label class="mdui-textfield-label">纬度</label>
                                                    <input name="newLongitude" class="mdui-textfield-input" type="text"
                                                           value="<%=assetMap.get(one).getLongitude()%>"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mdui-row">
                                            <div class="mdui-col-xs-6">
                                                <div class="mdui-textfield">
                                                    <span>比例尺： </span>
                                                    <select name="searchScale" class="mdui-select">
                                                        <option value="1:1" <%
                                                            if(assetMap.get(one).getScale().equals("1:1"))
                                                            	out.print("selected=''");%> >1:1</option>
                                                        <option value="1:10" <%
                                                            if (assetMap.get(one).getScale().equals("1:10"))
                                                                out.print("selected=''");%> >1:10</option>
                                                        <option value="1:100" <%
                                                            if (assetMap.get(one).getScale().equals("1:100"))
                                                                out.print("selected=''");%>>1:100</option>
                                                        <option value="1:1000" <%
                                                            if (assetMap.get(one).getScale().equals("1:1000"))
                                                                out.print("selected=''");%>>1:1000</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="mdui-col-xs-6">
                                                <div class="mdui-textfield">
                                                    <span>类型： </span>
                                                    <select name="searchScale" class="mdui-select">
                                                        <option value="photograph" <%
                                                            if (assetMap.get(one).getCategory().equals("photograph"))
                                                                out.print("selected=''");%>>实景摄影</option>
                                                        <option value="gis" <%
                                                            if (assetMap.get(one).getCategory().equals("gis"))
                                                                out.print("selected=''");%>>遥感图像</option>
                                                        <option value="cloud"  <%
                                                            if (assetMap.get(one).getCategory().equals("cloud"))
                                                                out.print("selected=''");%>>卫星云图</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mdui-clearfix mdui-float-right mdui-m-t-3">
                                    <button class="mdui-btn mdui-ripple mdui-color-blue mdui-text-color-white" mdui-dialog-close>
                                        取消
                                    </button>
                                    <button class="mdui-btn mdui-ripple mdui-color-blue mdui-text-color-white mdui-m-l-2"
                                            type="submit">更新
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            <%
        }
    %>


</div>

</body>

<script type="text/javascript">

</script>
</html>
