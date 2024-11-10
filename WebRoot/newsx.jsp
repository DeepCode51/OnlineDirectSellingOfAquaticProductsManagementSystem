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
    
    <title>新闻资讯</title>
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
                 <a href="index.html">首页</a><span></span><a href="listNews.do">新闻详情</a>
            </div><!-- .grid_12 -->
        </div><!-- .container_12 -->
    </div><!-- .breadcrumbs -->
    
        <section id="main">
        <div class="container_12" style="border:0px solid red">
            <div id="content" class="grid_9" style="border:0px solid red;width: 98%">
                <header>
                    <h1 class="page_title">${news.title}</h1>
                </header>
                
                <article>
             
		    <div class="content_article">
		      <p style="text-align: center"><img src="<%=path %>/upload/${news.filename}" style="width: 400px;height: 260px;"/></p>
		      <p>${news.content }</p>
            </div><!-- .content_article -->
		    <div class="footer_article">
			<div class="number_c">${news.savetime}</div>
		    </div>
		</article>
                
                
                
                <div class="clear"></div>
            </div><!-- #content -->
            
            <div class="clear"></div>
        </div><!-- .container_12 -->
    </section><!-- #main -->
    
    
    </section><!-- #main -->
    <div class="clear"></div>
      
      <jsp:include page="foot.jsp"></jsp:include>  
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
