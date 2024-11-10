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
    
    <title>商品详情</title>
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
                 <a href="index.do">首页</a><span></span><a href="productDetails.do?id=${product.id}">商品详情</a>
            </div><!-- .grid_12 -->
        </div><!-- .container_12 -->
    </div><!-- .breadcrumbs -->
    
    <section id="main">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">商品详情</h1>
                </header>
                    
                <article class="product_page">
                    <div class="grid_5 img_slid" id="products">
			<img class="sale" src="img/sale.png" alt="Sale">
			<div class="preview slides_container">
			    <div class="prev_bg">
				<a href="<%=path %>/upload/${product.filename}" class="jqzoom" rel='gal1' title="">
				    <img src="<%=path %>/upload/${product.filename}" alt="Product 1" title="">
				</a>
			    </div>
			</div><!-- .preview -->
                        


			<div id="pagination"></div>
		    </div><!-- .grid_5 -->
                    
                    <div class="grid_7">
			<div class="entry_content">
                            <div class="soc">
			    </div><!-- .soc -->
                            
			    <div class="review">
			    
			    <a  <c:choose><c:when test="${averageStr>=1}">class='plus'</c:when><c:when test="${averageStr<1&&averageStr>0}">class='plus_minus'</c:when><c:otherwise></c:otherwise></c:choose>  href="#" title="好感度:${averageStr}"></a>
				<a <c:choose><c:when test="${averageStr>=2}">class='plus'</c:when><c:when test="${averageStr<2&&averageStr>1}">class='plus_minus'</c:when><c:otherwise></c:otherwise></c:choose> href="#" title="好感度:${averageStr}"></a>
				<a <c:choose><c:when test="${averageStr>=3}">class='plus'</c:when><c:when test="${averageStr<3&&averageStr>2}">class='plus_minus'</c:when><c:otherwise></c:otherwise></c:choose> href="#" title="好感度:${averageStr}"></a>
				<a <c:choose><c:when test="${averageStr>=4}">class='plus'</c:when><c:when test="${averageStr<4&&averageStr>3}">class='plus_minus'</c:when><c:otherwise></c:otherwise></c:choose> href="#" title="好感度:${averageStr}"></a>
				<a <c:choose><c:when test="${averageStr>=5}">class='plus'</c:when><c:when test="${averageStr<5&&averageStr>4}">class='plus_minus'</c:when><c:otherwise></c:otherwise></c:choose> href="#" title="好感度:${averageStr}"></a>
				
				
				<span><strong></strong></span>
                                <span class="separator"></span>
			        
			        <font style="font-size: 24px;">${product.productname}</font>
			        
			    </div>
			    
			    
                            <div class="ava_price" style="border-bottom: 0px;">
                                <div class="price" >
                                	￥${product.price}
                                	<c:if test="${product.discount!=1.0}">
                                    <div class="price_old" style="margin-top:10px; text-decoration:none;color:#EC6F54;font-weight: bold;">
                                      <div style="float: left;border:0px solid red;height: 25px;line-height: 25px;margin-right: 10px;">￥${product.plusprice}</div>
                                      <div style="border:1px solid #EC6F54;width: 50px;height: 20px;line-height: 20px;text-align: center;background:#EC6F54; color:white;font-size: 8px;float: left;border-radius:3px 3px;">会员价</div>
                                    </div>
				            		</c:if>
				            </div><!-- .price -->
                                
				<div class="availability_sku">
				    <div class="availability">
					商品类别: <font style="color:#6F8921">${product.category.name}</font>
				    </div>
				     <div class="availability" style="font-weight: bold;">
					投票: ${product.vote}<a href="javascript:void(0)" onclick="toupiao('${product.id}')"><img alt="" src="/onlineshopssm/images/toupiao.jpg" style="width: 30px;height: 30px;"></a> 
				    </div>
				</div><!-- .availability_sku -->
                                <div class="clear"></div>
			    </div><!-- .ava_price -->
                            
                            <div class="parameter_selection" style="height: 80px;">
			    </div><!-- .parameter_selection -->

			    <div class="cart">
                                <a href="javascript:addCart('${product.id}')" class="bay"><img src="img/bg_cart.png" alt="Buy" title="">添加到购物车</a>
                                <a href="javascript:addFav('${product.id}')" class="bay" style="background: #6F8921"><img src="img/bg_cart.png" alt="Buy" title="">添加到收藏夹</a>
                </div><!-- .cart -->

			</div><!-- .entry_content -->
		    </div><!-- .grid_7 -->
		    <div class="clear"></div>
                    
                    <div class="grid_12" >
			<div id="wrapper_tab" class="tab1">
			    <a href="#" class="tab1 tab_link">商品描述</a>
			    <a href="#" class="tab2 tab_link">评论</a>

			    <div class="clear"></div>

			    <div class="tab1 tab_body">
				<h4></h4>
				<p>${product.content}</p>
                                <div class="clear"></div>
			    </div><!-- .tab1 .tab_body -->

			    <div class="tab2 tab_body">
				<h4>用户评论</h4>
                                
                    <ul class="comments">
                   <c:forEach items="${commentlist}" var="comment">
				    <li>
					<div class="autor"><img src="<%=path %>/upload/${comment.member.filename}" style="width: 50px;;height: 50px;border-radius:25px 25px;" /></div><br/><div class="autor">&nbsp;&nbsp;${comment.member.uname}</div>, <time datetime="${comment.savetime}">${comment.savetime}</time>
					<div class="evaluation">
					    <div class="quality">
						<span>好感度</span>
						<a  <c:if test="${comment.quality>=1}">class='plus'</c:if> href="#"></a>
						<a <c:if test="${comment.quality>=2}">class='plus'</c:if> href="#"></a>
						<a <c:if test="${comment.quality>=3}">class='plus'</c:if> href="#"></a>
						<a <c:if test="${comment.quality>=4}">class='plus'</c:if> href="#"></a>
						<a  <c:if test="${comment.quality>=5}">class='plus'</c:if> href="#"></a>
					    </div>
					    <div class="price">
                        <span>价格</span>
                        <a <c:if test="${comment.price>=1}">class='plus'</c:if> href="#"></a>
						<a <c:if test="${comment.price>=2}">class='plus'</c:if> href="#"></a>
						<a <c:if test="${comment.price>=3}">class='plus'</c:if> href="#"></a>
						<a <c:if test="${comment.price>=4}">class='plus'</c:if> href="#"></a>
						<a <c:if test="${comment.price>=5}">class='plus'</c:if> href="#"></a>
					    </div>
					    <div class="clear"></div>
					</div><!-- .evaluation -->
					<p>${comment.content }</p>
                     </li>
					</c:forEach>
					
                  
				</ul><!-- .comments -->
                                
                   <form class="add_comments" name="commentForm" action="commentAdd.do" method="post">
                   <input type="hidden" value="${product.id}" name="productid">
				    <h4>发表您自己的评论</h4>

					<div class="evaluation">
					    <div class="grid_3">
							<strong>好感度</strong><br>
							<select name="quality">
							    <option value="5">&nbsp;&nbsp;&nbsp;&nbsp;5&nbsp;&nbsp;&nbsp;&nbsp;</option>
							    <option value="4">&nbsp;&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;&nbsp;</option>
							    <option value="3">&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;</option>
							    <option value="2">&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;</option>
							    <option value="1">&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select>
						</div>
						<div class="grid_3">
							<strong>价格</strong><br>
							<select name="price">
							    <option value="5">&nbsp;&nbsp;&nbsp;&nbsp;5&nbsp;&nbsp;&nbsp;&nbsp;</option>
							    <option value="4">&nbsp;&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;&nbsp;</option>
							    <option value="3">&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;</option>
							    <option value="2">&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;</option>
							    <option value="1">&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select>
						</div>
					</div><!-- .evaluation -->
					
					
					

					<div class="text_review" style="float: left">
					    <strong>您的评论</strong><sup>*</sup><br>
					    <textarea name="content" required  oninvalid="setCustomValidity('评价内容不能为空')" oninput="setCustomValidity('');"></textarea><br>
					</div><!-- .text_review -->
					<div class="clear"></div>

					<input type="submit" value="提交评论">
				    </form><!-- .add_comments -->
                                <div class="clear"></div>
			    </div><!-- .tab2 .tab_body -->

			    <div class="tab3 tab_body">
				<h4>Custom Tab</h4>
				<div class="clear"></div>
			    </div><!-- .tab3 .tab_body -->
			    <div class="clear"></div>
			</div><!-- #wrapper_tab -->
			<div class="clear"></div>
		    </div><!-- .grid_12 -->
                    
		</article><!-- .product_page -->
                
                <div class="related grid_12">
                    
                        <div class="c_header">
                            <div class="grid_10">
                                <h2>相关商品</h2>
                            </div><!-- .grid_10 -->

                            <div class="grid_2">
                                <a id="next_c1" class="next arows" href="#"><span>Next</span></a>
                                <a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
                            </div><!-- .grid_2 -->
                        </div><!-- .c_header -->

                        <div class="related_list">
                            <ul id="listing" class="products">
                            <c:forEach items="${list}" var="crproduct">
                                <li>
                                    <article class="grid_3 article">
                                        <img class="sale" src="img/sale.png" alt="Sale">
                                        <div class="prev">
                                            <a href="productDetails.do?id=${crproduct.id}"><img src="<%=path %>/upload/${crproduct.filename}" alt="Product 1" title=""></a>
                                        </div><!-- .prev -->
                        
                                        <h3 class="title">${crproduct.productname}</h3>
                                        <div class="cart">
                                            <div class="price">
                                                <div class="vert">
                                                    	￥${crproduct.price}
                                                </div>
                                            </div>
                                            <a href="javascript:addFav('${crproduct.id}')" class="like"></a>
                                            <a href="javascript:addCart('${crproduct.id}')" class="bay"><img src="img/bg_cart.png" alt="Buy" title=""></a>
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



function toupiao(id){
	location.replace("voteProdcut.do?id="+id);
}
</script>

<c:if test="${msg eq 'msg'}">
  <script type="text/javascript">
  layer.msg("抱歉!没有购买记录不能做出评论");
  </script>
</c:if>
<c:if test="${msg eq 'suc'}">
  <script type="text/javascript">
  layer.msg("发表成功");
  </script>
</c:if>
</html>
