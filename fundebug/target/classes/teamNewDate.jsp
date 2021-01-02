<%--
  Created by IntelliJ IDEA.
  User: 26356
  Date: 2020/12/29
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="xfb.bean.AccountTeamDateInfo" %><%--
  Created by IntelliJ IDEA.
  User: 26356
  Date: 2020/12/29
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fundebug - 团队目录</title>
    <link rel="stylesheet" href="setupTeam/team.css">
    <link rel="stylesheet" href="css/bttn.css">
    <link rel="stylesheet" href="css/reset.css">
</head>
<body>
<!-- 从request对象中获取一个JavaBean对象 -->
<jsp:useBean id="accountTeamDateInfo" class="xfb.bean.AccountTeamDateInfo" scope="request"></jsp:useBean>
<!--    移动端-->
<div class="top-bar-wrapper">
    <div class="top-bar">
        <!--    FunDebug logo-->
        <div class="logo">
            <a href="./successLogin.jsp">
                <p style="color: #ffffff">返回首页</p>
            </a>
        </div>
        <!--    导航栏与菜单栏之间的间隙-->
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
                <li><a href="./successLogin.jsp">首页</a></li>
                <li><a href="javascript:;">产品</a></li>
                <li><a href="funDebugPrice.jsp">价格</a></li>
                <li><a href="javascript:;">文档</a></li>
                <li><a href="javascript:;">博客</a></li>
                <li><a href="javascript:;">关于</a></li>
                <li><a href="javascript:;">控制台</a></li>
                <div style="width: 100px"></div>
                <li class="success-login">
                    <button class="bttn-bordered bttn-md bttn-default">...</button>
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
        <script type="text/javascript">
            document.querySelector('.bttn-bordered').onclick=function (){
                var $menuActive = $('.bttn-bordered');
                if($menuActive.attr('class') == 'bttn-bordered'){
                    $menuActive.attr('class', 'bttn-bordered active');
                }else{
                    $menuActive.attr('class', 'bttn-bordered');
                }
            }
        </script>
        <!--    调用bootstrap框架-->
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
    </div>
</div>
<div class="setting">
    <!--    填充细节-->
    <div class="ty" style="height: 100px; background-color: #F4F4F4;"></div>
    <div class="settingDashboardParentView">
        <div class="settingDashboardViewTags">
            <ul>
                <li class="ng-scope">
                    <div class="SettingIcon AccountIcon"></div>
                    <div class="SettingType ng-binding"><a href="account.jsp" style="color: #C1C1C1">账户信息</a></div>
                </li>
                <li class="ng-scope">
                    <div class="SettingIcon TeamIcon"></div>
                    <div class="SettingType ng-binding"><a href="AccountTeamDateServlet?type=select">当前团队</a></div>
                </li>
                <li class="ng-scope">
                    <div class="SettingIcon ProjectIcon"></div>
                    <div class="SettingType ng-binding"><a href="javascript:;" style="color: #C1C1C1">项目列表</a></div>
                </li>
                <li class="ng-scope">
                    <div class="SettingIcon ConsumptionIcon"></div>
                    <div class="SettingType ng-binding"><a href="priced.jsp" style="color: #C1C1C1">付费管理</a></div>
                </li>
            </ul>
        </div>
        <div class="SettingDashboardView">
            <div class="ng-scope">
                <div class="SettingSection DisplayBlock ng-scope">
                    <div class="Height56pxHeader HeaderBottomBorder">
                        <div class="SettingTitle PaddingLeft67Top17px">团队信息</div>
                        <p style="border-bottom: 1px solid #EEE; padding-top: 12px"></p>
                        <div class="AccountContainer">
                            <div class="LeftMemberInfoContainer">
                                <%--                                添加团队信息Servlet--%>
                                    <div class="SettingTitle">团队名</div>
                                    <input type="text" class="SettingInput InputUser" name="name" value="${accountTeamDateInfo.teamName}">

                                    <div class="SettingTitle">团队简称</div>
                                    <input type="text" class="SettingInput InputShort" name="short" value="${accountTeamDateInfo.teamShort}">

                                    <div class="SettingTitle">团队人数</div>
                                    <input type="text" class="SettingInput InputNumber" name="number" value="${accountTeamDateInfo.teamNumber}">

                                    <div class="SettingTitle">团队长名字</div>
                                    <input type="text" class="SettingInput InputCaptain" name="captain" value="${accountTeamDateInfo.teamCaptain}">

                                    <div class="SettingTitle">创建日期</div>
                                    <input type="text" class="SettingInput InputDate" name="date" value="${accountTeamDateInfo.teamDate}">
                                    <a href="teamNewDate.jsp">
                                    <button type="submit" class="ChangeCode bttn-simple bttn-md bttn-success" value="保存">确认保存</button>
                                    </a>
                            </div>
                            <div class="centerButtonContainer">
                                <div class="NicknameButton">
                                    <button class="SettingInputButton SettingInputSummit">保存</button>
                                    <button class="SettingInputButton SettingInputCancel">取消</button>
                                </div>
                            </div>
                            <div class="RightIcon">
                                <div class="SettingTitle">头像</div>
                                <!--                            更换头像-->
                                <div class="MemberIconContainer">
                                    <div class="MemberIcon ng-hide">
                                        <p class="IconName ng-binding">u</p>
                                    </div>
                                    <div class="MemberIcon">
                                        <img src="img/HeadShotImage/${SESSION_PICTURE}"
                                             style="width: 150px;height: 150px;border-radius: 75px;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
