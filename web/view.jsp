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
    	request.getRequestDispatcher("index.jsp").forward(request,response);
    }
    else{
    	if(session.getAttribute("to_notify_success") != null){
%>
<script type="text/javascript">var initMessage = "登录成功。";</script>
<%
            session.removeAttribute("to_notify_success");
        }
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
            <li class="mdui-menu-item" ><a class="mdui-ripple" href="/logout">登出</a></li>
        </ul>

    </div>
</header>


<div class="mdui-drawer mdui-color-white" id="drawer-main">
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple mdui-list-item-active">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-blue">image</i>
            <div class="mdui-list-item-content">浏览</div>
        </li>
        <li class="mdui-list-item mdui-ripple">
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
            <div class="mdui-typo-display-3 mdui-m-t-5 mdui-m-b-2">Explore</div>
            <div class="mdui-typo-subheading-opacity mdui-m-b-2">选择要浏览的图片。</div>
        </div>
    </div>
    <div class="mdui-row mdui-m-b-3">
        <div class="mdui-panel" mdui-panel>
            <div class="mdui-panel-item">
                <div class="mdui-panel-item-header">
                    <div class="mdui-panel-item-title">过滤器</div>
                    <div class="mdui-panel-item-summary">当前未设置过滤器</div>
                    <i class="mdui-panel-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                </div>
                <div class="mdui-panel-item-body">
                    <div class="mdui-container-fluid">
                        <div class="mdui-col-sm-4">
                                国家：
                            <select class="mdui-select" >
                                <option value="1">State 1</option>
                                <option value="2">State 2</option>
                                <option value="3" disabled>State 3</option>
                                <option value="4">State 4</option>
                                <option value="5">State 5</option>
                                <option value="6">State 6</option>
                            </select>

                        </div>
                        <div class="mdui-col-sm-4">a</div>
                        <div class="mdui-col-sm-4">a</div>
                        <div class="mdui-col-sm-4">a</div>
                        <div class="mdui-col-sm-4">a</div>
                    </div>
                    <div class="mdui-panel-item-actions">
                        <button class="mdui-btn mdui-ripple" mdui-panel-item-close>cancel</button>
                        <button class="mdui-btn mdui-ripple">save</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="mdui-row">
        <div class="mdui-col-sm-8">
            <div class="mdui-tab" mdui-tab>
                <a href="#type-a" class="mdui-ripple">类别一</a>
                <a href="#type-b" class="mdui-ripple">类别二</a>
                <a href="#type-c" class="mdui-ripple">类别三</a>
            </div>
            <div id="type-a" class="mdui-p-a-2 mdui-container-fluid">
                <div class="mdui-row-xs-2 mdui-row-sm-2 mdui-row-md-3 mdui-row-lg-4 mdui-row-xl-4 mdui-grid-list">


                    <div class="mdui-col ">
                        <div class="mdui-grid-tile">
                            <img class="mdui-img-rounded" src="assets/example.png"/>
                            <div class="mdui-grid-tile-actions">
                                <div class="mdui-grid-tile-text">
                                    <div class="mdui-grid-tile-title">一张风景图片</div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="mdui-col">
                        <div class="mdui-grid-tile">
                            <img src="assets/example.png"/>
                            <div class="mdui-grid-tile-actions">
                                <div class="mdui-grid-tile-text">
                                    <div class="mdui-grid-tile-title">一张风景图片</div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="mdui-col">
                        <div class="mdui-grid-tile">
                            <img src="assets/example.png"/>
                            <div class="mdui-grid-tile-actions">
                                <div class="mdui-grid-tile-text">
                                    <div class="mdui-grid-tile-title">一张风景图片</div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="mdui-col">
                        <div class="mdui-grid-tile">
                            <img src="assets/example.png"/>
                            <div class="mdui-grid-tile-actions">
                                <div class="mdui-grid-tile-text">
                                    <div class="mdui-grid-tile-title">一张风景图片</div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="mdui-col">
                        <div class="mdui-grid-tile">
                            <img src="assets/example.png"/>
                            <div class="mdui-grid-tile-actions">
                                <div class="mdui-grid-tile-text">
                                    <div class="mdui-grid-tile-title">一张风景图片</div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="mdui-col">
                        <div class="mdui-grid-tile">
                            <img src="assets/example.png"/>
                            <div class="mdui-grid-tile-actions">
                                <div class="mdui-grid-tile-text">
                                    <div class="mdui-grid-tile-title">一张风景图片</div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="mdui-col">
                        <div class="mdui-grid-tile">
                            <img src="assets/example.png"/>
                            <div class="mdui-grid-tile-actions">
                                <div class="mdui-grid-tile-text">
                                    <div class="mdui-grid-tile-title">一张风景图片</div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="mdui-col">
                        <div class="mdui-grid-tile">
                            <img src="assets/example.png"/>
                            <div class="mdui-grid-tile-actions">
                                <div class="mdui-grid-tile-text">
                                    <div class="mdui-grid-tile-title">一张风景图片</div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="mdui-col">
                        <div class="mdui-grid-tile">
                            <img src="assets/example.png"/>
                            <div class="mdui-grid-tile-actions">
                                <div class="mdui-grid-tile-text">
                                    <div class="mdui-grid-tile-title">一张风景图片</div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="mdui-col">
                        <div class="mdui-grid-tile">
                            <img src="assets/example.png"/>
                            <div class="mdui-grid-tile-actions">
                                <div class="mdui-grid-tile-text">
                                    <div class="mdui-grid-tile-title">一张风景图片</div>

                                </div>

                            </div>
                        </div>
                    </div>


                </div>
                <div id="type-b" class="mdui-p-a-2">类别二</div>
                <div id="type-c" class="mdui-p-a-2">类别三</div>
            </div>
        </div>


        <div class="mdui-col-sm-4 mdui-p-t-3 mdui-m-b-5">
            <div class="mdui-table-fluid mdui-m-t-5 mdui-m-b-5">
                <div class="mdui-card">

                    <!-- 卡片的媒体内容，可以包含图片、视频等媒体内容，以及标题、副标题 -->
                    <div class="mdui-card-media">
                        <img src="/assets/example.png"/>

                    </div>

                    <!-- 卡片的标题和副标题 -->
                    <div class="mdui-card-primary">
                        <div class="mdui-card-primary-title">一张风景图片</div>
                        <div class="mdui-card-primary-subtitle">中国</div>
                    </div>


                    <!-- 卡片的按钮 -->
                    <div class="mdui-card-actions mdui-row-xs-3">
                        <div class="mdui-col">
                            <button class="mdui-btn mdui-ripple mdui-color-theme mdui-btn-block">
                                <i class="mdui-icon material-icons mdui-icon-left">pageview</i>放大
                            </button>
                        </div>
                        <div class="mdui-col">
                            <button class="mdui-btn mdui-ripple mdui-color-theme mdui-btn-block">
                                <i class="mdui-icon material-icons mdui-icon-left">edit</i>编辑
                            </button>
                        </div>
                        <div class="mdui-col">
                            <button class="mdui-btn mdui-ripple mdui-color-theme mdui-btn-block">
                                <i class="mdui-icon material-icons mdui-icon-left">cloud_download</i>下载
                            </button>
                        </div>
                    </div>
                </div>
                <table class="mdui-table">
                    <thead>
                    <tr >
                        <th>参数</th>
                        <th>值</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="mdui-typo-body-1">
                        <td>名称</td>
                        <td>一张风景</td>
                    </tr>
                    <tr>
                        <td>创建日期</td>
                        <td>2019.12.7 05:20:00</td>
                    </tr>
                    <tr>
                        <td>创建日期</td>
                        <td>2019.12.7 05:20:00</td>
                    </tr>
                    <tr>
                        <td>创建日期</td>
                        <td>2019.12.7 05:20:00</td>
                    </tr>
                    <tr>
                        <td>创建日期</td>
                        <td>2019.12.7 05:20:00</td>
                    </tr>
                    <tr>
                        <td>创建日期</td>
                        <td>2019.12.7 05:20:00</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


</body>

<script type="text/javascript">
    $(document).ready(function () {
        if (initMessage != "") {
            mdui.snackbar(initMessage);
            initMessage = "";
        }
    })
</script>
</html>
