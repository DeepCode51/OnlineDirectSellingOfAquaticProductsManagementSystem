<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    
    <title>创建订单</title>
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
                    <h1 class="page_title">创建订单</h1>
                </header>
                    
                <article>
                    <div class="grid_6 adress">
            <c:choose>
              <c:when test="${ msg eq 'msg'}">
              <h3 style="color:red;font-weight: bold;">￥${totalstr}</h3>
              </c:when>
              <c:otherwise>
              <h3 style="color:red;font-weight: bold;">￥${totalstr}</h3>
              </c:otherwise>
            </c:choose>
			<p style="font-size: 12px;font-weight: bold;">共&nbsp;<font style="color:#6F8921">${fn:length(cartlist)}</font>&nbsp;件商品</p>
			<hr>
			
			
                    </div><!-- .adress -->
                    
                    <div class="grid_6 form">
			<form class="contact" action="creatOrder.do" method="post" name="orderForm">
			<input type="hidden" name="total" value="${totalstr}">
			    <h2>收货信息</h2>
							
			    <div class="name">
				<strong>收货人姓名:</strong><sup>*</sup><br>
				<input type="text" name="name" required oninvalid="setCustomValidity('收货人姓名不能为空')" oninput="setCustomValidity('');">
			    </div><!-- .name -->
				
			    <div class="email">
				<strong>收货地址:</strong><sup>*</sup><br>
				<input type="text" name="addr" required oninvalid="setCustomValidity('收货地址不能为空')" oninput="setCustomValidity('');" >
			    </div><!-- .email -->
							
			    <div class="phone">
				<strong>联系电话:</strong><br>
				<input type="text" name="tel" required pattern="[1][3,4,5,7,8][0-9]{9}" oninvalid="setCustomValidity('请输入11位数字或非法输入')" oninput="setCustomValidity('');">
			    </div><!-- .phone -->
				
				
			    <div class="submit">
				<div class="field"><sup></sup><span></span></div>
				<input type="submit" value="创建订单">
			    </div><!-- .submit -->
		    </form><!-- .contact -->
                </div><!-- .grid_6 -->
                    
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
</html>
