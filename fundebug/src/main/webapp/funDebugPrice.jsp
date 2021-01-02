<%--
  Created by IntelliJ IDEA.
  User: 26356
  Date: 2020/12/29
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fundebug - 价格-月</title>
    <link rel="stylesheet" href="css/price.css"/>
    <link rel="stylesheet" href="css/bttn.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/funDebugStyle.css"/>
    <link rel="stylesheet"  href="boot/bootstrap.css"/>
</head>
<body>
<!--    移动端-->
<div class="top-bar-wrapper">
    <div class="top-bar">
        <!--    FunDebug logo-->
        <div class="logo">
            <a href="successLogin.jsp">
                <img src="img/funDebugLogo.png" alt="FunDebug">
            </a>
        </div>
    </div>
</div>
<!-- 价格页面-->
<section class="price ng-scope">
    <div class="price-container">
        <div class="price-header">
            <h1 class="title">免费试用期14天！功能无任何限制！</h1>
            <p class="description">一行代码搞定BUG监控</p>
        </div>
        <div class="duration-switch">
            <div class="btn-group">
                <label class="btn btn-primary ng-untouched ng-valid ng-not-empty ng-dirty active ng-valid-parse" ng-model="priceCtrl.priceRadioSelected" uib-btn-radio="'month'">单月</label>
                <label class="btn btn-primary ng-untouched ng-valid ng-not-empty ng-dirty" ng-model="priceCtrl.priceRadioSelected" uib-btn-radio="'year'">一年</label>
            </div>
        </div>
        <div class="plan-version-container">
                <div class="col-md-4">
                <div class="plan-version">
                    <div class="plan-price">
                        <div class="plan-name">免费版</div>
                        <div class="price-content">
                            <span class="small">¥</span>
                            <span class="price">0</span>
                            <span class="small">/月</span>
                        </div>
                        <div class="slider-container"></div>
                        <div class="plan-data">
                            <p><span class="font-bold">3000</span>事件数/月</p>
                            <p>
                                <span class="font-bold">1</span>个成员，
                                <span class="font-bold">1</span>个项目，数据保存
                                <span class="font-bold">7</span>天
                            </p>
                        </div>
                        <a class="plan-button" href="ItemsTypePriceServlet?type=free" style="color: #00A680" >
                            <button type="button" onclick="PriceAdd();">添加到购物车</button></a>
                    </div>
                    <div class="plan-list">
                        <h4 class="list-name">特性</h4>
                        <ul>
                            <li>
                                <div class="check-icon"></div>
                                <span>通过邮件报警</span>
                            </li>
                            <li>
                                <div class="check-icon"></div>
                                <span>错误智能聚合</span>
                            </li>
                            <li>
                                <div class="check-icon"></div>
                                <span>控制台新错误提醒</span>
                            </li>
                            <li>
                                <div class="check-icon"></div>
                                <span>报错日报</span>
                            </li>
                            <li>
                                <div class="check-icon"></div>
                                <span>错误评论</span>
                            </li>
                            <li>
                                <div class="check-icon"></div>
                                <span>客服邮件支持</span>
                            </li>
                            <li>
                                <div class="icon-blank"></div>
                                <span class="delete">个性化定义错误过滤器</span>
                            </li>
                            <li>
                                <div class="icon-blank"></div>
                                <span class="delete">用户行为记录</span>
                            </li>
                            <li>
                                <div class="icon-blank"></div>
                                <span class="delete">Source Map支持</span>
                            </li>
                            <li>
                                <div class="icon-blank"></div>
                                <span class="delete">多种第三方报警</span>
                            </li>
                            <li>
                                <div class="icon-blank"></div>
                                <span class="delete">自定义报警规则</span>
                            </li>
                            <li>
                                <div class="icon-blank"></div>
                                <span class="delete">客服电话支持</span>
                            </li>
                            <li>
                                <div class="icon-blank"></div>
                                <span class="delete">专属客服一对一服务</span>
                            </li>
                            <li>
                                <div class="icon-blank"></div>
                                <span class="delete">自定义数据保存时间</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
                <div class="col-md-4">
                <div class="plan-version pay-version">
                    <div class="plan-price">
                        <div class="corner-badge text-center">
                            <span style="display: inline-block;transform: rotate(180deg) translateY(-6px)">年付8折</span>
                        </div>
                        <div class="plan-name">付费版</div>
                        <div class="price-content">
                            <span class="small">¥</span>
                            <span class="price ng-binding">359</span>
                            <span class="small">/月</span>
                        </div>
                        <div class="slider-container">
                            <p style="font-size:12px;color:grey;margin:0">滑动选择套餐</p>
                            <div class="rzslider ng-isolate-scope" rz-slider-model="priceCtrl.sliderSelectedIndex" rz-slider-options="priceCtrl.plansSliderOption">
                                <span class="rz-bar-wrapper rz-left-out-selection" style="visibility: hidden;">
                                <span class="rz-bar"></span></span>
                                <span class="rz-bar-wrapper rz-right-out-selection" style="visibility: hidden;">
                                <span class="rz-bar"></span></span>
                                <span class="rz-bar-wrapper">
                                <span class="rz-bar"></span></span>
                                <span class="rz-bar-wrapper" style="visibility: hidden;width: 71px;left: 0px;">
                                <span class="rz-bar rz-selection" ng-style="barStyle"></span></span>
                                <span class="rz-pointer rz-pointer-min" ng-style="minPointerStyle" role="slider" aria-valuenow="1" aria-valuetext="套餐B" aria-valuemin="0" aria-valuemax="4" tabindex="0" style="left: 61px;"></span>
                                <span class="rz-pointer rz-pointer-max" ng-style="maxPointerStyle" style="display: none;"></span>
                                <span class="rz-bubble rz-limit rz-floor" style="visibility: hidden; left: 0px;">套餐A</span>
                                <span class="rz-bubble rz-limit rz-ceil" style="visibility: hidden; left: 218px;">套餐E</span>
                                <span class="rz-bubble rz-model-value" style="visibility: hidden; left: 48px;">套餐B</span>
                                <span class="rz-bubble rz-model-high" style="visibility: hidden;"></span>
                                <span class="rz-bubble" style="visibility: hidden;"></span>
                                <ul ng-show="showTicks" class="rz-ticks ng-hide"></ul>
                            </div>
                        </div>
                        <div class="plan-data">
                            <p><span class="font-bold ng-binding">45万</span>
                                <span>事件数/月</span></p>
                            <p><span class="font-bold ng-binding">20</span>
                                <span>个成员，</span>
                                <span class="font-bold ng-binding">50</span>
                                <span>个项目，数据保存</span>
                                <span class="font-bold ng-binding">30</span>
                                <span>天</span></p>
                        </div>
                        <a class="plan-button" ng-click="priceCtrl.goToRegistration()" href="ItemsTypePriceServlet?type=pay" style="color: #00A680">
                            <button type="button" onclick="PriceAdd();">添加到购物车</button>
                        </a>
                    </div>
                    <div class="plan-list"><h4 class="list-name">增加功能</h4>
                        <ul>
                            <li>
                                <div class="check-icon"></div>
                                <span>通过邮件报警</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>错误智能聚合</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>控制台新错误提醒</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>报错日报</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>错误评论</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>客服邮件支持</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>个性化定义错误过滤器</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>用户行为记录</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>Source Map支持</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>多种第三方报警</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>自定义报警规则</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>客服电话支持</span></li>
                            <li>
                                <div class="icon-blank"></div>
                                <span class="delete">专属客服一对一服务</span></li>
                            <li>
                                <div class="icon-blank"></div>
                                <span class="delete">自定义数据保存时间</span></li>
                        </ul>
                    </div>
                </div>
            </div>
                <div class="col-md-4">
                <div class="plan-version">
                    <div class="plan-price">
                        <div class="plan-name">本地版</div>
                        <div class="price-content"><span class="small">¥</span> <span class="price">30万</span> <span
                                class="small">/年起</span></div>
                        <div class="slider-container"></div>
                        <div class="plan-data"><p><span>本地版使用Docker容器打包</span></p>
                            <p><span>快速部署到您的私有服务器</span></p></div>
                        <a class="plan-button" ng-click="priceCtrl.contactUs()" href="ItemsTypePriceServlet?type=native" style="color: #00A680">
                            <button type="button" onclick="PriceAdd();">添加到购物车</button>
                        </a>
                    </div>
                    <div class="plan-list"><h4 class="list-name">高级功能</h4>
                        <ul>
                            <li>
                                <div class="check-icon"></div>
                                <span>通过邮件报警</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>错误智能聚合</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>控制台新错误提醒</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>报错日报</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>错误评论</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>客服邮件支持</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>个性化定义错误过滤器</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>用户行为记录</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>Source Map支持</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>多种第三方报警</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>自定义报警规则</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>客服电话支持</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>专属客服一对一服务</span></li>
                            <li>
                                <div class="check-icon"></div>
                                <span>自定义数据保存时间</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script>
    PriceAdd = function (){
        alert("添加成功!记得去付款哦~");
    }
</script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>