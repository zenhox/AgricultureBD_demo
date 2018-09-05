<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>jQuery响应式宽屏图片3D旋转切换特效</title>

	<link rel="stylesheet" href="css/mainPagestyle.css">
	<style>
		.optionsArea{background-color: #ccc;width:650px;padding:2px 10px;margin-bottom: 10px;}
		p{margin-top:5px;margin-bottom: 5px;}
	</style>

</head>
<body><script src="/demos/googlegg.js"></script>

<%--<h2>jQuery宽屏3D旋转切换图片代码</h2>

<div class='optionsArea'>
	<p>this.defaults = {</p>
	<p>     imgArr          : [] ,    &nbsp;&nbsp;&nbsp;//存放图片url数组</p>
	<p>     bgSwitchType    : "fade" ,&nbsp;&nbsp;&nbsp;//背景图切换方式（fade or slide） </p>
	<p>     switchDirection : "top" , &nbsp;&nbsp;&nbsp;//slide切换方式下的方向（top / bottom / left / right）</p>
	<p>     speed           : 500 ,   &nbsp;&nbsp;&nbsp;//切换的速度</p>
	<p>     defaultHeight   : 425 ,   &nbsp;&nbsp;&nbsp;//默认的整体的高度</p>
	<p> };</p>
</div>--%>
<%--

<br /><br /><br /><br /><br />
--%>

<div class='rotateBanner'></div>

<script src="js/jquery.min.js"></script>
<script src="js/mainBanner.js"></script>
<script>

    var arr={imgArr:["images/1.jpg","images/2.jpg","images/3.jpg","images/4.jpg","images/5.jpg","images/6.jpg","images/7.jpg","images/8.jpg"]};
    $(".rotateBanner").rotateBanner(arr);
</script>
<%--<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
	<p>适用浏览器：360、FireFox、Chrome、Opera、傲游、搜狗、世界之窗. 不支持Safari、IE8及以下浏览器。</p>
	<p>来源：<a href="http://www.lanrenzhijia.com/" target="_blank">懒人素材</a></p>
</div>--%>
</body>
</html>