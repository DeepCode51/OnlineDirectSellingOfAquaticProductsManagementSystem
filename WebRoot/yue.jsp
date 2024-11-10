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
    
    <title>帐户余额</title>
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
                    <h1 class="page_title">帐户余额</h1>
                </header>
                    
                <article>
		
                    <div class="grid_6 registed_form">
			<form class="registed" action="chongzhi.do" method="post" name="loginForm">
			<input type="hidden" name="id" value="${member.id}"/>
			  <!--   <h2>个人信息</h2>
			  <p style="color:red">请认真填写信息。</p>  --> 
			    
			    <div class="email">
				<strong style="color:red;font-size:20px;">￥${member.yue}</strong><br>
				<input type="text" name="yue" id="yue" class="" placeholder='充值金额' required oninvalid="setCustomValidity('充值金额不能为空')" oninput="setCustomValidity('');" pattern="[1-9]\d*">
			    </div><!-- .email -->
			     
			    <div class="submit">										
				<input type="submit" value="充值">
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
<script type="text/javascript">
function up(tt)
{
		    layer.open({
		      type: 2,
		      title: '上传文件',
		      shadeClose: true,
		      shade: false,
		      maxmin: true, //开启最大化最小化按钮
		      area: ['450px', '200px'],
		      content: 'upload.jsp?Result='+tt
		    });
}	

$("#affupass").blur(function(){
	if($("#affupass").val()!=$("#upass").val()){
		alert("确认密码输入错误");
		$("#affupass").val("");
	}
})

function checkUname(){
	var uname = $("#uname").val();
	$.ajax({
		type:"post",
		url:"checkUname.do?uname="+uname,
		date:'',
		success:function(msg){
			if(msg==1){
				alert("已存在的用户名");
				$("#uname").val("");
			}
		}
	})
}
</script>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
