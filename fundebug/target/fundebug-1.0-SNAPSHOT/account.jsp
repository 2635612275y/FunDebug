<%@ page import="xfb.bean.Applicant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="xfb.dao.AccountDAO,xfb.bean.AccountTeamDateInfo" isELIgnored="false" %>
<%@ page import="xfb.bean.ItemsType" %>
<%--
  Created by IntelliJ IDEA.
  User: 26356
  Date: 2020/12/29
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Applicant applicant = (Applicant) request.getSession().getAttribute("SESSION_APPLICANT");
    ItemsType itemsType = (ItemsType)request.getSession().getAttribute("SESSION_PRICE");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fundebug - 账户信息</title>
    <link rel="stylesheet" href="setUpAccount/setupcss.css">
    <link rel="stylesheet" href="css/bttn.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/qwgChat.css">
</head>
<body>

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
<%--中间部分--%>
<div class="setting">
    <!--    填充细节-->
    <div class="ty" style="height: 100px; background-color: #F4F4F4;"></div>
    <div class="settingDashboardParentView">
<%--        左边列表--%>
        <div class="settingDashboardViewTags">
            <ul>
                <li class="ng-scope ng-scope-one">
                    <div class="SettingIcon AccountIcon"></div>
                    <div class="SettingType ng-binding"><a href="account.jsp" style="color: #25A4BB">账户信息</a></div>
                </li>
                <li class="ng-scope ng-scope-two">
                    <div class="SettingIcon TeamIcon"></div>
                    <c:if test="${SESSION_TEAMID=='' }">
                        <div class="SettingType ng-binding"><a href="team.jsp" style="color: #C1C1C1">当前团队</a></div>
                    </c:if>
                    <c:if test="${SESSION_TEAMID!='' }">
                        <div class="SettingType ng-binding"><a href="AccountTeamDateServlet?type=select" style="color: #C1C1C1">当前团队</a></div>
                    </c:if>
                </li>
                <li class="ng-scope ng-scope-three">
                    <div class="SettingIcon ProjectIcon"></div>
                    <div class="SettingType ng-binding"><a href="javascript:;" style="color: #C1C1C1">项目列表</a></div>
                </li>
                <li class="ng-scope ng-scope-four">
                    <div class="SettingIcon ConsumptionIcon"></div>
                    <div class="SettingType ng-binding"><a href="priced.jsp" style="color: #C1C1C1">付费管理</a></div>
                </li>
            </ul>
        </div>
<%--    中间内容--%>
        <div class="SettingDashboardView">
            <div class="ng-scope">
                <div class="SettingSection DisplayBlock ng-scope">
                    <div class="Height56pxHeader HeaderBottomBorder">
                        <div class="SettingTitle PaddingLeft67Top17px">个人信息</div>
                        <p style="border-bottom: 1px solid #EEE; padding-top: 12px"></p>
                        <div class="AccountContainer">
                            <div class="LeftMemberInfoContainer">
                                <form action="HandlePasswordServlet" method="post">
                                    <div class="SettingTitle">您的账户ID</div>
                                    <p class="SettingTips ng-binding ng-hide"></p>
                                    <input type="text" class="SettingInput InputUser" name="id" value="<%=applicant.getApplicantId()%>"/>

                                    <div class="SettingTitle">您的邮箱</div>
                                    <input type="text" class="SettingInput InputMargin" name="email" value="<%=applicant.getApplicantEmail()%>"/>

                                    <div class="SettingTitle">您的新密码</div>
                                    <input type="password" class="SettingInput InputNewCode" name="password"
                                           maxlength="10" placeholder="0-10为数字&字母组合密码">

                                    <div class="SettingTitle">请确认密码</div>
                                    <input type="password" class="SettingInput InputCorrectCode"  name="again_password"
                                           maxlength="10" placeholder="0-10为数字&字母组合密码">
                                    <button type="submit" class="ChangeCode bttn-simple bttn-md bttn-success" value="提交">修改密码</button>
                                </form>
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
                                <div class="IconBtn">
                                    <div style="height: 13px"></div>
                                    <form action="UpLoadingServlet" method="post" id="picInfo" enctype="multipart/form-data">
                                    <label for="AccountAvatarInput">修改头像</label>
                                    <input type="file" name="HeadShot" id="AccountAvatarInput">
                                    <button type="submit" class="ChangeCode bttn-simple bttn-md bttn-success" value="保存"
                                            style="background-color: #00a680; width: 150px; height: 37px">保存</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--底部登录框--%>
