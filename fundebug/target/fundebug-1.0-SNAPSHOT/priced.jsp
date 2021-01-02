<%--
  Created by IntelliJ IDEA.
  User: 26356
  Date: 2021/1/2
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="xfb.bean.ItemsType" isELIgnored="false"%>
<%
    ItemsType itemsType = (ItemsType) request.getSession().getAttribute("SESSION_PRICE");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FunDebug - 付费管理</title>
    <link rel="stylesheet" href="css/priced.css">
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
<div class="setting">
    <!--    填充细节-->
    <div class="ty" style="height: 100px; background-color: #F4F4F4;"></div>
    <div class="settingDashboardParentView">
        <div class="settingDashboardViewTags">
            <ul>
                <li class="ng-scope ng-scope-one">
                    <div class="SettingIcon AccountIcon"></div>
                    <div class="SettingType ng-binding"><a href="account.jsp" style="color: #C1C1C1">账户信息</a></div>
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
                    <div class="SettingType ng-binding"><a href="priced.jsp" style="color: #25A4BB">付费管理</a></div>
                </li>
            </ul>
        </div>
        <div class="SettingDashboardView">
            <div class="ng-scope">
                <div class="SettingSection DisplayBlock ng-scope">
                    <div class="Height56pxHeader HeaderBottomBorder">
                        <div class="SettingTitle PaddingLeft67Top17px">
                            <a href="#" style="color: #00A680">服务总览</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#">数据统计</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#">交易记录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#">发票管理</a>
                        </div>
                        <p style="border-bottom: 1px solid #EEE; padding-top: 12px"></p>
                        <div class="AccountContainer">
                            <div class="LeftMemberInfoContainer">
                                <div class="SettingTitle"> <img width="25px" height="25px" src="https://www.fundebug.com/assets/images/dashboard/vip.e7cb5764.svg" alt="套餐">
                                    当前套餐</div>
                                <a href=""></a>
                                <div style="background-color: #F2F2F2;width: 670px; height: 300px;">
                                    <div class="applicant_idAndTime">
                                        <table width="670px" border="0">
                                            <tr>
                                                <td height="60px"></td>
                                                <td width="60px" align="left" style="color: #00A680;">账户ID:</td>
                                                <c:if test="${not empty sessionScope.SESSION_PRICE}">
                                                <td style="color: #FBBD08;"><%=itemsType.getApplicantID()%></td>
                                                </c:if>
                                                <c:if test="${empty sessionScope.SESSION_PRICE}">
                                                    <td style="color: #FBBD08;">/</td>
                                                </c:if>
                                                <td width="60px" align="left" style="color: #00A680;">账户邮箱:</td>
                                                <c:if test="${not empty sessionScope.SESSION_PRICE}">
                                                <td style="color: #FBBD08;"><%=itemsType.getApplicantEmail()%></td>
                                                </c:if>
                                                <c:if test="${empty sessionScope.SESSION_PRICE}">
                                                    <td style="color: #FBBD08;">/</td>
                                                </c:if>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="thingsPriceAndType">
                                        <table width="670px" border="0">
                                            <tr>
                                                <td height="60px"></td>
                                                <td width="60px" align="left" style="color: #00A680;">商品价格:</td>
                                                <c:if test="${not empty sessionScope.SESSION_PRICE}">
                                                <td style="color: #FBBD08;"><%=itemsType.getThingsPrice()%></td>
                                                </c:if>
                                                <c:if test="${empty sessionScope.SESSION_PRICE}">
                                                    <td style="color: #FBBD08;">/</td>
                                                </c:if>
                                                <td width="60px" align="left" style="color: #00A680;">商品类型:</td>
                                                <c:if test="${not empty sessionScope.SESSION_PRICE}">
                                                <td style="color: #FBBD08;"><%=itemsType.getTingsType()%></td>
                                                </c:if>
                                                <c:if test="${empty sessionScope.SESSION_PRICE}">
                                                    <td style="color: #FBBD08;">/</td>
                                                </c:if>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="introduce">
                                        <table width="670px" border="0" >
                                            <tr>
                                                <td height="60px"></td>
                                                <td width="60px" align="left" style="color: #00A680;">商品介绍:</td>
                                                <c:if test="${not empty sessionScope.SESSION_PRICE}">
                                                <td style="color: #FBBD08;"><%=itemsType.getIntroduce()%></td>
                                                </c:if>
                                                <c:if test="${empty sessionScope.SESSION_PRICE}">
                                                    <td style="color: #FBBD08;">/</td>
                                                </c:if>
                                            </tr>
                                        </table>
                                    </div>
                                    <hr style="color: gray;">
                                    <div style="padding-top: 20px;">
                                        <table width="670px" border="0">
                                        <tr>
                                            <td style="color: #888;font-size: 15px">到期时间：2021-01-09</td>
                                            <td>
                                                <button style="background-color: #22A985;color: white;cursor: pointer;border-radius: 4px;">购买</button>
                                            </td>
                                            <td>
                                                <a href="ItemsTypePriceServlet?type=delete">
                                                    <button type="button" style="background-color: #22A985;color: white;cursor: pointer;border-radius: 4px;outline: none"
                                                            onclick="giveUp();">退订</button>
                                                </a>
                                            </td>
                                            <td>
                                                <button style="background-color: #D0D4D6;color: white;cursor: pointer;border-radius: 4px;">续费</button>
                                            </td>
                                            <td>
                                                <button style="background-color: #D0D4D6;color: white;cursor: pointer;border-radius: 4px;">升级</button>
                                            </td>
                                        </tr>
                                        </table>
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
<script>
    function giveUp() {
        alert("退订成功！！");
    }
</script>
</html>