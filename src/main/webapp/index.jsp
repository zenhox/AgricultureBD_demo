<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>全国农业市场信息大数据分析平台</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="images/yn.png"  />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link href="css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/nongye_price.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dialogbox.css" />
<link rel="stylesheet" type="text/css" href="css/datouwang.css" />
<style type="text/css">
		.dialog_p{
			width:100%;
			margin-top:16px;
			height:60px;
			text-align: center;
		}
		.dialog_p input{
			width:90%;
			line-height:25px;
		    padding: 8px 4px 8px 10px;
		    font-size:16px;
		     /* color: #003399; */
		     border: 1px #003399 solid;
		     color:#006699; 
		     border-bottom: #93bee2 1px solid;
		     border-left: #93bee2 1px solid;
		     border-right: #93bee2 1px solid;
		     border-top: #93bee2 1px solid;
		  /* 	background-color: #e8f4ff; */
		     cursor: hand;
		     font-style: normal ;
		}
		.dialog-btn{ height: auto;}
		.dialog-btn span{
			height:40px;
			line-height:40px;
			width:90%;
			font-size: 16px;
			font-weight: 500;
		} 
		
		.anchorBL{
			display: none;
		} 

		

	</style>
</head>
<body>
	<!----------------------------- 导航栏部分----------------------- -->
	<div id="type-dialogBox"></div>
	<div class="top_t">
		<div class="top_tittle">
			<div class="logo" style="font-size: 22px">
				<font color="white">全国农业市场信息大数据分析平台 </font>
			</div>
			<span style="display: none"> </span>
			<c:if test="${user!=null }">
				<div class="login_register" style="font-size: 12px">
					<a href="./user.do?method=quit">退出系统</a>
				</div>
			</c:if>
			<c:if test="${user==null }">
				<div class="login_register" style="font-size: 12px">
					<a href="javascript:" onclick="loginUser()">登录系统</a>
				</div>
			</c:if>
			
			<div class="nav">
				<ul>
					<li><a href="./home.do?method=index" class="nav_aclick">首页</a></li>
					<li><a href="./farm.do?method=control" >数据监控</a></li>
					<li><a href="./datePrice.jsp" >数据查询</a></li>
					<li><a href="./forecast.do?method=priceFore">价格预测</a></li>
					<li><a href="javascript:">企业地图</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	 <div class="main">
		<div class="main_center">
			<div class="price_1">
				<div id="fsD1" class="focus" >  
				    <div id="D1pic1" class="fPic">  
				        <div class="fcon">
				          <img src="images/1.jpg" />
				        </div>
				        <div class="fcon" >
						<img src="images/2.jpg"  />
				        </div>
				        <div class="fcon">
				         <img src="images/3.jpg"  />
				        </div>
				         
				          
				    </div>
				    <div class="fbg">  
				    <div class="D1fBt" id="D1fBt">  
				        <a href="javascript:void(0)" class=""></a>  
				        <a href="javascript:void(0)" class=""></a>
				        <a href="javascript:void(0)" class=""></a>  
				    </div>  
				    </div>  
				   
				</div>  
			</div>
			<div class="price_5">
				<div class="title">
					<br />
					<h2>
						<font color="black" size="4" ><b>全国农业市场信息分布</b>
						</font>
					</h2>
				</div>
				<div class="content">
					<div id="bMap" style="width: 1200px;height:626px;"></div>
				</div>
			</div>
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/radialIndicator.min.js"></script>
	<script type="text/javascript" src="js/jquery.dialogBox.js"></script>
	<script type="text/javascript" src="js/echarts.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
	<!--  -->
	<script type="text/javascript" src="js/koala.min.1.5.js"></script>
	<script type="text/javascript">
	
		Qfast.add('widgets', { path: "js/terminator2.2.min.js", type: "js", requires: ['fx'] });  
		Qfast(false, 'widgets', function () {
			K.tabs({
				id: 'fsD1',    
				conId: "D1pic1",  
				tabId:"D1fBt",  
				tabTn:"a",
				conCn: '.fcon',     
				auto: 1,   
				effect: 'fade',   
				eType: 'click', 
				pageBt:true,
				bns: ['.prev', '.next'],                       
				interval: 5000                
			}) 
		}) ;
		var html='<form action="" autocomplete="off"  ><p class="dialog_p"><input class="dialog_input" type="text" id="username" name="username" autocomplete="off" placeholder="用户名" required=""/></p>';
		html+='<p class="dialog_p"><input class="dialog_input" type="password" id="password" name="password" placeholder="密码" required="" autocomplete="off"/></p></form>';
		function loginUser(){
			$('#type-dialogBox').dialogBox({
				type: 'normal',  //three type:'normal'(default),'correct','error',
				width: 400,
				height: 280,
				hasMask: true,
				hasClose: true,
				confirmValue: "登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录",  //确定按钮文字内容
				confirm: function(){
					var pwd=$("#password").val();
					var username=$("#username").val();
					if(username.trim().length>0 && pwd.trim().length>0){
						login(username.trim(),pwd.trim());
					}else{
						alert("用户名或密码不能为空");
					}
				}, //点击确定后回调函数
				hasBtn: true,
				effect: 'fade', //动画效果：fade(默认),newspaper,fall,scaled,flip-horizontal,flip-vertical,sign,
				title: '<b style="font-size:18px;color:#fff;">登录系统</b>',
				content: html
			});
		}
		var url="${sessionUrl}";
		function login(username,pwd){
			if(url==""){
				url="./home.do?method=index";
			}
			$.ajax({
				type : "POST",
				url : "user.do",
				data : {
					method : "login",
					username : username,
					password : pwd
				},
				success : function(data) {
					if(data=="success"){
						window.location.href=url;
					}else{
						alert(data);
					}
				}
			});
		};
		
		
		var da = ${mapData};
	</script>
	<script type="text/javascript" src="js/example2.js"></script>
</body>
</html>