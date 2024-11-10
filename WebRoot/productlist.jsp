<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    
    <title>商品列表</title>
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
    <jsp:include page="top.jsp"></jsp:include>  
      
    <div class="breadcrumbs">
        <div class="container_12">
            <div class="grid_12">
                 <a href="index.do">首页</a><span></span><a href="#">商品列表</a>
            </div><!-- .grid_12 -->
        </div><!-- .container_12 -->
    </div><!-- .breadcrumbs -->
    
    <section id="main">
        <div class="container_12">
            <div id="content" class="grid_9">
                <h1 class="page_title">商品列表</h1>
                 
                <div class="options">
                    
                    
		    <div class="grid-list">
			<a class="grid" href="list_Product.do?categoryid=${categoryid}"><span></span></a>
			<a class="list current" href="product_List.do?categoryid=${categoryid}"><span></span></a>
		    </div><!-- .grid-list -->
		    
                </div><!-- .options -->
                <div class="clear"></div>
                
                <div class="products_list catalog"> 
                
              <c:forEach items="${list}" var="product">                   
                    <article>
			<div class="grid_3">
			    <img class="sale" src="img/sale.png" alt="Sale">
			    <div class="prev">
				<a href="productDetails.do?id=${product.id}"><img src="<%=path%>/upload/${product.filename}" alt="Product 2" title=""></a>
			    </div><!-- .prev -->
			</div><!-- .grid_3 -->
				
			<div class="grid_6">
			    <div class="entry_content">
				<a href="productDetails.do?id=${product.id}"><h3 class="title">${product.productname}</h3></a>
                                <p> <c:if test="${fn:length(product.content)>80}"> ${fn:substring(product.content, 0, 75)}</c:if>
                                <a class="more" href="productDetails.do?id=${product.id }">&nbsp;&nbsp;&nbsp;更多</a></p>
                            </div><!-- .entry_content -->
                            
                <div class="price">
				￥${product.price}
				<c:if test="${product.isxs eq 'yes'}">                                                   
                <div style="font-size:4px;font-weight: bold;">今日优惠</div> 
                </c:if> 
			    </div>
                                
			    <div class="review">
				 <a  <c:choose><c:when test="${product.likescore>=1}">class='plus'</c:when><c:when test="${product.likescore<1&&product.likescore>0}">class='plus_minus'</c:when><c:otherwise></c:otherwise></c:choose>  href="#" title="好感度:${product.likescore}"></a>
				<a <c:choose><c:when test="${product.likescore>=2}">class='plus'</c:when><c:when test="${product.likescore<2&&product.likescore>1}">class='plus_minus'</c:when><c:otherwise></c:otherwise></c:choose> href="#" title="好感度:${product.likescore}"></a>
				<a <c:choose><c:when test="${product.likescore>=3}">class='plus'</c:when><c:when test="${product.likescore<3&&product.likescore>2}">class='plus_minus'</c:when><c:otherwise></c:otherwise></c:choose> href="#" title="好感度:${product.likescore}"></a>
				<a <c:choose><c:when test="${product.likescore>=4}">class='plus'</c:when><c:when test="${product.likescore<4&&product.likescore>3}">class='plus_minus'</c:when><c:otherwise></c:otherwise></c:choose> href="#" title="好感度:${product.likescore}"></a>
				<a <c:choose><c:when test="${product.likescore>=5}">class='plus'</c:when><c:when test="${product.likescore<5&&product.likescore>4}">class='plus_minus'</c:when><c:otherwise></c:otherwise></c:choose> href="#" title="好感度:${product.likescore}"></a>
			    </div>
				
                            <div class="cart">
                                <a href="javascript:addCart('${product.id}')" class="bay"><img src="img/bg_cart.png" alt="Buy" title="">添加到购物车</a>
                                <a href="javascript:addFav('${product.id}')" class="bay" style="background: #6F8921"><img src="img/bg_cart.png" alt="Buy" title="">添加到收藏夹</a>
                            </div><!-- .cart -->
			</div><!-- .grid_6 -->
			<div class="clear"></div>
		    </article>
		    </c:forEach> 
                    
                    
                    <div class="clear"></div>
                </div><!-- .products_list -->
                <div class="clear"></div>
	      
                <div class="pagination">
		    <ul>
			<li class="prev">共${total}条记录  &nbsp;&nbsp;&nbsp;&nbsp;第${index}/${pages}页&nbsp;&nbsp;&nbsp;&nbsp;</li>
			<li class="curent" style="border-right: 1px solid #E0E0E0">
			<a href="product_List.do?index=1&categoryid=${categoryid}" style="font-family:楷体;">首页</a>&nbsp;&nbsp;
			</li>
			
			
			<li style="border-right: 1px solid #E0E0E0">
			<c:choose>
            <c:when test="${index >1}">
            <a href="product_List.do?index=${index-1}&categoryid=${categoryid}" style="font-family:楷体;">上一页</a>
            </c:when>
            <c:otherwise>
            <a href="javascrip:void(0)" style="font-family:楷体;">上一页</a>&nbsp;&nbsp;&nbsp;
            </c:otherwise>
            </c:choose>
			</li>
			
			<li style="border-right: 1px solid #E0E0E0">
			<c:choose>
            <c:when test="${pages>index}">
            <a href="product_List.do?index=${index+1}&categoryid=${categoryid}" style="font-family:楷体;">下一页</a>
            </c:when>
            <c:otherwise>
            <a href="javascrip:void(0)" style="font-family:楷体;">下一页</a>&nbsp;&nbsp;&nbsp;
            </c:otherwise>
            </c:choose>
			</li>
			
			
			<li>
			<a href="product_List.do?index=${pages}&categoryid=${categoryid}" style="font-family:楷体;">末页</a>
			</li>
		    </ul>
                </div><!-- .pagination -->
                
                <div class="clear"></div>
            </div><!-- #content -->
            
            <jsp:include page="right.jsp"></jsp:include>
            
            <div class="clear"></div>
        </div><!-- .container_12 -->
    </section><!-- #main -->
    <div class="clear"></div>
    <jsp:include page="foot.jsp"></jsp:include>
</body>
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

function arrange(){
	var arrangetype = $("#arrangetype").val();
	location.replace("product_List.do?arrangetype="+arrangetype+"&categoryid="+${categoryid});
	}
</script>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
