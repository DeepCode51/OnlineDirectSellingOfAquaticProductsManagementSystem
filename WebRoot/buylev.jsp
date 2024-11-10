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
    
    <title>开通会员</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/layui.css">

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
<script>
var LinkId=document.all.tags("link");
for (var i=0;i<LinkId.length;i++ ){
if (LinkId[i].href=='css/normalize.css'){LinkId[i].href='';}
}
</script>
</head>
<body>
    <jsp:include page="top.jsp"></jsp:include>
    
    <section id="main" class="page-login">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">开通会员</h1>
                </header>
                    
                <article>
		
                    <div class="grid_6 registed_form">
            <c:if test="${member.lev eq '普通用户'}">
			<form class="registed" action="upLev.do" method="post" name="loginForm">
			<input type="hidden" name="id" value="${member.id}"/>
			  <!--   <h2>个人信息</h2>
			  <p style="color:red">请认真填写信息。</p>  --> 
			    
			    <div class="email">
				<strong style="color:red;font-size:20px;">￥100</strong>&nbsp;&nbsp;<strong style="color:red;">开通会员需支付</strong><br>
			    </div><!-- .email -->
			    
			    <div class="email" style="height: 50px;">
			    </div>
			    
			    <div class="email">
				<strong>帐号:</strong><sup>*</sup><br>
				<input type="text" name="uname" id="uname" class=""  required oninvalid="setCustomValidity('帐号不能为空')" oninput="setCustomValidity('');">
			    </div><!-- .email -->
			    
			    <div >
				<strong>密码:</strong><sup>*</sup><br>
				<input type="password" name="upass" class="" id="upass" required oninvalid="setCustomValidity('密码不能为空')" oninput="setCustomValidity('');" style="width: 430px;height: 36px;border-radius:20px 20px;border: 1px solid #CCCCCC;outline:none;padding-left: 10px;">
			    </div><!-- .password -->
			     
			    <div class="submit">	
				<input type="submit" value="支付">
			    </div><!-- .submit -->
			    
			    </form><!-- .registed -->
			    </c:if>
			    <c:if test="${member.lev eq '会员'}">
			       已是会员用户，无需再次支付！
			    </c:if>
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
<script type="text/javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
