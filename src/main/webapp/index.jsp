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
	<link rel="stylesheet" type="text/css" href="css/buttonstyle.css" />
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
<div id="type-dialogBox">  </div>
<div class="top_t">
	<div class="top_tittle">
		<div class="logo" style="font-size: 22px">
			<font color="white">全国农业市场信息大数据分析平台 </font>
		</div>
		<span style="display: none"> </span>

		<div class="nav">
			<ul class ="menus">
				<li><a href="./index.jsp">首页</a></li>
				<li><a href="./control.jsp" >数据监控</a></li>
				<li><a href="./contrast.jsp" >数据查询</a></li>
				<li><a href="./forecast.jsp">价格预测</a></li>
				<li><a href="./EnterpriseMap.jsp">企业地图</a></li>

			</ul>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/radialIndicator.min.js"></script>
<script type="text/javascript" src="js/jquery.dialogBox.js"></script>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/animalbuttoncolor.js"></script>
<!--  -->
<script type="text/javascript" src="js/koala.min.1.5.js"></script>
<script type="text/javascript">
    <%--var da = ${mapData};--%>
</script>
<div class="main">

	<div class="main_center">
		<jsp:include page="foto.jsp"></jsp:include><%--新页面导入--%>
		<div class="price_5">
			<div class="content">
				<div id="bMap" style="width: 1200px;height:626px;"></div>
			</div>
		</div>
		<jsp:include page="bottom.jsp"></jsp:include>
	</div>
</div>
<script type="text/javascript">



    // 设置地图显示的城市 此项是必须设置的

</script>
<%--客服--%>
<style type="text/css">
	*{margin:0;padding:0;list-style-type:none;}
	a,img{border:0;}

	/* suspend */
	.suspend{width:40px;height:198px;position:fixed;top:200px;right:0;overflow:hidden;z-index:9999;}/*客服标签*/
	.suspend dl{width:120px;height:198px;border-radius:25px 0 0 25px;padding-left:40px;box-shadow:0 0 5px #e4e8ec;}
	.suspend dl dt{width:40px;height:198px;background:url(images/suspend.png);position:absolute;top:0;left:0;cursor:pointer;}
	.suspend dl dd.suspendQQ{width:120px;height:85px;background:#ffffff;}
	.suspend dl dd.suspendQQ a{width:120px;height:85px;display:block;background:url(images/suspend.png) -40px 0;overflow:hidden;}
	.suspend dl dd.suspendTel{width:120px;height:112px;background:#ffffff;border-top:1px solid #e4e8ec;}
	.suspend dl dd.suspendTel a{width:120px;height:112px;display:block;background:url(images/suspend.png) -40px -86px;overflow:hidden;}
</style>

<div class="suspend">
	<dl>
		<dt class="IE6PNG"></dt>
		<dd class="suspendQQ"><a href="http://shang.qq.com/wpa/qunwpa?idkey=cb91b633f1db596a948828f4f333dbb7394ceda014c958cf" target="_blank"></a></dd>
		<dd class="suspendTel"><a href="javascript:void(0);"></a></dd>
	</dl>
</div><%--客服链接--%>

<script type="text/javascript">
    $(document).ready(function(){

        $(".suspend").mouseover(function() {
            $(this).stop();
            $(this).animate({width: 160}, 400);
        })

        $(".suspend").mouseout(function() {
            $(this).stop();
            $(this).animate({width: 40}, 400);
        });
    });
</script><%--客服脚本--%>

</body>
</html>