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
    <title>登录 - PicManager</title>
    <link rel="stylesheet" href="css/mdui.min.css">
    <link rel="stylesheet" href="css/pm-style.css">
    <script src="js/mdui.min.js" type="text/javascript"></script>
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <meta charset="UTF-8" content="text/html">
</head>



<body class="mdui-theme-primary-teal mdui-theme-accent-pink mdui-drawer-body-left mdui-appbar-with-toolbar">
    <header class="mdui-appbar mdui-appbar-fixed">
        <div class="mdui-toolbar mdui-color-theme">
            <a href="javascript:;" mdui-drawer="{target: '#drawer-main', swipe: true}" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">menu</i></a>
            <span class="mdui-typo-title">PicManager</span>
            <div class="mdui-toolbar-spacer"></div>
            <a href="javascript:location.reload();" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '刷新'}"><i class="mdui-icon material-icons">refresh</i></a>
            <a mdui-menu="{target: '#menu-toolbar'}" class="mdui-btn mdui-btn-icon"mdui-tooltip="{content: '更多'}"><i class="mdui-icon material-icons">more_vert</i></a>

            <ul class="mdui-menu" id="menu-toolbar">
                <li class="mdui-menu-item"><a class="mdui-ripple">查看日志</a></li>
                <li class="mdui-menu-item"><a class="mdui-ripple">登出</a></li>
            </ul>

        </div>
    </header>


    <div class="mdui-drawer mdui-color-white" id="drawer-main">
        <ul class="mdui-list">
            <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-blue">image</i>
                <div class="mdui-list-item-content">浏览</div>
            </li>
            <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-deep-orange">settings</i>
                <div class="mdui-list-item-content">管理</div>
            </li>
            <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-green">account_circle</i>
                <div class="mdui-list-item-content">我的</div>
            </li>
            <li class="mdui-subheader">关于</li>
            <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-purple">info</i>
                <div class="mdui-list-item-content">关于</div>
            </li>

        </ul>
    </div>


    <div class="mdui-container-fluid">
        <div id="wrapper">
            <canvas id="canvas" width="2500px" height="1280px"></canvas>
            <canvas id="canvasbg" width="2500px" height="1280px"></canvas>
        </div>
        <div class="mdui-row ">
            <div class="mdui-col-xs-12">
                <div class="mdui-typo-display-3 mdui-m-x-5 mdui-m-t-5 mdui-m-b-2">Welcome.</div>
                <div class="mdui-typo-subheading-opacity mdui-m-x-5 mdui-m-b-2">在开始前，请先登录。</div>
            </div>

        </div>

        <div class="mdui-row">
            <div class="mdui-col-xs-12">
                <button mdui-dialog="{target: '#dialog-login'}"
                        class="mdui-btn mdui-btn-raised mdui-color-theme  mdui-m-l-5 mdui-ripple">
                    登录
                </button>

                <button mdui-dialog="{target: '#dialog-register'}"
                        class="mdui-btn mdui-btn-raised mdui-color-theme  mdui-m-l-1 mdui-ripple">
                    注册
                </button>
            </div>

        </div>

    </div>


    <div class="mdui-dialog" style="height: 600px; width: 400px;" id="dialog-login">
        <div class="mdui-col-xs-12 mdui-color-theme mdui-row-gapless">
            <button class="mdui-btn mdui-btn-icon mdui-text-color-white close" mdui-dialog-close><i class="mdui-icon material-icons">close</i>
            </button>
        </div>
        <div class="mdui-dialog-title mdui-color-theme dialog-login">
            <div style="margin-top: 100px">登录</div>
        </div>
        <div class="mdui-dialog-content dialog-login">
            <div class="mdui-textfield mdui-textfield-floating-label mdui-textfield-has-bottom">
                <label class="mdui-textfield-label">用户名或邮箱</label><input class="mdui-textfield-input" name="name"
                                                                         type="text" required="">
                <div class="mdui-textfield-error">账号不能为空</div>
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label mdui-textfield-has-bottom"><label
                    class="mdui-textfield-label">密码</label><input class="mdui-textfield-input" name="password"
                                                                  type="password" required="">
                <div class="mdui-textfield-error">密码不能为空</div>
            </div>
            <div class="actions mdui-clearfix">
                <button class="mdui-btn mdui-ripple more-option" type="button"
                        mdui-menu="{target: '#mc-login-menu', position: 'top', covered: true}">更多...
                </button>
                <ul class="mdui-menu" id="mc-login-menu">
                    <li class="mdui-menu-item" mdui-dialog="{target: '#dialog-register'}" mdui-dialog-close><a class="mdui-ripple">注册</a></li>
                </ul>
                <button type="submit"  class="mdui-btn mdui-btn-raised mdui-color-theme mdui-float-right">登录</button>

            </div>
        </div>
    </div>

    <div class="mdui-dialog" style="height: 600px; width: 400px;" id="dialog-register">
        <div class="mdui-col-xs-12 mdui-color-green mdui-row-gapless">
            <button class="mdui-btn mdui-btn-icon mdui-text-color-white close" mdui-dialog-close>
                <i class="mdui-icon material-icons">close</i>
            </button>
        </div>
        <div class="mdui-dialog-title mdui-color-green dialog-login">
            <div style="margin-top: 100px; color:white">注册</div>
        </div>
        <div class="mdui-dialog-content dialog-login">

            <div class="mdui-textfield mdui-textfield-floating-label">
                <label class="mdui-textfield-label">用户名</label>
                <input class="mdui-textfield-input" name="name" maxlength="20"  type="text" required="">
                <div class="mdui-textfield-error">用户名不能为空</div>
            </div>

            <div class="mdui-textfield mdui-textfield-floating-label" type="email" required="">
                <label class="mdui-textfield-label">邮箱</label>
                <input class="mdui-textfield-input" name="name" type="text">
                <div class="mdui-textfield-error">邮箱格式错误</div>

            </div>
            <div class="mdui-textfield mdui-textfield-floating-label">
                <label class="mdui-textfield-label">密码</label>
                <input id="text-reg-password" class="mdui-textfield-input" name="password" type="password"
                                                                  pattern="^.*(?=.{6,})(?=.*[a-z])(?=.*[A-Z]).*$"
                                                                  required="">
                <div class="mdui-textfield-error">密码至少 6 位，且至少包含大小写字母</div>
            </div>

            <div id="wrapper-repeatpassword" class="mdui-textfield mdui-textfield-floating-label">
                <label class="mdui-textfield-label">再次输入密码</label>
                <input id="text-reg-repeatpassword" class="mdui-textfield-input" name="password" type="password">
                <div class="mdui-textfield-error">密码不匹配</div>
            </div>
            <div class="actions mdui-clearfix">
                <button mdui-dialog="{target : '#dialog-login'}" mdui-dialog-close class="mdui-btn mdui-btn mdui-color-white mdui-float-left">已有账户？登录</button>
                <button type="submit" class="mdui-btn mdui-btn-raised mdui-color-green mdui-text-color-white mdui-float-right">注册</button>

            </div>
        </div>
    </div>

</body>

<script type="text/javascript">
    $("#text-reg-repeatpassword").bind("input propertychange", function () {

        if($("#text-reg-password").val() != $("#text-reg-repeatpassword").val()){
            $("#wrapper-repeatpassword").addClass("mdui-textfield-invalid");
            console.log("INVALID");
        }
        else{
            $("#wrapper-repeatpassword").removeClass("mdui-textfield-invalid");
            console.log("VALID");
        }
    })
</script>
<script src="js/canvas.js" type="text/javascript"></script>
</html>
