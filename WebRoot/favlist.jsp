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
    
    <title>收藏夹</title>
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
    <div class="breadcrumbs">
        <div class="container_12">
            <div class="grid_12">
                 <a href="index.do">首页</a><span></span><a href="favList.do">收藏夹</a>
            </div><!-- .grid_12 -->
        </div><!-- .container_12 -->
    </div><!-- .breadcrumbs -->
    
    <section id="main">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">收藏夹</h1>
                </header>
                    
                
                <div class="related grid_12">
                    
                        <div class="c_header" style="border-bottom: 0px;">

                            <div class="grid_2" style="border-bottom: 0px;float: right;">
                                <a id="next_c1" class="next arows" href="#"><span>Next</span></a>
                                <a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
                            </div><!-- .grid_2 -->
                        </div><!-- .c_header -->

                        <div class="related_list">
                            <ul id="listing" class="products">
                            <c:forEach items="${list}" var="fav">
                                <li>
                                    <article class="grid_3 article">
                                        <img class="sale" src="img/sale.png" alt="Sale">
                                        <div class="prev">
                                            <a href="productDetails.do?id=${fav.product.id}"><img src="<%=path %>/upload/${fav.product.filename}" alt="Product 1" title=""></a>
                                        </div><!-- .prev -->
                        
                                        <h3 class="title">${fav.product.productname}</h3>
                                        <div class="cart">
                                            <div class="price">
                                                <div class="vert">
                                                    	￥${fav.product.price}
                                                </div>
                                            </div>
                                         <a href="javascript:delFav('${fav.id}')" style="display: block;width: 50px;height: 20px;border:1px solid #EB6447;text-align: center;padding-top: 3px;background: #EB6447;color:white;float: right;text-decoration: none;letter-spacing:3px;padding-left: 8px;border-radius:20px 20px;">移出</a>
                                        </div><!-- .cart -->
                                    </article><!-- .grid_3.article -->
                                </li>
                              </c:forEach>  
                            </ul><!-- #listing -->
                         </div><!-- .brands_list -->
                </div><!-- .related -->
                    
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
function delFav(id){
$.ajax({
	type:"post",
	url:"delFav.do?id="+id,
	date:"",
	success:function(msg){
		if(msg==1){
			 location.reload();
		}
	}
})
}
</script>
</html>
