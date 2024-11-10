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
    
    <title>购物车</title>
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
    <jsp:include page="top.jsp"></jsp:include>
    
    <section id="main">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">购物车</h1>
                </header>
                    
                <article>
                    <table class="cart_product">
                        <tr class="bg">
                            <th class="images"></th>
                            <th class="name">商品名称</th>
                            <th class="edit"> </th>
                            <th class="price">单价</th>
                            <th class="price">会员价</th>
                            <th class="qty">数量</th>
                            <th class="subtotal">小计</th>
                            <th class="close"> </th>
                        </tr>
                        <c:forEach items="${cartlist}" var="cart">
                        <tr>
                            <td class="images"><a href="productDetails.do?id=${cart.product.id}"><img src="<%=path %>/upload/${cart.product.filename}" alt="Product 12" title=""></a></td>
                            <td class="name">${cart.product.productname}</td>
                            <td class="edit"><a title="Edit" href="javascript:EditNum('${cart.id}')">Edit</a></td>
                            <td class="price">￥${cart.product.price}</td>
                            <td class="price">￥${cart.product.plusprice}</td>
                            <td class="qty"><input type="text" name="num" id="num${cart.id}" value="${cart.num}"></td>
                            <td class="subtotal">￥${cart.subtotal}</td>
                            <td class="close"><a title="close" class="close" href="javascript:delCart('${cart.id}')"></a></td>
                        </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="7" class="cart_but">
                                <a href="index.do" class="continue"><img src="img/cont.png" alt="" title=""> 继续购物</a>
                                <a href="#" class="update"></a>
                            </td>
                        </tr>
                    </table>
                    
                    <div id="cart_forms">


                        <div class="grid_4" style="float: right;">
                            <div class="bottom_block total">
                                <table class="subtotal">
                                    <tr>
                                        <td>小计</td><td class="price">￥${totalstr}</td>
                                    </tr>
                                    <tr class="grand_total">
                                        <td>总计</td><td class="price">￥${totalstr}</td>
                                    </tr>
                                </table>
                                <button class="checkout" onclick="account('${totalstr}')">进入结算 <img src="img/checkout.png" alt="" title=""></button>
                            </div><!-- .total -->
                        </div><!-- .grid_4 -->

                        <div class="clear"></div>
                    </div><!-- #cart_forms -->
                    <div class="clear"></div>
		</article>
                
                    
                <div class="clear"></div>
            </div><!-- #content -->

            <div class="clear"></div>
        </div><!-- .container_12 -->
    </section><!-- #main -->
    <div class="clear"></div>
        
    <jsp:include page="foot.jsp"></jsp:include>
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<script type="text/javascript">
function EditNum(id){
var num = $("#num"+id).val();
$.ajax({
	type:"post",
	url:"EditNum.do?id="+id+"&num="+num,
	date:"",
	success:function(msg){
		location.replace('cartList.do');
	}
})
}

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

function account(total){
	location.replace("accountCart.do?total="+total);
}
</script>
</html>