<div class="leftJu">
    <div class="SettingSection DisplayBlock MarginTop16px ng-scope">
        <div class="Height56pxHeader HeaderBottomBorder">
            <div class="SettingTitle PaddingLeft67Top17px">第三方登录</div>
        </div>
        <div class="SettingPLTable">
            <a ng-repeat="thirdItem in sactrl.thirdLoginList track by $index" class="SettingPLTableRow SettingPLTableRowHoverNone ng-scope">
                <div class="SettingPLTableRowCell PaddingRight With25 PaddingProjectIcon">
                    <img width="24px" height="24px" src="https://www.fundebug.com/assets/images/thirdlogin/wexin.c105e863.svg">
                </div>
                <div class="SettingPLTableRowCell PaddingLeft0px">
                    <div class="SettingPLTableRowThirdLoginTypeName ng-binding">微信
                        <span ng-if="thirdItem.userName" class="ng-scope">：</span>
                        <span class="ThirdLoginUserName ng-binding">Salem ilese</span>
                    </div>
                </div>
                <div class="SettingPLTableRowCell TextAlignRight PaddingRight67Px">
                    <button class="btn BindBtn CancelBindBtn" ng-click="sactrl.thirdLoginBtnClick(thirdItem)"
                            ng-class="{CancelBindBtn:thirdItem.bind}">
                        <span ng-if="thirdItem.bind===true" class="ng-scope">取消绑定</span>
                    </button>
                </div>
            </a>
            <a ng-repeat="thirdItem in sactrl.thirdLoginList track by $index" class="SettingPLTableRow SettingPLTableRowHoverNone ng-scope">
                <div class="SettingPLTableRowCell PaddingRight With25 PaddingProjectIcon">
                    <img width="24px" height="24px" src="https://www.fundebug.com/assets/images/thirdlogin/qq.d2f91e9b.svg">
                </div>
                <div class="SettingPLTableRowCell PaddingLeft0px">
                    <div class="SettingPLTableRowThirdLoginTypeName ng-binding">QQ
                        <span ng-if="thirdItem.userName" class="ng-scope">：</span>
                        <span class="ThirdLoginUserName ng-binding">Salem ilese</span>
                    </div>
                </div>
                <div class="SettingPLTableRowCell TextAlignRight PaddingRight67Px">
                    <button class="btn BindBtn CancelBindBtn" ng-click="sactrl.thirdLoginBtnClick(thirdItem)"
                            ng-class="{CancelBindBtn:thirdItem.bind}">
                        <span ng-if="thirdItem.bind===true" class="ng-scope">取消绑定</span>
                    </button>
                </div>
            </a>
            <a ng-repeat="thirdItem in sactrl.thirdLoginList track by $index" class="SettingPLTableRow SettingPLTableRowHoverNone ng-scope">
                <div class="SettingPLTableRowCell PaddingRight With25 PaddingProjectIcon">
                    <img width="24px" height="24px" src="https://www.fundebug.com/assets/images/thirdlogin/github.80427e63.svg">
                </div>
                <div class="SettingPLTableRowCell PaddingLeft0px">
                    <div class="SettingPLTableRowThirdLoginTypeName ng-binding">Github
                        <span ng-if="thirdItem.userName" class="ng-scope">：</span>
                        <span class="ThirdLoginUserName ng-binding">2635612275y</span>
                    </div>
                </div>
                <div class="SettingPLTableRowCell TextAlignRight PaddingRight67Px">
                    <button class="btn BindBtn CancelBindBtn" ng-click="sactrl.thirdLoginBtnClick(thirdItem)"
                            ng-class="{CancelBindBtn:thirdItem.bind}">
                        <span ng-if="thirdItem.bind===true" class="ng-scope">取消绑定</span>
                    </button>
                </div>
            </a>
        </div>
    </div>
</div>
</body>
</html>