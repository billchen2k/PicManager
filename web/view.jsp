<%@ page import="bean.Asset" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %><%--
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
            <li class="mdui-menu-item"><a class="mdui-ripple" href="log.jsp">查看日志</a></li>
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
                    <div class="mdui-panel-item-summary"></div>
                    <i class="mdui-panel-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                </div>
                <div class="mdui-panel-item-body">
                    <div class="mdui-row">
                        <div class="mdui-col-sm-12">
                            <div class="mdui-textfield">
                                <i class="mdui-icon material-icons">search</i>
                                <input class="mdui-textfield-input" type="text" mdui-tooltip="{content: '查找（支持名称及元数据）'} " placeholder="查找（支持名称及元数据）"/>
                            </div>
                        </div>
                    </div>
                    <div class="mdui-row">
                        <div class="mdui-col-sm-6">
                            <div class="mdui-textfield">
                                <i class="mdui-icon material-icons">date_range</i>
                                <input class="mdui-textfield-input" mdui-tooltip="{content: '选择录入日期范围'} "name="daterange" type="text" value=""/>
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

                        <div class="mdui-col-sm-2">
                            <div class="mdui-textfield">
                                <span>国家：</span>
                                <select class="mdui-select">
                                    <option value="1">State 1</option>
                                    <option value="2">State 2</option>
                                    <option value="3" disabled>State 3</option>
                                    <option value="4">State 4</option>
                                    <option value="5">State 5</option>
                                    <option value="6">State 6</option>
                                </select>
                            </div>
                        </div>

                        <div class="mdui-col-sm-2">
                            <div class="mdui-textfield">
                                <span>比例尺：</span>
                                <select class="mdui-select">
                                    <option value="1">State 1</option>
                                    <option value="2">State 2</option>
                                    <option value="3" disabled>State 3</option>
                                    <option value="4">State 4</option>
                                    <option value="5">State 5</option>
                                    <option value="6">State 6</option>
                                </select>
                            </div>
                        </div>

                        <div class="mdui-col-sm-2">
                            <div class="mdui-textfield">
                                <span>分辨率：</span>
                                <select class="mdui-select">
                                    <option value="1">State 1</option>
                                    <option value="2">State 2</option>
                                    <option value="3" disabled>State 3</option>
                                    <option value="4">State 4</option>
                                    <option value="5">State 5</option>
                                    <option value="6">State 6</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="mdui-panel-item-actions">
                        <button class="mdui-btn mdui-ripple" mdui-panel-item-close>重置</button>
                        <button class="mdui-btn mdui-ripple" mdui-panel-item-close>取消</button>
                        <button class="mdui-btn mdui-ripple">应用筛选器</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="mdui-row">
        <div class="mdui-col-sm-8">
            <div class="mdui-tab mdui-tab-full-width" mdui-tab>
                <a href="#type-a" class="mdui-ripple">实景摄影</a>
                <a href="#type-b" class="mdui-ripple">遥感图像</a>
                <a href="#type-c" class="mdui-ripple">卫星云图</a>
            </div>
            <div id="type-a" class="mdui-p-a-2 mdui-container-fluid">
                <div class="mdui-row-xs-2 mdui-row-sm-2 mdui-row-md-3 mdui-row-lg-4 mdui-row-xl-4 mdui-grid-list">
                <%
                    List<Asset> assetsList = new LinkedList<>();
                    String[] names = {
                            "GIS001.jpg",
                            "GIS002.jpg",
                            "GIS007.jpg",
                            "GIS009.jpg",
                            "GIS011.jpg",
                            "GIS025.jpg",
                            "Scene049.jpg",
                            "scene010.jpg",
                            "scene011.jpg",
                            "scene012.jpg",
                    };
                    for(int i = 0; i< names.length; i++){
                    	Asset one = new Asset();
                    	one.setUrl("assets/" + names[i]);
                        assetsList.add(one);
                    }
                    for(Asset one : assetsList){
                    	%>
                        <div class="mdui-col">
                            <div class="mdui-grid-tile">
                                <% out.print("<img style='width:100%; height: 150px; object-fit: cover' src='" + one.getUrl() + "' />"); %>
                                <div class="mdui-grid-tile-actions">
                                    <div class="mdui-grid-tile-text">
                                        <div class="mdui-grid-tile-title">一张风景图片</div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    <%
                    }
                %>

                    <div class="mdui-col">
                        <div class="mdui-grid-tile">
                            <img style="width:100%; height: 150px; object-fit: cover" src="assets/example.png"/>
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
                        <img style="overflow: hidden; background-size: contain;" src="/assets/example.png"/>

                    </div>
                    <!-- 卡片的标题和副标题 -->
                    <div class="mdui-card-primary">
                        <div class="mdui-card-primary-title">一张风景图片</div>
                        <div class="mdui-card-primary-subtitle">中国</div>
                    </div>


                    <!-- 卡片的按钮 -->
                    <div class="mdui-card-actions mdui-row-xs-3">
                        <div class="mdui-col">
                            <button mdui-dialog="{target: '#dialog-zoom'}"class="mdui-btn mdui-ripple mdui-color-theme mdui-btn-block">
                                <i class="mdui-icon material-icons mdui-icon-left">pageview</i>放大
                            </button>
                        </div>
                        <div class="mdui-col">
                            <button class="mdui-btn mdui-ripple mdui-color-theme mdui-btn-block">
                                <i class="mdui-icon material-icons mdui-icon-left">edit</i>编辑
                            </button>
                        </div>
                        <div class="mdui-col">
                            <button onclick="downloadFile('assets/example.png')" class="mdui-btn mdui-ripple mdui-color-theme mdui-btn-block">
                                <i class="mdui-icon material-icons mdui-icon-left">cloud_download</i>下载
                            </button>
                        </div>
                    </div>
                </div>
                <table class="mdui-table">

                    <div class="mdui-subheader">详细元数据</div>

                    <tbody>
                    <tr>
                        <td>国家</td>
                        <td>中国</td>
                    </tr>
                    <tr>
                        <td>位置</td>
                        <td>四川</td>
                    </tr>
                    <tr>
                        <td>经纬度</td>
                        <td>12, 12</td>
                    </tr>
                    <tr>
                        <td>比例尺</td>
                        <td>1:100</td>
                    </tr>
                    <tr>
                        <td>拍摄日期</td>
                        <td>2019.12.7 05:20:00</td>
                    </tr>
                    <tr>
                        <td>上传日期</td>
                        <td>2019.12.7 05:20:00</td>
                    </tr>
                    <tr>
                        <td>修改日期</td>
                        <td>2019.12.7 05:20:00</td>
                    </tr>
                    <tr>
                        <td>上传者 UID</td>
                        <td>100</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div class="mdui-dialog" style="max-height:95%; max-width:70%;" id="dialog-zoom">
        <div class="mdui-col-xs-12 mdui-color-white mdui-row-gapless">
            <button class="mdui-btn mdui-btn-icon mdui-text-color-black close" mdui-dialog-close><i
                    class="mdui-icon material-icons">close</i>
            </button>
        </div>
        <div class="mdui-dialog-content">
            <img src="assets/example.png" width="100%" >
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

    function downloadFile(url){
        var link = document.createElement('a');
        link.download = url.substring(url.lastIndexOf('/') + 1);
        link.style.display = 'none';
        link.href = url;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        mdui.snackbar("下载已开始。");
    }

</script>
</html>
