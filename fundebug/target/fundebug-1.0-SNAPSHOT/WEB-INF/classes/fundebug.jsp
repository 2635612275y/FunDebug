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
    <title>Fundebug：一行代码搞定BUG监控 - 网站错误监控|JS错误监控|资源加载错误|网络请求错误|小程序错误监控|Java异常监控|监控报警|Source Map|用户行为|可视化重现</title>
    <link rel="stylesheet" type="text/css" href="css/funDebugStyle.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/bttn.css">
    <link rel="stylesheet" href="css/wave.css">
    <link rel="stylesheet" href="css/email.css">
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
                <li><a href="./fundebug.jsp">首页</a></li>
                <li><a href="javascript:;">产品</a></li>
                <li><a href="javascript:;">价格</a></li>
                <li><a href="javascript:;">文档</a></li>
                <li><a href="javascript:;">博客</a></li>
                <li><a href="javascript:;">关于</a></li>
                <li><a href="javascript:;">Demo</a></li>
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
<!--   及时发现bug，提高Debug效率部分-->
<%--已给video标签去掉点击边框--%>
<div class="container-barWrapper">
    <div class="container-bug">
        <div class="container-max">
            <div class="fontLeft">
                <p class="notion" style="font-size: 15px;color: #ffffff;margin: 0">专业的应用错误监控平台</p>
                <p class="WebTitle">及时发现Bug，提高Debug效率</p>
                <p>
                    <span class="total-ErrorNumber">累计处理错误</span>
                    <span class="ErrorNumber"><input type="text" id="countError"/></span>
                </p>
                <div class="button-style">
                    <button class="bttn-unite bttn-md bttn-success">免费试用</button>
                </div>
                <p class="test-used"><strong>●试用期14天内功能不受任何限制</strong></p>
            </div>
            <div class="video-player">
                <div class="content">
                    <video style="outline: none" width="440" height="298" poster="https://www.fundebug.com/assets/images/landing/letter.9691f260.png" controls>
                        <source src="img/product.mp4" type="video/mp4">
                    </video>
                </div>
            </div>
        </div>
    </div>
</div>
<!--   错误监听数量变化 JS -->
<script type="text/javascript">
    setInterval(function(){
        var num = parseInt(document.getElementById('countError').value);
        document.getElementById('countError').value = num + 77;
    },1000);
    document.getElementById('countError').value = 5726138521;
</script>
<!--   清除两个块儿之间的间隙-->
<div class="Notification">
    <div class="NotificationContainer">
    </div>
</div>
<!--   付费客户部分-->
<div class="user-case-containerWrapper">
    <div class="user-case-container">
        <span class="title">付费客户</span>
        <div class="row">
            <div class="item">
                <img src="https://www.fundebug.com/assets/images/landing/paid_user_logo_list.45f7f49a.jpg" alt="付费客户">
            </div>
        </div>
    </div>
</div>
<!--   全栈 实时 智能 安全部分-->
<div class="productContentWrapper">
    <div class="productContent">
        <div class="fullStack">
            <img src="https://www.fundebug.com/assets/images/landing/quanzhan.8580f090.svg" alt="全栈">
            <p class="productItemTitle">全栈</p>
            <p class="productItemContent">支持React Native，Java及Node.js</p>
        </div>
    </div>
    <div class="productContent">
        <div class="realTime">
            <img src="https://www.fundebug.com/assets/images/landing/shishi.092477ee.svg" alt="实时">
            <p class="productItemTitle">实时</p>
            <p class="productItemContent">第一时间发送错误报警</p>
        </div>
    </div>
    <div class="productContent">
        <div class="intelligent">
            <img src="https://www.fundebug.com/assets/images/landing/zhineng.c53e5ee6.svg" alt="智能">
            <p class="productItemTitle">智能</p>
            <p class="productItemContent">基于机器学习聚合错误数据</p>
        </div>
    </div>
    <div class="productContent">
        <div class="safe">
            <img src="https://www.fundebug.com/assets/images/landing/anquan.4b91b9ec.svg" alt="安全">
            <p class="productItemTitle">安全</p>
            <p class="productItemContent">全站HTTPS加密护航</p>
        </div>
    </div>
</div>
<!--   用户行为部分-->
<div class="user-behaviorWrapper">
    <div class="user-behavior">
        <div class="user-behavior-image">
            <div class="user-behaviorHeader">
                <img src="https://www.fundebug.com/assets/images/landing/userbehavior_btn.d3449567.svg" alt="用户行为">
            </div>
            <div class="user-behaviorBg">
                <img src="https://www.fundebug.com/assets/images/landing/userbehavior.0f4f8922.svg" alt="用户行为背景">
            </div>
        </div>
        <div class="user-behavior-people">
        </div>
        <div class="user-behavior-text">
            <p class="details-title">快速复现出错场景</p>
            <p class="details-content">记录出错前鼠标点击、页面跳转、网络请求，控制台打造应用的黑匣子，带您重返"失事"现场。</p>
        </div>
    </div>
