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
                 <a href="index.html">首页</a><span></span><a href="listNews.do">新闻资讯</a>
            </div><!-- .grid_12 -->
        </div><!-- .container_12 -->
    </div><!-- .breadcrumbs -->
    
    <section id="main">
        <div class="container_12">
            <div id="content" class="grid_9">
                <header>
                    <h1 class="page_title">新闻资讯</h1>
                </header>
                
             <c:forEach items="${list}" var="news">
                <article class="post">
		    <h2><a href="newsShow.do?id=${news.id}">${news.title}</a></h2>
		    <div class="content_article">
			<p>${news.content}</p>
                        <a href="#" class="more"></a>
                    </div><!-- .content_article -->
		    <div class="footer_article">
			<div style="float: right;">发布时间:${news.savetime}</div>
			<strong></strong><time datetime="2012-11-03"></time>
		    </div>
                </article>
            </c:forEach> 
            
                
                
                
	      
            <div class="pagination">
		    <ul>
			<li class="prev">共${total}条记录&nbsp;&nbsp;&nbsp;&nbsp;</li>
			<li class="curent" style="border-right: 1px solid #E0E0E0">
			<a href="listNews.do?index=1" style="font-family:楷体;">首页</a>&nbsp;&nbsp;
			</li>
			
			
			<li style="border-right: 1px solid #E0E0E0">
			<c:choose>
            <c:when test="${index >1}">
            <a href="listNews.do?index=${index-1}" style="font-family:楷体;">上一页</a>
            </c:when>
            <c:otherwise>
            <a href="javascrip:void(0)" style="font-family:楷体;">上一页</a>&nbsp;&nbsp;&nbsp;
            </c:otherwise>
            </c:choose>
			</li>
			
			<li style="border-right: 1px solid #E0E0E0">
			<c:choose>
            <c:when test="${pages>index}">
            <a href="listNews.do?index=${index+1}" style="font-family:楷体;">下一页</a>
            </c:when>
            <c:otherwise>
            <a href="javascrip:void(0)" style="font-family:楷体;">下一页</a>&nbsp;&nbsp;&nbsp;
            </c:otherwise>
            </c:choose>
			</li>
			
			
			<li style="border-right: 1px solid #E0E0E0">
			<a href="listNews.do?index=${pages}" style="font-family:楷体;">末页</a>
			</li>
		    </ul>
                </div><!-- .pagination -->
                <p class="pagination_info"></p>
                
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
