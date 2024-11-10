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
    
    <title>订单详情</title>
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
                    <h1 class="page_title">订单详情</h1>
                </header>
                    
                <article>
                    <table class="cart_product">
                        <tr class="bg">
                            <th class="images"></th>
                            <th class="name">商品名称</th>
                            <th class="price">单价</th>
                            <th class="price">会员价</th>
                            <th class="qty">数量</th>
                            <th class="qty">操作</th>
                        </tr>
                        <c:forEach items="${list}" var="ordermsgdetails">
                        <tr>
                            <td class="images"><a href="productDetails.do?id=${ordermsgdetails.product.id}"><img src="<%=path %>/upload/${ordermsgdetails.product.filename}" alt="Product 12" title=""></a></td>
                            <td class="name">${ordermsgdetails.product.productname}</td>
                            <td class="price">￥${ordermsgdetails.product.price}</td>
                            <td class="price">￥${ordermsgdetails.product.plusprice}</td>
                            <td class="num">${ordermsgdetails.num}</td>
                            <td class="name">
                            <c:if test="${ordermsgdetails.thstatus eq '可退货'}">
                            <a href="backproductadd.jsp?id=${ordermsgdetails.id}">申请退货</a>
                            </c:if>
                            
                            <c:if test="${ordermsgdetails.thstatus eq '已提交退货申请'}">
                            	已提交退货申请
                            </c:if>
                            
                            <c:if test="${ordermsgdetails.thstatus eq '已退货'}">
                            	已退货
                            </c:if>
                            
                            </td>
                        </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="7" class="cart_but">
                                <a href="orderList.do" class="continue"><img src="img/cont.png" alt="" title="">返回订单页面</a>
                                <a href="#" class="update"></a>
                            </td>
                        </tr>
                    </table>
                    
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
