<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.util.CommDAO"%>
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
<% 
CommDAO dao  = new CommDAO();
List<HashMap> phlist = dao.select("select sum(o.num) as num,o.productid  from ordermsgdetails o,ordermsg g where g.shstatus='已收货' and g.orderno=o.orderno GROUP BY productid order by num desc");
%>
            
            <div id="sidebar" class="grid_3">
                

                <aside id="specials" class="specials">
                    <header class="aside_title">
                        <h3>热销商品</h3>
                    </header>

		    <ul>
		    <% 
		    for(HashMap map:phlist){
		    HashMap pmap = dao.select("select * from product where id="+map.get("productid")).get(0);
		    %>
			<li>
			    <div class="prev">
				<a href="productDetails.do?id=<%=pmap.get("id") %>"><img src="<%=path %>/upload/<%=pmap.get("filename") %>" alt="Product 7" title=""></a>
			    </div>

			    <div class="cont">
				<a href="productDetails.do?id=<%=pmap.get("id") %>"><%=pmap.get("productname") %></a>
				<div class="prise">￥<%=pmap.get("price") %></div>
			    </div>
			</li>
		    <%} %>

		     </ul>
                </aside><!-- #specials -->


                
            </div><!-- .sidebar -->
            
            
            
            
            
            
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
