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
    
    <title>登录</title>
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
    
    <section id="main" class="page-login">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">登录或新建帐号</h1>
                </header>
                    
                <article>
                    <div class="grid_6 new_customers">
			<h2>新客户</h2>
			<p>通过在我们的商店中创建一个账户，您将能够更快地通过结账流程，查看和跟踪您的订单和更多的订单。</p>
			<div class="clear"></div>
			<button class="account" onclick="location.replace('register.jsp')">注册一个新帐号</button>
                    </div><!-- .grid_6 -->
		
                    <div class="grid_6 registed_form">
			<form class="registed" action="Login.do" name="loginForm" method="post">
			    <h2>注册客户</h2>
			    <p>如果你有我们的帐户，请登录。</p>
			    
			    
			    <div class="email">
				<strong>帐号:</strong><sup>*</sup><br>
				<input type="text" name="uname" id="uname" class=""   required oninvalid="setCustomValidity('帐号不能为空')" oninput="setCustomValidity('');">
			    </div><!-- .email -->
			    
			    
			    <div >
				<strong>密码:</strong><sup>*</sup><br>
				<input type="password" name="upass" class="" id="upass" required oninvalid="setCustomValidity('密码不能为空')" oninput="setCustomValidity('');" style="width: 430px;height: 36px;border-radius:20px 20px;border: 1px solid #CCCCCC;outline:none;padding-left: 10px;">
			    </div>
			    
			     
			    <div class="remember">
			    </div>
			     
			    <div class="submit">										
				<input type="submit" value="登录">
			    </div><!-- .submit -->
			</form><!-- .registed -->
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
<c:if test="${msg eq 'upasserr'}">
  <script type="text/javascript">
  layer.alert('用户名或密码错误', {
	  title:'提示信息',
	  icon: 2,
	  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
	})
  </script>
</c:if>
<c:if test="${msg eq 'registersuc'}">
  <script type="text/javascript">
  layer.alert('注册成功', {
	  title:'提示信息',
	  icon: 1,
	  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
	})
  </script>
</c:if>
</html>
