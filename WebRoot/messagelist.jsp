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
    
    <title>在线留言</title>
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
                 <a href="index.do">首页</a><span></span><a href="message_list.do">在线留言</a>
            </div><!-- .grid_12 -->
        </div><!-- .container_12 -->
    </div><!-- .breadcrumbs -->
    
    <section id="main">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">在线留言</h1>
                </header>
                    
                    
                    
                    <div class="grid_12" >

			    <div class="tab1 tab_body" >
                                
                    <ul class="comments">
                   <c:forEach items="${list}" var="message">
				    <li>
					<div class="autor"><img src="<%=path %>/upload/${message.member.filename}" style="width: 50px;;height: 50px;border-radius:25px 25px;" /></div><br/><div class="autor">&nbsp;&nbsp;${message.member.uname}</div>, <time datetime="${message.member.savetime}">${message.member.savetime}</time>
					<div class="evaluation">
					${message.content}
					    <div class="clear"></div>
					</div><!-- .evaluation -->
				    <c:if test="${message.replycontent ne ''}">
					<div style="border-bottom: 1px solid #E0E0E0;text-align: right;"><font style="font-weight: bold;">回复:</font><p>${message.replycontent}</p><time datetime="${message.replysavetime}">${message.replysavetime}</time></div>
					</c:if>
                     </li>
					</c:forEach>
					
                  
				</ul><!-- .comments -->
                                
                   <form class="add_comments" name="commentForm" action="messageAdd.do" method="post">

					<div class="text_review" style="float: left">
					    <strong>请填写留言内容</strong><sup>*</sup><br>
					    <textarea name="content" required  oninvalid="setCustomValidity('留言内容不能为空')" oninput="setCustomValidity('');"></textarea><br>
					</div><!-- .text_review -->
					<div class="clear"></div>

					<input type="submit" value="提交评论">
				    </form><!-- .add_comments -->
                                <div class="clear"></div>
			    </div><!-- .tab2 .tab_body -->

			    <div class="tab3 tab_body">
				<div class="clear"></div>
			    </div><!-- .tab3 .tab_body -->
			    <div class="clear"></div>
			<div class="clear"></div>
		    </div><!-- .grid_12 -->
                    
                    
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
