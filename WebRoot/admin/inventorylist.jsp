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
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="css/bootstrap.min.css" >
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
</head>
<body>
<section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<jsp:include page="top.jsp"></jsp:include>
</header>
<!--header end-->
<!--sidebar start-->
<aside>
  <jsp:include page="left.jsp"></jsp:include>
</aside>
<!--sidebar end-->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      商品库存信息
    </div>
    <div class="row w3-res-tb">
      <div class="col-sm-5 m-b-xs" style="border: 0px solid red;width: 500px;">
        <form action="<%=path %>/admin/searchInventory.do" method="post" id="searchform" name="searchform">
        <input type="text" class="input-sm form-control w-sm inline v-middle" style="width: 200px;" value="${key}" placeholder="请输入标题" name="key">
        <select name="key1" class="input-sm form-control w-sm inline v-middle"  style="width: 150px;"   autocomplete="off"  class="layui-input">
    	  <option value="">选择商品类别</option>
    	  <c:forEach items="${ctlist}" var="category">
	  	  <option value="${category.id}" <c:if test="${category.id eq key1 }">selected</c:if>>${category.name}</option>
	  	  </c:forEach>
	  	</select>
        <button class="btn btn-sm btn-default" >搜索</button>     
        </form>           
      </div>
    </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>商品图片</th>
            <th>商品名称</th>
			<th>商品价格</th>
			<th>会员折扣</th>
			<th>商品类别</th>
			<th>库存数量</th>
            <th style="width:100px;">操作</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="product" varStatus="status">
          <tr>
			<td><img src="<%=path %>/upload/${product.filename}" style="width: 60px;height: 60px;"/></td>
			<td>${product.productname}</td>
			<td>${product.price}</td>
			<td>${product.discount}</td>
			<td>${product.category.name}</td>
			<td>${product.inventory.num }</td>
            <td>
              <a href="inventoryadd.jsp?productid=${product.id}" title="入库" class="active" ui-toggle-class=""><i class="fa fa-pencil text-success text-active"></i></a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <footer class="panel-footer">
      <div class="row">
        
        <div class="col-sm-5 text-center">
        </div>
        <div class="col-sm-7 text-right text-center-xs">                
          <ul class="pagination pagination-sm m-t-none m-b-none">
            <li>
            <a href="javascript:void(0)" style="font-family:楷体;"> 共${total}条记录&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;&nbsp;
            <a href="inventoryList.do?index=1" style="font-family:楷体;">首页</a>&nbsp;&nbsp;
            
            <c:choose>
            <c:when test="${index >1}">
            <a href="inventoryList.do?index=${index-1}" style="font-family:楷体;">上一页</a>
            </c:when>
            <c:otherwise>
            <a href="javascrip:void(0)" style="font-family:楷体;">上一页</a>
            </c:otherwise>
            </c:choose>
            &nbsp;&nbsp;
            <c:choose>
            <c:when test="${pages>index}">
            <a href="inventoryList.do?index=${index+1}" style="font-family:楷体;">下一页</a>
            </c:when>
            <c:otherwise>
            <a href="javascrip:void(0)" style="font-family:楷体;">下一页</a>
            </c:otherwise>
            </c:choose>
            &nbsp;&nbsp;
            <a href="inventoryList.do?index=${pages}" style="font-family:楷体;">末页</a>
            </li>
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
</section>
 <!-- footer -->
		<jsp:include page="foot.jsp"></jsp:include>
  <!-- / footer -->
</section>

<!--main content end-->
</section>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="js/jquery.scrollTo.js"></script>
</body>
</html>
