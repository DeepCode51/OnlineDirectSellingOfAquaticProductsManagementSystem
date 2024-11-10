<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    
    <title>订单信息</title>
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
    
    <script src="<%=path %>/js/jquery2.0.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/layer/layer.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/layer/layui.css">
</head>
<body>
    <jsp:include page="top.jsp"></jsp:include>
    
    <section id="main">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">订单信息</h1>
                </header>
                    
                <article>
                    
                  <div class="grid_12" >
			<div id="wrapper_tab" class="tab1">
			    <a href="#" class="tab1 tab_link">未完成的订单</a>
			    <a href="#" class="tab2 tab_link">待收货</a>
			    <a href="#" class="tab3 tab_link">交易完成</a>

			    <div class="clear"></div>

			    <div class="tab1 tab_body">
					<table>
				      <tr class="bg">
					   <th>订单编号</th><th>总价(￥)</th><th>创建时间</th><th>收货信息</th><th>付款状态</th><th>发货状态</th><th style="width: 100px;">操作</th>
				      </tr>
				     <c:forEach items="${fklist}" var="fkorder">
					  <tr>
						  <td><a href="javascript:void(0)" onclick="orderDetails('${fkorder.orderno}')" style="text-decoration: none;color:#6F8921;font-weight: bold;" >${fkorder.orderno}</a></td>
						  <td>${fkorder.total}</td>
						  <td>${fkorder.savetime}</td>
						  <td>
						 <font style="font-weight: bold;">地址:&nbsp;&nbsp;</font>${fkorder.addr}&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">${fkorder.name}&nbsp;&nbsp;&nbsp;&nbsp;${fkorder.tel}</font>
						  </td>
						  <td>${fkorder.fkstatus}</td>
						  <td>${fkorder.fhstatus}</td>
						  <td>
						  <c:if test="${fkorder.fkstatus eq '待付款'}">
						  <a href="javascript:void(0)" onclick="orderpay('${fkorder.id}','${fkorder.total}')" style="text-decoration: none;font-family: '楷体';color:#6F8921;font-weight: bold;">付款</a>
						  </c:if>
						  <c:if test="${fkorder.fhstatus eq '已发货' }">
						  <a href="javascript:void(0)" onclick="checkWl('${fkorder.orderno}')" style="text-decoration: none;font-family: '楷体';color:#6F8921;font-weight: bold;">查看物流信息</a>
						  </c:if>
						  </td>
					  </tr>
					  </c:forEach>
				</table>
			    </div><!-- .tab1 .tab_body -->

			    <div class="tab2 tab_body">
                   	<table>
						<tr class="bg">
					   <th>订单编号</th><th>总价(￥)</th><th>创建时间</th><th>收货信息</th><th style="width: 100px;">操作</th>
				      </tr>
				     <c:forEach items="${shlist}" var="shorder">
					  <tr>
						  <td><a href="javascript:void(0)" onclick="orderDetails('${shorder.orderno}')" style="text-decoration: none;color:#6F8921;font-weight: bold;" >${shorder.orderno}</a></td>
						  <td>${shorder.total}</td>
						  <td>${shorder.savetime}</td>
						  <td>
						 <font style="font-weight: bold;">地址:&nbsp;&nbsp;</font>${shorder.addr}&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">${shorder.name}&nbsp;&nbsp;&nbsp;&nbsp;${fkorder.tel}</font>
						  </td>
						  <td><a href="javascript:void(0)" onclick="ordershouhuo('${shorder.id}')" style="text-decoration: none;font-family: '楷体';color:#6F8921;font-weight: bold;">确认收货</a></td>
					  </tr>
					  </c:forEach>
					</table>
			    </div><!-- .tab2 .tab_body -->

			    <div class="tab3 tab_body">
				<table>
						<tr class="bg">
					   <th>订单编号</th><th>总价(￥)</th><th>创建时间</th><th>收货信息</th><th>操作</th>
				      </tr>
				     <c:forEach items="${wclist}" var="wcorder">
					  <tr>
						  <td><a href="javascript:void(0)" onclick="orderDetails('${wcorder.orderno}')" style="text-decoration: none;color:#6F8921;font-weight: bold;" >${wcorder.orderno}</a></td>
						  <td>${wcorder.total}</td>
						  <td>${wcorder.savetime}</td>
						  <td>
						 <font style="font-weight: bold;">地址:&nbsp;&nbsp;</font>${wcorder.addr}&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">${wcorder.name}&nbsp;&nbsp;&nbsp;&nbsp;${wcorder.tel}</font>
						  </td>
						  <td><a href="javascript:void(0)" onclick="checkWl('${wcorder.orderno}')" style="text-decoration: none;font-family: '楷体';color:#6F8921;font-weight: bold;">查看物流信息</a></td>
					  </tr>
					  </c:forEach>
					</table>
			    </div><!-- .tab3 .tab_body -->
			    <div class="clear"></div>
			</div>​<!-- #wrapper_tab -->
			<div class="clear"></div>
		    </div>
                    
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
<script type="text/javascript">
function orderDetails(orderno){
	location.replace('orderDetails.do?orderno='+orderno);
}

function orderpay(id,total){
	location.replace('orderpay.do?id='+id+"&total="+total);
}

function ordershouhuo(id){
	location.replace('orderShouhuo.do?id='+id);
}

function checkWl(orderno){
	location.replace('wlMsg.do?orderno='+orderno);
}

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
</html>
