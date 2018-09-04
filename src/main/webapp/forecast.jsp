<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   	<title>全国农业市场信息大数据分析平台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="images/yn.png" />
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link rel="stylesheet" type="text/css" href="css/nongye_price.css" /> 
	<link href="css/sroll.css" rel="stylesheet" type="text/css">
	  <script src="./js/echarts.js"></script>
	<style type="text/css">
   		.read-head{width:90%; margin:0 auto;
   			background: #f0f0f0;
    border-top: 1px solid #d8d8d8;
    border-bottom: 1px solid #d8d8d8;
    padding: 10px 30px;
   		} 
   		.read-head h1{text-align: center; line-height: 50px;}
   		.read-content{  width:90%; margin:0 auto;  padding: 10px 30px; font-size: 14px; line-height: 24px;}
   		.read-content p{ margin-bottom: 10px;}
   		.bold{ font-weight: bold;}
   		#price-zhu{
			height:630px; width: 500px; margin-top:-40px; margin-right:5px;
					 float:right; z-index: 100;
		}
		#price-map{
			height:540px; width:650px; float:right; margin-left:-60px;
			
		}
    </style>  
  </head>
   
  <body>
  	<!----------------------------- 导航栏部分----------------------- -->
	<div class="top_t">
		<div class="top_tittle">
			<div class="logo" style="font-size: 22px">
				<font color="white">全国农业市场信息大数据分析平台 </font>
			</div>
			<span style="display: none"> </span>
			<div class="login_register" style="font-size: 12px">
				<a href="./user.do?method=quit">退出系统</a>
			</div>
			<div class="nav">
				<ul>
					<li><a href="./index.jsp">首页</a></li>
					<li><a href="./control.jsp" >数据监控</a></li>
					<li><a href="./contrast.jsp" >数据查询</a></li>
					<li><a href="./forecast.jsp" class="nav_aclick">价格预测</a></li>
					<li><a href="javascript:">企业地图</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!------------------------------- 结束 ----------------------------->
  	<div class="main">
		<div class="main_center">
			<div class="price_1">
				<div class="title">
					<br />
					<h2>
						<font color="black" size="4" ><b>价格预测</b>
						</font>
					</h2>
				</div>
				<div class="content">
					<%--放置所需要的价格预测界面--%>
						<div id="div1"></div>
						<div id="div2" style="margin-left:150px;">
							<label style="font-size:15px;">省份:</label>
							<select id="select_1" style="width: 160px;height:30px;">
								<option value=1 selected="selected" >请选择</option>
								<option value=2>新疆</option>
								<option value=3>江苏</option>
								<option value=4>江西</option>
								<option value=5>河北</option>
								<option value=6>河南</option>
								<option value=7>浙江</option>
								<option value=8>山东</option>
								<option value=9>山西</option>
								<option value=10>广东</option>
								<option value=11>广西</option>
								<option value=12>海南</option>
								<option value=13>湖北</option>
								<option value=14>湖南</option>
								<option value=15>甘肃</option>
								<option value=16>福建</option>
								<option value=17>贵州</option>
								<option value=18>辽宁</option>
								<option value=19>重庆</option>
								<option value=20>陕西</option>
								<option value=21>青海</option>
								<option value=22>黑龙江</option>
								<option value=23>上海</option>
								<option value=24>云南</option>
								<option value=25>内蒙古</option>
								<option value=26>北京</option>
								<option value=27>吉林</option>
								<option value=28>四川</option>
								<option value=29>天津</option>
								<option value=30>宁夏</option>
								<option value=31>安徽</option>

							</select>
							<label style="font-size:15px;">市场:</label>
							<select id="select_2" style="width: 240px;height:30px;">
								<option value=1 selected="selected">请选择</option>
							</select>
							<label style="font-size:15px;">品类:</label>
							<select id="select_3" style="width:160px;height:30px;">
								<option value=1 selected="selected">请选择</option>
							</select>
							<label style="font-size: 15px;">品名:</label>
							<select id="select_4" style="width:160px;height:30px;">
								<option value=1 selected="selected">请选择</option>
							</select>
						</div>
						<div id="main" style="width: 1200px;height:400px;"></div>
			    </div>
			</div>
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</div>

	<script>
        var myChart=echarts.init(document.getElementById('main'));
        myChart.setOption({
            title: { text: '价格预测'},
            tooltip: {},
            toolbox:{show : true, feature : { mark : {show: true},
                    dataView : {show: true, readOnly: false}, magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true}, saveAsImage : {show: true}}},
            legend: {data:['历史价格','预测价格']},
            xAxis: { data: []},
            yAxis: {type : 'value',name:'/元'},
            calculable : true,
            dataZoom:[{type:'inside',start:10,end:60},{type:'slider',start:10,end:60}],
            series: [{
                name:'历史价格',
                type:'line',
                stack: '总量',
                symbol: 'none',
                emphasis : {
                    label : {show: true}},
                itemStyle : {
                },
                data:[]
            },
                {
                    name:'预测价格',
                    type:'line',
                    stack: '总量',
                    smooth: true,
                    emphasis : {
                        label : {show: true}},
                    itemStyle : {
                    },
                    data:[
                    ]
                },]

        });

        window.onload = function(){
            var province=null;
            var market=null;
            var type=null;
            var name=null;

            function getMarket(){
                province = $("#select_1").find("option:selected").text();
                $.ajax({
                    type:"GET",
                    url:"http://localhost:8080/agriculture/getMarket",
                    contentType:"UTF-8",
                    data:{
                        province:province
                    },
                    success:function (data) {
                        data=data.substring(1,data.length-1);
                        var arrayData = data.split(",");
                        console.log(arrayData)
                        console.log(arrayData[0])
                        $("#select_2").html('<option value=1 selected="selected">请选择</option>');
                        $("#select_3").html('<option value=1 selected="selected">请选择</option>');
                        $("#select_4").html('<option value=1 selected="selected">请选择</option>');
                        for (var i = 0; i < arrayData.length; i++) {
                            var tempOpt = document.createElement('option');
                            $(tempOpt).attr('value',i+2);
                            $(tempOpt).text(arrayData[i]);
                            $("#select_2").append(tempOpt);
                        }
                    }
                })
            }
            function getType(){
                market = $("#select_2").find("option:selected").text();
                $.ajax({
                    type:"GET",
                    url:"http://localhost:8080/agriculture/getType",
                    data:{
                        province:province,
                        market:market
                    },
                    success:function (data) {
                        $("#select_3").html('<option value=1 selected="selected">请选择</option>');
                        $("#select_4").html('<option value=1 selected="selected">请选择</option>');
                        data=data.substring(1,data.length-1);
                        var arrayData = data.split(",");
                        console.log(arrayData.length)
                        console.log(arrayData[0])
                        for (var i = 0; i < arrayData.length; i++) {
                            var tempOpt = document.createElement('option');
                            $(tempOpt).attr('value',i+2);
                            $(tempOpt).text(arrayData[i]);
                            $("#select_3").append(tempOpt);
                        }
                    }
                })
            }
            function getName(){
                type = $("#select_3").find("option:selected").text();
                $.ajax({
                    type:"GET",
                    url:"http://localhost:8080/agriculture/getName",
                    data:{
                        province:province,
                        market:market,
                        type:type
                    },
                    success:function (data) {
                        $("#select_4").html('<option value=1 selected="selected">请选择</option>');
                        data=data.substring(1,data.length-1);
                        var arrayData = data.split(",");
                        console.log(arrayData.length)
                        console.log(arrayData[0])
                        for (var i = 0; i < arrayData.length; i++) {
                            var tempOpt = document.createElement('option');
                            $(tempOpt).attr('value',i+2);
                            $(tempOpt).text(arrayData[i])
                            $("#select_4").append(tempOpt);
                        }
                    }
                })
            }
            function getGraph(){
                var priceHistory=[];
                var forcast_data=[];
                name = $("#select_4").find("option:selected").text();
                console.log("价格预测界面绘图函数"+province+market+type+name);

                //请求历史价格
                $.ajax({
					async: false,
					type: "GET",
					url:"http://localhost:8080/agriculture/datePrice/"+province+"/"+market+"/"+type+"/"+name+".do",
                    success:function(result) {
					    console.log("********请求历史价格")
                        result = eval("("+result+")");
                        console.log(result.date.length);
                        console.log(result);
                        if (result.date.length>=30){
                            //历史数据超过30条
                            for(var i=result.date.length-30;i<result.date.length;i++)
                            {
                                priceHistory[i-result.date.length+30]=result.price[i];
                            }
                            for(var i=30;i<37;i++)
                            {
                                priceHistory[i]="-";
                            }
						}else{
                            //历史数据不足30条
                            for(var i=0;i<result.date.length;i++)
                            {
                                priceHistory[i]=result.price[i];
                            }
                            for(var i=result.date.length;i<result.date.length+7;i++)
                            {
                                priceHistory[i]="-";
                            }
						}
                        console.log(priceHistory);
                    },error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert("选项有误，请检查选项是否有问题或与系统管理员联系");
                    }
                });

                //请求预测数据
                $.ajax({
                    async: false,
                    type:"GET",
                    url:"http://localhost:8080/agriculture/getForecastPrice.do",
                    data:{
                        province:province,
                        market:market,
                        type:type,
                        name:name,
                    },
                    success:function (result2) {
                        console.log("********请求预测价格")
                        console.log(result2);
                        console.log(result2.date);
                        result2 = eval("("+result2+")");
                        forcast_data=result2;
                    }
                });
                //返回结果转json
                //forcast_data = eval("("+forcast_data+")");
                //数据请求完成，设置Echart图表
                myChart.setOption({
                    xAxis:{data: forcast_data.date},
                    yAxis: {
                        type: 'value'
                    },
                    series:[
                        {name:'历史价格',data:priceHistory},
						{name:'预测价格',data:forcast_data.price}
						]
                });
            }

            //获取json长度
            function getJsonLength(json){
                var jsonLength=0;
                for (var i in json) {
                    jsonLength++;
                }
                return jsonLength;
            }

            $("#select_1").change(getMarket);
            $("#select_2").change(getType);
            $("#select_3").change(getName);
            $("#select_4").change(getGraph);
        }
	</script>
    <script type="text/javascript" src="js/jquery.min.js"></script> 
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/echarts.js"></script>
  </body>
</html>