</div>
<!--   源码出错部分-->
<div class="source-map">
    <div class="source-behavior">
        <div class="source-behavior-text">
            <p class="details-title">一键还原出错代码</p>
            <p class="details-content">通过 Source Map 还原生产环境中的压缩代码，提供完整的堆栈信息，准确定位到出错源码，帮助您快速修复Bug。</p>
        </div>
        <div class="source-behavior-people">
        </div>
        <div class="source-behavior-image">
            <img src="img/sourceImage/source-pic-1.png" alt="bug示例" id="pic-one">
        </div>
    </div>
</div>
<!--   图片自动切换JS-->
<script>
    var i = 1;
    setInterval(function () {
        i++;
        if(i > 2){
            i = 1;
        }
        document.getElementById('pic-one').src = "img/sourceImage/source-pic-" + i + ".png";
    }, 2000);
</script>
<!--   最近新闻部分-->
<div class="something">
    <div class="somethingWrapper">
        <div class="newTitle">最近新闻</div>
        <div class="newItems">
            <div class="contentBg leftMargin">
                <p class="newsTitle">产品动态</p>
                <ul>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">Fundebug三周年！生日快乐!</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">"猜画小歌"的纠错助手来自厦门</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">Fundebug正式公布收费方案</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">Fundebug创始人入选厦门市“双百计划”</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">Fundebug完成小目标：整它1个亿!</a></li>
                </ul>
                <div class="moreNews">
                    <a href="javascript:;">更多</a>
                </div>
            </div>
            <div class="contentBg middleMargin">
                <p class="newsTitle">技术博客</p>
                <ul>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">我们应该如何给需求排序？</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">不要争了！技术选择没那么重要</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">2018年，JavaScript都经历了什么？</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">Fundebug是这样备份数据的</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">重新思考单元测试</a></li>
                </ul>
                <div class="moreNews">
                    <a href="javascript:;">更多</a>
                </div>
            </div>
            <div class="contentBg rightMargin">
                <p class="newsTitle">常见问题</p>
                <ul>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">是免费的吗?</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">支持哪些语言?</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">如何获取apikey?</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">支持哪些浏览器?</a></li>
                    <li>●&nbsp;&nbsp;&nbsp;<a href="javascript:;">是否开源?</a></li>
                </ul>
                <div class="moreNews">
                    <a href="javascript:;">更多</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--   波浪纹样式-->
<div class="cancelWrapper">
    <div class="cancelWrapper-do"></div>
    <div class="cancel">
        <div class="waveWrapper waveAnimation">
            <div class="waveWrapperInner bgTop">
                <div class="wave waveTop" style="background-image: url('img/waveImage/wave-top.png')"></div>
            </div>
            <div class="waveWrapperInner bgMiddle">
                <div class="wave waveMiddle" style="background-image: url('img/waveImage/wave-mid.png')"></div>
            </div>
            <div class="waveWrapperInner bgBottom">
                <div class="wave waveBottom" style="background-image: url('img/waveImage/wave-bot.png')"></div>
            </div>
        </div>
    </div>
</div>
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
<!--发送邮件功能-->
<div class="is_no">
    <div class="router-button__Wrapper-sc-1xlmfkg-0 jDKtMA">
        <div class="frame-button-content__Wrapper-sc-1td9tx7-0 dzxXfb">
            <div class="frame-button-content__RoundWrapper-sc-1td9tx7-3 LOaHP">
                <label class="icon__Span-sc-5foskt-0 cSUETK">
                <span typeof="call-button-7" class="base-icon__Container-sc-1ajxhaa-0 kPUpgz">
                </span>
                </label>
            </div>
        </div>
    </div>
</div>
<!--留言板展开栏-->
<div class="frame-chat_is-no">
    <div class="the_top">
        <ul>
            <li class="title">给我们留言</li>
            <li class="icons"><a href="javascript:;"><img src="img/reset.png" alt="收起"></a></li>
        </ul>
    </div>
    <div class="reduce">
        您好，欢迎直接留言提交工单，或则发送邮件到help@fundebug.com联系我们。
    </div>
    <form action="SendEmailServlet" method="post">
        <div class="sendEmail">
            <div class="one">
                <label>邮箱
                    <span>*</span>
                </label>
                <input type="text" focus="true" name="email" placeholder="请输入">
            </div>
            <div class="two">
                <label>留言内容
                    <span>*</span></label>
                <textarea placeholder="..." name="content" class="emailContent"></textarea>
            </div>
        </div>
        <button type="submit" class="ChangeCode bttn-simple bttn-md bttn-success" value="提交">提交</button>
    </form>
</div>
<!--js点击事件-->
<!--留言板显示-->
<script  type="text/javascript">
    document.querySelector('.is_no').onclick=function (){
        var $menuActive = $('.frame-chat_is-no');
        if($menuActive.attr('class') == 'frame-chat_is-no'){
            $menuActive.attr('class', 'frame-chat_is-no active');
        }else{
            $menuActive.attr('class', 'frame-chat_is-no');
        }
    }
</script>
<!--留言板消失-->
<script  type="text/javascript">
    document.querySelector('.icons').onclick=function (){
        var $menuActive = $('.frame-chat_is-no');
        if($menuActive.attr('class') == 'frame-chat_is-no'){
            $menuActive.attr('class', 'frame-chat_is-no active');
        }else{
            $menuActive.attr('class', 'frame-chat_is-no');
        }
    }
</script>
</body>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>