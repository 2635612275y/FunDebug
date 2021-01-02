<%--
  Created by IntelliJ IDEA.
  User: 26356
  Date: 2020/12/29
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fundebug - 注册</title>
    <link rel="stylesheet" type="text/css" href="css/funDebugStyle.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/register.css">
    <script type="text/javascript">
<%--        ajax注册邮箱可用性验证--%>
        var xhr = false;
        function createXHR() {
            try {
                xhr = new XMLHttpRequest();
            } catch (e) {
                try {
                    xhr = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e1) {
                    xhr = false;
                }
            }
            if (!xhr)
                alert("初始化XMLHttpRequest对象失败！");
        }
        function ajaxValidate(emailObj){
            createXHR();
            var url = "FunDebugRegisterServlet";
            var content = "type=emailAjaxValidate&email=" + emailObj.value;
            xhr.open("POST", url, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("emailValidateRegister").innerHTML = xhr.responseText;
                }
            };
            xhr.setRequestHeader("Content-Length",content.length);
            xhr.setRequestHeader("CONTENT-TYPE","application/x-www-form-urlencoded");
            xhr.send(content);
        }
        //登录邮箱跟密码是否合法验证
        function validate() {
            var email = document.getElementById("emailLogin");
            var password = document.getElementById("passwordLogin");
            if (email.value == "") {
                alert("邮箱不能为空！");
                email.focus();
                return false;
            }
            if (password.value == "") {
                alert("密码不能为空！");
                password.focus();
                return false;
            }
            return true;
        }
        //注册邮箱跟密码是否合法验证
        function register() {
            var email = document.getElementById("emailRegister");
            var password = document.getElementById("passwordRegister");
            var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;

            if (email.value == "") {
                alert("邮箱不能为空！");
                email.focus();
                return false;
            } else if (!pattern.test(email.value)) {
                alert("请输入正确的邮箱格式！");
                email.focus();
                return false;
            }
            if (password.value == "") {
                alert("密码不能为空！");
                password.focus();
                return false;
            } else if (password.length<6 || password.length>12) {
                alert("密码长度不符合要求，请输入6-12位密码!");
                password.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<!--    移动端-->
<div class="top-bar-wrapper">
    <div class="top-bar">
        <!--    FunDebug logo-->
        <div class="logo">
            <a href="./fundebug.jsp">
                <img src="./img/funDebugLogo.png" alt="FunDebug">
            </a>
        </div>
        <div class="gd"></div>
        <!--    FunDebug 菜单栏-->
        <div class="right-menu">
            <!--        菜单图标-->
            <ul class="menu-icon">
                <li></li>
                <li></li>
                <li></li>
            </ul>
            <!--  菜单列表-->
            <ul class="nav">
                <li><a href="./fundebug.jsp">首页</a></li>
                <li><a href="#">产品</a></li>
                <li><a href="#">价格</a></li>
                <li><a href="#">文档</a></li>
                <li><a href="#">博客</a></li>
                <li><a href="#">关于</a></li>
                <li><a href="#">Demo</a></li>
                <li>
                    <a href="./login.jsp">登录</a>
                </li>
                <li>
                    <a href="./register.jsp">注册</a>
                </li>
            </ul>
        </div>
        <!--  js 实现点击事件  -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script  type="text/javascript">
            document.querySelector('.right-menu').onclick=function (){
                var $menuActive = $('.right-menu');
                if($menuActive.attr('class') == 'right-menu'){
                    $menuActive.attr('class', 'right-menu active');
                }else{
                    $menuActive.attr('class', 'right-menu');
                }
            }
        </script>
        <script type="text/javascript">
            document.querySelector('.menu-icon').onclick=function (){
                var $menuActive = $('.menu-icon');
                if($menuActive.attr('class') == 'menu-icon'){
                    $menuActive.attr('class', 'menu-icon active');
                }else{
                    $menuActive.attr('class', 'menu-icon');
                }
            }
        </script>
        <!--    调用bootstrap框架-->
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
    </div>
</div>
<!--    登录注册-->
<div class="back-color">
    <div class="content">
        <form action="FunDebugRegisterServlet" method="post" onsubmit="return register();">
            <div class="form sign-in">
                <h2 style="color: #00A680">快快快注册</h2>
                <label>
                    <span>邮箱</span>
                    <input type="text" name="email" id="emailRegister" onblur="ajaxValidate(this)"/>
                    <label style="color: red" id="emailValidateRegister"></label>
                </label>
                <label>
                    <span>密码</span>
                    <input type="password" name="password" id="passwordRegister"/>
                </label>
                <button type="submit" name="submit" class="submit" value="立即注册"> 立即注册</button>
                <button type="button" class="fb-btn">使用 <span>facebook</span> 帐号注册</button>
                <label>
                    <span>注册即代表同意 <a href="https://www.fundebug.com/terms">Fundebug服务条款</a></span>
                </label>
            </div>
        </form>
        <form action="FunDebugLoginServlet" method="post" onsubmit="return validate();">
            <div class="sub-cont">
                <div class="img">
                    <div class="img__text m--up">
                        <h2>已有账号？</h2>
                        <p>有帐号就登录吧，好久不见了！</p>
                    </div>
                    <div class="img__text m--in">
                        <h2>还未注册？</h2>
                        <p>立即注册，发现大量机会！</p>
                    </div>
                    <div class="img__btn">
                        <span class="m--up">登 录</span>
                        <span class="m--in">注 册</span>
                    </div>
                </div>
                <div class="form sign-up">
                    <h2 style="color: #00A680">FunDebug欢迎你</h2>
                    <!--            <label>-->
                    <!--                <span>用户名</span>-->
                    <!--                <input type="text" />-->
                    <!--            </label>-->
                    <label>
                        <span>邮箱</span>
                        <input type="text" name="email" id="emailLogin"/>
                    </label>
                    <label>
                        <span>密码</span>
                        <input type="password" name="password" id="passwordLogin"/>
                    </label>
                    <p class="forgot-pass"><a href="javascript:">忘记密码？</a></p>
                    <button type="submit" class="submit">登 录</button>
                    <button type="button" class="fb-btn">使用 <span>facebook</span> 帐号登录</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="js/script.js"></script>
<div style="text-align:center;"></div>
<!--   网页尾部部分-->
<footer class="footCustom">
    <div class="footContainer">
        <div class="footerContent">
            <div class="content_Container">
                <div class="footer_column">
                    <div class="column_title">产品</div>
                    <span class="item_link"><a href="javascript:;">产品介绍</a></span>
                    <span class="item_link"><a href="javascript:;">博客</a></span>
                    <span class="item_link"><a href="javascript:;">服务条款</a></span>
                    <span class="item_link"><a href="javascript:;">常见问题</a></span>
                </div>
                <div class="footer_column">
                    <div class="column_title">
                        <a target="_blank" style="color: #9e9ea6;">文档</a>
                    </div>
                    <span class="item_link">
                    <a href="https://docs.fundebug.com/notifier/javascript/">JavaScript</a>
                </span>
                    <span class="item_link">
                    <a href="https://docs.fundebug.com/notifier/reactnative/">React Native</a></span>
                    <span class="item_link"><a href="https://docs.fundebug.com/notifier/wxjs/">微信小程序</a></span>
                    <span class="item_link"><a href="https://docs.fundebug.com/notifier/wegame/">微信小游戏</a></span>
                    <span class="item_link"><a href="https://docs.fundebug.com/notifier/aliapp/">支付宝小程序</a></span>
                    <span class="item_link"><a href="https://docs.fundebug.com/notifier/java/">Java</a></span>
                    <span class="item_link"><a href="https://docs.fundebug.com/notifier/nodejs/">Node.js</a></span>
                </div>
                <div class="footer_column">
                    <div class="column_title">公司</div>
                    <span class="item_link">
                    <a href="javascript:;">关于我们</a>
                </span>
                    <span class="item_link">
                <a href="javascript:;">加入我们</a>
                </span>
                </div>
                <div class="footer_column contact_column">
                    <div class="column_title">联系我们</div>
                    <div class="item_link">
                        <a href="javascript:;" class="ng-binding">邮箱：help@fundebug.com</a>
                    </div>
                    <div class="item_link">
                        <a class="javascript:;">手机：181-5016-0964</a>
                    </div>
                    <div class="item_link ng-binding">微信：181-5016-0964</div>
                    <div class="relation_picture">
                        <div class="picture" id="picture_qq">
                            <img class="picture_qq" width="90px" height="90.6px" src="/">
                        </div>
                        <div class="picture" id="picture_weixin">
                            <img class="picture-weiChat" src="https://www.fundebug.com/assets/images/wechat.ab13410f.jpg" alt="二维码">
                        </div>
                        <a class="picture" href="javascript:;">
                            <div id="picture_weibo"></div>
                        </a>
                    </div>
                </div>
            </div>

            <div class="footnote">
                <div class="copyright">Copyright © 2016-2020 · 厦门云麒信息科技有限公司 · 闽ICP备16030177号 ·</div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
