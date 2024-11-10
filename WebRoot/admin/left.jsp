<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>水族用品网上直销系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="text/javascript" src="<%=path %>/admin/js/jquery2.0.3.min.js"></script>
</head>
<SCRIPT language=javascript>
window.onload=function (){
	$(".sub-menu").hide();
	$(".sub-menu").show();
	//$("#news1").show();
	$(".sub").show();
}
</SCRIPT>
<body>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="index.do">
                        <i class="fa fa-dashboard"></i>
                        <span>首页</span>
                    </a>
                </li>
              <!--  
                <li class="sub-menu"  id="sysmsg">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>系统管理</span>
                    </a>
                    <ul class="sub"  >
						<li ><a href="showAbout.do?id=1&pagemsg=sysmsg">关于我们</a></li>
						<li><a href="glyphicon.html">滚动图片</a></li>
                        <li><a href="grids.html">新闻管理</a></li>
                    </ul>
                </li>
                 --> 
                 <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>系统信息</span>
                    </a>
                    <ul class="sub">
						<li><a href="showAbout.do?id=1">关于我们</a></li>
						<li><a href="pictureadd.jsp">新增滚动图片</a></li>
						<li><a href="pictureList.do">滚动图片</a></li>
                    </ul>
                </li>
                
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>用户管理</span>
                    </a>
                    <ul class="sub">
						<li><a href="memberList.do">会员信息</a></li>
                    </ul>
                </li>
                
                <li class="sub-menu" id="news">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>业务管理</span>
                    </a>
                    <ul class="sub" id="news1">
						<li><a href="newsadd.jsp">新增新闻</a></li>
						<li><a href="newsList.do">新闻列表</a></li>
						<li><a href="categoryadd.jsp">新增类别</a></li>
						<li><a href="categoryList.do">类别列表</a></li>
						<li><a href="categorySelect.do">新增商品</a></li>
						<li><a href="productList.do">商品列表</a></li>
						<li><a href="inventoryList.do">库存管理</a></li>
						<li><a href="orderList.do">订单管理</a></li>
						<li><a href="messageList.do">留言管理</a></li>
                    </ul>
                </li>
                
                <li class="sub-menu" id="news">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>售后管理</span>
                    </a>
                    <ul class="sub" id="news1">
						<li><a href="backproductList.do">退货管理</a></li>
                    </ul>
                </li>
                
                
            </ul>            
         </div>
        <!-- sidebar menu end-->
    </div>
</body>
</html>
