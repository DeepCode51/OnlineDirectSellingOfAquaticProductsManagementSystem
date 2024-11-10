<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">

    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/normalize.css">

    <script src="js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.8.3.min.js"><\/script>')</script>
    <script src="js/html5.js"></script>
    <script src="js/main.js"></script>
    <script src="js/radio.js"></script>
    <script src="js/checkbox.js"></script>
    <script src="js/selectBox.js"></script>
    <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="js/jquery.jqzoom-core.js"></script>
    <script src="js/jquery.transit.js"></script>
    <script src="js/jquery.easing.1.2.js"></script>
    <script src="js/jquery.anythingslider.js"></script>
    <script src="js/jquery.anythingslider.fx.js"></script>
</head>
<body>
    <div id="top">
        <div class="container_12">
            <div class="grid_3">
                <div class="lang">
                    <ul>
                     <c:if test="${sessionScope.sessionmember ne '' && sessionScope.sessionmember!=null}">
                        <li class="current" style="border:0px solid red;"><a href="javascript:void(0)" style="width: 200px;">你好!&nbsp;&nbsp;${sessionScope.sessionmember.tname }(${sessionScope.sessionmember.lev})</a></li>
                     </c:if>
                       
                    </ul>
                </div><!-- .lang -->

            </div><!-- .grid_3 -->

            <div class="grid_9">
                <nav>
                    <ul>
                    <c:choose>
                      <c:when test="${sessionScope.sessionmember ne '' && sessionScope.sessionmember!=null}">
                        <li class="current"><a href="showMember.do">个人信息</a></li>
                        <li><a href="yueMsg.do">帐户余额</a></li>
                        <li><a href="buyLev.do">开通会员</a></li>
                        <li><a href="orderList.do">订单信息</a></li>
                        <li><a href="favList.do">收藏夹</a></li>
                        <li><a href="Exit.do">安全退出</a></li>
                     </c:when>
                     <c:otherwise>
                        <li><a href="login.jsp">登录</a></li>
                        <li><a href="register.jsp">注册</a></li>
                     </c:otherwise>
                    </c:choose>
                    </ul>
                </nav>
            </div><!-- .grid_9 -->
        </div>
    </div><!-- #top -->
    <header>
        <div class="container_12">

            <div class="grid_9" style="border:0px solid red;width: 98%">
                <div class="top_header">
                    <div class="welcome">
                         <a href="index.do" style="font-size: 24px;text-decoration:none;font-weight: bold;font-family: '微软雅黑';letter-spacing: 2px;">水族用品网上直销系统</a>
                    </div><!-- .welcome -->
				<c:if test="${sessionScope.sessionmember ne '' && sessionScope.sessionmember!=null}">
                    <ul id="cart_nav">
                        <li>
                            <a class="cart_li" href="cartList.do">
                                <div class="cart_ico"></div>
                                	购物车
                                <span>￥
                                <c:choose>
                                   <c:when test="${totalstr eq '' || totalstr==null}">0.00</c:when>
                                   <c:otherwise>${totalstr}</c:otherwise>
                                 </c:choose> 
                                </span>
                            </a>
                            <ul class="cart_cont">
                                <li class="no_border recently">最近添加</li>
                                <c:forEach items="${cartlist}" var="cart">
                                <li>
                                    <a href="productDetails.do?id=${cart.product.id }" class="prev_cart"><div class="cart_vert"><img src="<%=path %>/upload/${cart.product.filename}" alt="Product 1" title=""></div></a>
                                    <div class="cont_cart" >
                                        <h4 style="color:#6F8921">${cart.product.productname}</h4>
                                        <div class="price">${cart.num} x 
                                        <span style="font-weight: bold;">
                                        <c:choose>
                                          <c:when test="${sessionScope.sessionmember.lev eq '普通用户'}">￥${cart.product.price}</c:when>
                                          <c:otherwise>￥${cart.product.plusprice}</c:otherwise>                                                            
                                        </c:choose>
                                        </span></div>
                                    </div>
                                    <a title="close" class="close" href="javascript:delCart('${cart.id}')"></a>
                                    <div class="clear"></div>
                                </li>
								</c:forEach>
                                <li class="no_border">
                                    <a href="cartList.do" class="view_cart">查看购物车</a>
                                    <a href="accountCart.do?total=${totalstr}" class="checkout">结算</a>
                                </li>
                            </ul>
                        </li>
                    </ul><!-- .cart_nav -->
				</c:if>
                    <form class="search" action="searchProductname.do" method="post">
                        <input type="submit" class="search_button" value="">
                        <input type="text" name="productname" class="search_form" value="${productname}" placeholder="搜索商品...">
                    </form><!-- .search -->
                </div><!-- .top_header -->

                <nav class="primary">
                    <ul>
                        <li class="curent"><a href="index.do">首页</a></li>
                        <li><a href="listNews.do">新闻资讯</a></li>
                        <li class="parent">
                            <a href="javascript:void(0)">商品分类</a>
                            <ul class="sub">
                            <c:forEach items="${ctlist}" var="category">
                                <li><a href="product_List.do?categoryid=${category.id}">${category.name}</a></li>
                            </c:forEach>
                            </ul>
                        </li>
                        <li><a href="popularityProduct.do">最具人气商品</a></li>
                        <li><a href="message_List.do">在线留言</a></li>
                    </ul>
                </nav><!-- .primary -->
            </div><!-- .grid_9 -->
        </div>
    </header>


</body>
<script type="text/javascript">
function delCart(id){
$.ajax({
	type:"post",
	url:"delCart.do?id="+id,
	date:"",
	success:function(msg){
		location.reload();
	}
})
}
</script>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
