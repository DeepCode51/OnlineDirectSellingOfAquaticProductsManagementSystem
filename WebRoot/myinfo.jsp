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
    
    <title>个人信息</title>
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
                    <h1 class="page_title">个人信息</h1>
                </header>
                    
                <article>
		
                    <div class="grid_6 registed_form">
			<form class="registed" action="memberinfoEidt.do" method="post" name="loginForm">
			<input type="hidden" name="id" value="${member.id}"/>
			  <!--   <h2>个人信息</h2>
			  <p style="color:red">请认真填写信息。</p>  --> 
			  
			    <div class="email" style="border:0px solid red;padding-left: 170px;">
				<img alt="" src="<%=path %>/upload/${member.filename}" style="width: 60px;height: 60px;border-radius:30px 30px;">
				<br>
				<br/>
			    </div><!-- .email -->
			    
			    
			     <div class="email">
				<strong>头像:</strong><sup>*</sup><br>
				<input name='filename' type='text' class="layui-input" value="${member.filename}"   style="width: 350px;" id='url'  size='50' value='' />&nbsp;<input type='button' value='上传'  class="layui-input" onClick="up('url')" style="width: 60px;height: 37px;border:1px solid #cccccc;background: white;border-radius:20px 20px;outline:none;"/>
			    </div><!-- .email -->
			    
			    <div class="email">
				<strong>帐号:</strong><sup>*</sup><br>
				<input type="text" name="uname" id="uname" class="" value="${member.uname}" disabled="disabled"  required oninvalid="setCustomValidity('帐号不能为空')" oninput="setCustomValidity('');">
			    </div><!-- .email -->
			    
			    <div >
				<strong>密码:</strong><sup>*</sup><br>
				<input type="password" name="upass" class="" id="upass" value="${member.upass}" required oninvalid="setCustomValidity('密码不能为空')" oninput="setCustomValidity('');" style="width: 430px;height: 36px;border-radius:20px 20px;border: 1px solid #CCCCCC;outline:none;padding-left: 10px;">
			    </div><!-- .password -->
			    
			     <div style="margin-top: 12px;">
				<strong>确认密码:</strong><sup>*</sup><br>
				<input type="password" name="affupass" class=""  id="affupass" required oninvalid="setCustomValidity('确认密码不能为空')" oninput="setCustomValidity('');"  style="width: 430px;height: 36px;border-radius:20px 20px;border: 1px solid #CCCCCC;outline:none;padding-left: 10px;">
			    </div><!-- .password -->
			    
			    <div class="text" style="margin-top: 12px;">
				<strong>真实姓名:</strong><sup>*</sup><br>
				<input type="text" name="tname" class="" value="${member.tname}" required oninvalid="setCustomValidity('真实姓名不能为空')" oninput="setCustomValidity('');">
			    </div><!-- .email -->
			    
			    
			    <div class="text" style="margin-top: 12px;">
				<strong>联系电话:</strong><sup>*</sup><br>
				<input type="text" name="tel" class="" value="${member.tel}" required oninvalid="setCustomValidity('请输入11位数字或非法输入')" oninput="setCustomValidity('');" pattern="[1][3,4,5,7,8][0-9]{9}">
			    </div><!-- .email -->
			    
			    <div class="email" style="margin-top: 12px;">
				<strong>邮箱:</strong><sup>*</sup><br>
				<input type="email" name="email" class="" value="${member.email}" required >
			    </div><!-- .email -->
			    
			    <div class="textarea" style="margin-top: 12px;">
				<strong>个人签名:</strong><sup>*</sup><br>
				<textarea rows="" cols="" name="content" style="width: 430px;border-radius:20px 20px;outline:none;padding-left: 10px;" >${member.content}</textarea>
			    </div><!-- .email -->
			     
			     
			    <div class="submit">										
				<input type="submit" value="修改">
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

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
