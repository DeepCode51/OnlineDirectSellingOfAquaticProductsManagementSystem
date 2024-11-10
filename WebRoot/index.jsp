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

    <title>首页</title>
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
    <script src="layer/layer.js"></script>
</head>
<body>

  <!-- top -->
  <jsp:include page="top.jsp"></jsp:include>

    <div id="slider_body">
        <ul id="slider">
        <c:forEach items="${pclist}" var="pclist" varStatus="status">
            <li>
                <div class="slid_content">
                </div><!-- .slid_content -->
                <img src="<%=path %>/upload/${pclist.filename}" alt="Slid ${status.count}" title="" style="width: 986px;height: 370px;">
            </li>
		</c:forEach>
        </ul>
    </div><!-- #slider_body -->
    


    <section id="main" class="home">
        <div class="container_12">
            <div id="content">
                <div class="grid_12">
                    <h2 class="product-title" style="font-weight: bold;">最新上架</h2>
                </div><!-- .grid_12 -->

                <div class="clear"></div>

                <div class="products">
                
                <c:forEach items="${ptlist}" var="product" begin="0" end="7">
                    <article class="grid_3 article">
                        <img class="sale" src="img/new.png" alt="Sale">
                        <div class="prev">
                            <a href="productDetails.do?id=${product.id}"><img src="<%=path %>/upload/${product.filename}" alt="Product 1" title=""></a>
                        </div><!-- .prev -->

                        <h3 class="title">${product.productname}</h3>
                        <div class="cart">
                            <div class="price">
                                <div class="vert">
                                                                                      ￥&nbsp;${product.price}
                                 <c:if test="${product.isxs eq 'yes'}">                                                   
                                 <div style="font-size:4px;font-weight: bold;">今日优惠</div> 
                                 </c:if>  
                                </div>
                            </div>
                            <!-- <a href="#" class="obn"></a> -->
                            <a href="javascript:addFav('${product.id}')" class="like"></a>
                            <a href="javascript:addCart('${product.id}')" class="bay"><img src="img/bg_cart.png" alt="Buy" title=""></a>
                        </div><!-- .cart -->

                    </article><!-- .grid_3.article -->
                   </c:forEach>



                    <div class="clear"></div>
                </div><!-- .products -->
                <div class="clear"></div>
            </div><!-- #content -->

            <div class="clear"></div>


            <div id="content_bottom">
                <div class="grid_6">
                    <div class="bottom_block about_as">
                        <h3>关于我们</h3>
                        <p>${about.content}</p>
                    </div><!-- .about_as -->
                </div><!-- .grid_6 -->

                <div class="grid_6">
                    <div class="bottom_block news">
                        <h3>最新新闻</h3>
                        <ul>
                        <c:forEach items="${newslist}" var="news" begin="0" end="3">
                            <li>
                                <time datetime="${news.savetime}">${news.savetime}</time>
                                <a href="newsShow.do?id=${news.id}">${news.title}</a>
                            </li>
						</c:forEach>
                        </ul>
                    </div><!-- .news -->
                </div><!-- .grid_6 -->
                <div class="clear"></div>
            </div><!-- #content_bottom -->
        </div><!-- .container_12 -->
    </section><!-- #main.home -->

    <jsp:include page="foot.jsp"></jsp:include>
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<script type="text/javascript">
function addCart(id){
$.ajax({
	type:"post",
	url:"addCart.do?productid="+id,
	date:"",
	success:function(msg){
		if(msg==1){
			 location.reload();
		}else{
		location.replace('login.jsp');
		}
	}
})
}

function addFav(id){
	$.ajax({
		type:"post",
		url:"addFav.do?productid="+id,
		date:"",
		success:function(msg){
			if(msg==1){
				 layer.msg("成功添加到收藏夹");
			}else{
			location.replace('login.jsp');
			}
		}
	})
	}
</script>
</html>
