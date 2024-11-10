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


<script type="text/javascript" src="<%=path %>/admin/js/echarts.js"></script>  
<script type="text/javascript" src="<%=path %>/admin/js/china.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=53oVIOgmSIejwV7EfphPgTynOZbIiVYu"></script>

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
      销售量统计
    </div>
     <div class="row w3-res-tb">
       <div class="col-sm-5 m-b-xs" style="border:0px solid red;width: 600px;">
        <form action="<%=path %>/admin/saleProduct.do" method="post" id="searchform" name="searchform">
        价格区间:&nbsp;&nbsp;<input type="text" class="input-sm form-control w-sm inline v-middle" style="width: 200px;" value="${key}"  name="key" required oninvalid="setCustomValidity('价格输入有误')" oninput="setCustomValidity('');" pattern="(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?">
        <input type="text" class="input-sm form-control w-sm inline v-middle" style="width: 200px;" value="${key1}"  name="key1" required oninvalid="setCustomValidity('价格输入有误')" oninput="setCustomValidity('');" pattern="(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?">
        <button class="btn btn-sm btn-default">搜索</button>     
        </form>           
      </div>
     </div>
    <div  id="tx" style="width: 100%;height:450px;">
    </div>
    
    <!-- s -->
      <script type="text/javascript">
    var myChart = echarts.init(document.getElementById('tx'));


    option = {
    		tooltip : {
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
              }
            },
    	    xAxis: {
    	        type: 'category',
    	        data: ${nlist},
		        axisLabel:{
				     interval:0,//横轴信息全部显示
				     rotate:-30,//-30度角倾斜显示
				}
        
    	    },
    	    yAxis: {
    	        type: 'value'
    	    },
    	    series: [{
    	        data: ${slist},
    	        type: 'bar',

					itemStyle: {
						normal: {
							label: {
								show: true, //开启显示
								position: 'top', //在上方显示
								textStyle: { //数值样式
									color: 'black',
									fontSize: 16
								}
							}
						}
					}
    	    }]
    	};
    myChart.setOption(option);
	</script>
      <!-- e -->
    
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
