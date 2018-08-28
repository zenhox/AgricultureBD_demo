<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<link href="css/tab.css" rel="stylesheet" type="text/css">
	
	<style type="text/css">
		#se {
			position: absolute;
			top: 220px;
			margin: 20px auto 0px;
			width: 800px;
			height: 250px;
			left: 122px;
		}
		#highcharts-8{
			top:40px;
		}
	
		.content h3{
			margin-left:30px;
			margin-top:60px;
		}
		#price-zhu{
			height:640px; width: 340px; margin-left:-30px;margin-top:-60px;
					 float:left; z-index: 100;
		}
		#price-map{
			height:560px; width: 950px; float:left;
			margin-left:-60px;
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
					<li><a href="./home.do?method=index">首页</a></li>
					<li><a href="./farm.do?method=control" >数据监控</a></li>
					<li><a href="./farm.do?method=contrast" class="nav_aclick">数据查询</a></li>
					<li><a href="./forecast.do?method=priceFore">价格预测</a></li>
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
					<!-- <br />
					<h2>
						<font color="black" size="4" ><b>区域行情</b>
						</font>
					</h2> -->
					<div id="box">  
				     <ul id="tab">  
				         <li class="three on" id="tab_1" onClick="switchTab(this,0)">区域行情</li>  
				         <li class="three" id="tab_2" onClick="switchTab(this,1)">品种对比</li>  
				         <li class="three" id="tab_3" onClick="switchTab(this,2)">数据查询</li> 
				         <!-- <li class="three" id="tab_4" onClick="switchTab(this,3)" style="margin:0;">价格走势</li>   -->
				     </ul>
				   </div> 
				</div>
				<div class="content box_content_block">
					<div class="search">
						<select name="selt" style="height:30px; width:150px;" id="seltType" onchange="changeType(this)">
							<option value="">产品种类</option>
							<c:forEach items="${dynaList }" var="d">
								<option value="${d}">${d }</option>
							</c:forEach>
						</select>
						<select name="seltName" style="height:30px; width:150px;" id="seltName" onchange="changeTypeName(this)">
							<option value="">品种</option>
							<%-- <c:forEach items="${dynaList }" var="d">
								<option value="${d}">${d }</option>
							</c:forEach> --%>
						</select>
					</div>
					<div id="price-zhu"  >
					</div>
					<div id="price-map"  >
					</div>
					
				</div>
				<div class="content box_content_hidden">
					<div class="search">
							<select name="province" id="province" style="width: 160px;height:30px;"
								onchange="getMarket(this);" tabindex="2" id="province">
								<option value="">省份</option>
								<c:forEach items="${proList }" var="f">
									<option value="${f }">${f }</option>
								</c:forEach>
							</select> 
							<select name="country" id="market" style="width: 240px;height:30px;"
								onchange="getType(this);" tabindex="2" id="market">
								<option value="">批发市场</option>
							</select> 
							<select name="type" style="width:160px;height:30px;"
								id="typeMarket" tabindex="2">
								<option value="">产品种类</option>
							</select> <input type="button" value="开始查询" class="search_btn" id="startQuery" onclick="compareType(this)"
								  />
					</div>
					<div id="container" style="height:570px;width:1200px;" >
					
					</div>
				</div>
				
				<div class="content box_content_hidden" >
					<div class="search">
						<div class="fields">
							<form id="exportForm" method="post">
								<select name="province2" id="province2" style="width: 160px;height:30px;"
								onchange="getMarket2(this);" tabindex="2" id="province2">
									<option value="">省份</option>
									<c:forEach items="${proList }" var="f">
										<option value="${f }">${f }</option>
									</c:forEach>
								</select> 
								<select name="market2" style="width: 240px;height:30px;"
									onchange="getType2(this);" tabindex="2" id="market2">
									<option value="">批发市场</option>
									<c:forEach items="${marketList }" var="f">
									<option value="${f }">${f }</option>
								</c:forEach>
								</select> <select name="type" style="width:160px;height:30px;"
									id="typeMarket2" onchange="getName(this)" tabindex="2">
									<option value="">产品种类</option>
								</select> <select name="name" style="width:160px;height:30px;"
									id="nameMarket2" tabindex="2">
									<option value="">品种</option>
								</select> 
								<input type="button" value="开始查询" id="startQuery2" onclick="pieQuery(this)" class="search_btn"  />
								<input type="button" value="数据导出"  class="search_btn" onclick="exportFarm()" />
							</form>
						</div>
					</div>
					<div id="container2" style="min-width:600px;height:300px"></div>
					﻿
					<div id="sliders"
						style="min-width:310px;max-width: 800px;margin: 0 auto;">
						<table>
							<tr>
								<td>纬度</td>
								<td><input id="R0" type="range" min="0" max="45" value="15" />
									<span id="R0-value" class="value"></span></td>
							</tr>
							<tr>
								<td>经度</td>
								<td><input id="R1" type="range" min="0" max="45" value="15" />
									<span id="R1-value" class="value"></span></td>
							</tr>
						</table>
					</div>
					<!-- -------------排行榜---------------  -->
				    <div class="Top_Record">
						<div class="topRec_List">
							<dl>
								<dd>品种名称</dd>
								<dd>均价(元/千克)</dd>
								<dd>批发市场名称</dd>
								<dd>时间</dd>
							</dl>
							<div class="maquee" >
								<ul id="maqueeUl">
									
								</ul>
							</div>
						</div>
					</div> 
				
				
				</div>
		
				
				
			<!-- 	<div class="content box_content_hidden">
					<div class="search">
							<select name="year" id="year" style="width: 80px;height:30px;" tabindex="2" >
								<option value="">年份</option>
								<option value="2010">2010年</option><option value="2011">2011年</option><option value="2012">2012年</option>
								<option value="2013">2013年</option><option value="2014">2014年</option>
								<option value="2015" selected="selected">2015年</option>
								<option value="2016" >2016年</option>
							</select> 
							<select name="month" id="month" style="width: 60px;height:30px;">
								<option value="">月份</option>
								<option value="1" selected="selected">1月</option><option value="2">2月</option><option value="3">3月</option>
								<option value="4">4月</option><option value="5">5月</option><option value="6">6月</option>
								<option value="7">7月</option><option value="8">8月</option><option value="9">9月</option>
								<option value="10">10月</option><option value="11">11月</option><option value="12">12月</option>
							</select> 
							<select name="ttName" style="width:140px;height:30px;"
								id="ttName" tabindex="2">
								<option value="">品种</option>
								<option value="土豆" selected="selected">土豆</option><option value="番茄">番茄</option>
								<option value="豌豆">豌豆</option>
							</select> 
							<input type="button" value="开始查询" class="search_btn"  onclick="lineReq()"
								  />
							
					</div>
					<div id="lineDa" style="height:570px;width:1200px;" >
					</div>
				</div>
		
			</div> -->
			
			<%-- <div class="price_2">
				<div class="title">
					<br />
					<h2>
						<font color="black" size="4" ><b>品种对比</b>
						</font>
					</h2>
				</div>
				<div class="content">
					<div class="search">
							<select name="country" id="market" style="width: 240px;height:30px;"
								onchange="getType(this);" tabindex="2" id="market">
								<option value="">批发市场</option>
								<c:forEach items="${marketList }" var="f">
									<option value="${f }">${f }</option>
								</c:forEach>
							</select> 
							<select name="type" style="width:160px;height:30px;"
								id="typeMarket" tabindex="2">
								<option value="">产品种类</option>
							</select> <input type="button" value="开始查询" class="search_btn" id="startQuery" onclick="compareType(this)"
								  />
					</div>
					<div id="container" style="height:400px;width:1200px;" >
					
					</div>
				</div>
			</div> --%>
			
			<!-- -------------当天数据查询监控---------------  -->
			<%-- <div class="price_6">
				<div class="title">
					<br />
					<h2>
						<font color="black" size="4"><b>数据查询</b>
						</font>
					</h2>
				</div>
				<div class="content">
					<div class="search">
						<div class="fields">
							<form id="exportForm" method="post">
								<select name="market" style="width: 240px;height:30px;"
									onchange="getType2(this);" tabindex="2" id="market2">
									<option value="">批发市场</option>
									<c:forEach items="${marketList }" var="f">
									<option value="${f }">${f }</option>
								</c:forEach>
								</select> <select name="type" style="width:160px;height:30px;"
									id="typeMarket2" onchange="getName(this)" tabindex="2">
									<option value="">产品种类</option>
								</select> <select name="name" style="width:160px;height:30px;"
									id="nameMarket2" tabindex="2">
									<option value="">品种</option>
								</select> 
								<input type="button" value="开始查询" id="startQuery2" onclick="pieQuery(this)" class="search_btn"  />
								<input type="button" value="数据导出"  class="search_btn" onclick="exportFarm()" />
							</form>
						</div>
					</div>
					<div id="container2" style="min-width:600px;height:350px"></div>
					﻿
					<div id="sliders"
						style="min-width:310px;max-width: 800px;margin: 0 auto;">
						<table>
							<tr>
								<td>纬度</td>
								<td><input id="R0" type="range" min="0" max="45" value="15" />
									<span id="R0-value" class="value"></span></td>
							</tr>
							<tr>
								<td>经度</td>
								<td><input id="R1" type="range" min="0" max="45" value="15" />
									<span id="R1-value" class="value"></span></td>
							</tr>
						</table>
					</div>
					<!-- -------------排行榜---------------  -->
				    <div class="Top_Record">
						<div class="topRec_List">
							<dl>
								<dd>品种名称</dd>
								<dd>均价(元/千克)</dd>
								<dd>批发市场名称</dd>
								<dd>时间</dd>
							</dl>
							<div class="maquee" >
								<ul id="maqueeUl">
									
								</ul>
							</div>
						</div>
					</div> 
				
				
				</div>
			</div> --%>
			
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script> 
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/echarts.js"></script>
	<script type="text/javascript" src="js/highcharts-3d.js"></script> 
	<script type="text/javascript">
		
		function autoScroll(obj) {
			$(".maquee").find("ul").animate({
				marginTop : "-39px"
			}, 500, function() {
				$(this).css({
					marginTop : "0px"
				}).find("li:first").appendTo(this);
			});
			$(".apple").find("ul").animate({
				marginTop : "-39px"
			}, 500, function() {
				$(this).css({
					marginTop : "0px"
				}).find("li:first").appendTo(this);
			});
		}

		// Step:3 conifg ECharts's path, link to echarts.js from current page.
	    // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
	    require.config({
	        paths: {
	            echarts: './js'
	        }
	    });
	    
	    /**
	    地图加载
	    */
	    function opt(name,obj,max,min){
		    // Step:4 require echarts and use it in the callback.
		    // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
		    require(
		        [
		            'echarts',
		            'echarts/chart/bar',
		            'echarts/chart/map'
		        ],
		        function (ec) {
		        	 // --- 地图 ---
		            var myChart2 = ec.init(document.getElementById('price-map'));
		            myChart2.setOption(mapOption(name,obj,max,min)); 
		            var myChart3 = ec.init(document.getElementById('price-zhu'));
		            myChart3.setOption(zhuOption(name,obj,max,min));
		        }
		    );
	    }
	    /**
	    * 地图参数
	    */
	    function mapOption(name,obj,max,min){
	    	if(name==undefined){
	    		obj="[]";
	    		name="";
	    		max=10;
	    		min=0;
	    	}
	    	var opt = {
	    			backgroundColor: 'rgba(0, 5, 0, 0)', 
    				/* color: ['gold','aqua','lime'],  */
	                title : {
				        text: name,
				        subtext: '单位:元/千克',
				        x:'center'
				    },
				    tooltip : {
				        trigger: 'item'
				    },
				    /* legend: {
				        orient: 'vertical',
				        x:'left',
				        data:[name]
				        
				    }, */
				    dataRange: {
				        min: min,
				        max: max,
				        x: 'left',
				        y: 'bottom',
				        /* color: ['rgba(0, 0, 0, 0)', 'orange', 'yellow','lime','blue'], */
				        text:['高','低'],           // 文本，默认为数值文本
				        calculable : true
				    },
				    toolbox: {
				        show: true,
				        orient : 'vertical',
				        x: 'right',
				        y: 'center',
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    roamController: {
				        show: true,
				        x: 'right',
				        mapTypeControl: {
				            'china': true
				        }
				    },
	                series : [
	                    {
	                        name: name,
	                        type: 'map',
	                        mapType: 'china',
	                        /* selectedMode : 'multiple',  */
	                        selectedMode:'single',
	                        roam : false,
	                        itemStyle:{
	                            normal:{label:{show:true,
	                            	formatter : function(a, b) {
	                            		if(b=="-"){
	                            			return a;
	                            		}else{
	                            		//	return a+":"+b;
	                            			return a;
	                            		}
	                            		
		
									}
	                            }},
	                            emphasis:{label:{show:true}}
	                        },
	                        data:obj
	                    }
	                ]
	            };
	        return opt;
	    }
	    
	    /**
	    * 柱状图参数
	    */
	    function zhuOption(name,obj,max,min){
	    	if(name==undefined){
	    		obj="[]";
	    		name="";
	    		max=10;
	    		min=0;
	    	}
	    	var yData = [];
	    	var xData = [];
	    	for ( var number = obj.length-1; number >=0; number--) {
				yData.push(obj[number].name);
				xData.push(obj[number].value);
			}
			var color_data = [ '#0472DE', '#0f66CF','#1382E2', '#1F82E2', '#3993E6','#3792E5',
			'#4198E7','#499DE8','#51A2E9','#5CAAEB','#62AEEC','#6AB3ED','#72B8EE','#7ABDF0',
			'#81C1F1','#8AC8F2','#91CCF3','#98CFF4','#A1D6F5','#A8D9F6','#B2E1F8','#B9E6F9' ];
			var i=color_data.length;
	    	var opt = {
	    			tooltip : {
						trigger : 'axis',
						axisPointer : {
							type : 'shadow'
						}
					},
					xAxis : [ {
						type : 'value',
						splitLine : {
							show : false
						},
						axisLabel : {
							show : false
						},
						axisLine : {
							lineStyle : {
								width : 0,
							}
						}
					} ],
					yAxis : [ {
						type : 'category',
						splitLine : {
							show : false
						},
						axisTick : {
							show : false
						},
						data : yData
					} ],
					grid : {
						borderColor : '#ffffff'
					},
	                series : [ {
						name : name,
						type : 'bar',
						stack : name,
						itemStyle : {
							normal : {
								label : {
									show : true ,
									formatter : function(a, b, c) {
										/* var sum = 0;
										for ( var i = 0; i < opt.series[0].data.length; i++) {
											sum += opt.series[0].data[i];
										}
										alert(a.value);
										var dot = (a / sum) * 100 + '';
										var vl = dot.substring(0, dot.lastIndexOf("."));
										// return sum
										var re = c + ' ' + "(" + vl + "%)"; */
										return a.value;
									}
								} ,
								color : (function(){
									i--;
									return color_data[i];
								})
							}
						}, 
						data : xData
					} ]
	            };
	        return opt;
	    } 
	    
	    
	    /**
	    	改变品类
	    */
	    function changeType(obj){
	    	var tname = $(obj).val();
	    	$("#seltName").empty();
	    	$("#seltName").append("<option value=''>品种</option>");
	    	if(tname.length>0){
		    	$.ajax({
					type : "POST",
					async : false, //同步执行
					url : "farm.do",
					data : {
						method : "mapClass",
						type : tname
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						for(var i=0;i<data.length;i++){
							$("#seltName").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
						}
					}
				});
	    	}
	    }
	    /**
	    	改变种类
	    */
	    function changeTypeName(obj){
	    	var typeName ="蔬菜";
	    	var tname = "土豆";
	    	if(obj!=undefined){
		    	typeName = $("#seltType").val();
		    	tname = $("#seltName").val();
	    	}
	    	if(tname.length>0){
		    	$.ajax({
					type : "POST",
					async : false, //同步执行
					url : "farm.do",
					data : {
						method : "mapAvg",
						tname : tname,
						typeName : typeName
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						opt(tname,data.maList,data.max,data.min);
					}
				});
	    	}
	    } 
	    
	    /** 批发市场
				*/
		function getMarket(obj) {
			var name = obj.value;
			$("#market").empty();
			$("#market").append(
					"<option value=''>批发市场</option>");
			$("#typeMarket").empty();
			$("#typeMarket").append(
					"<option value=''>产品种类</option>");
			if(name.length>0){
				$.ajax({
					type : "POST",
					async : true, //同步执行
					url : "farm.do",
					data : {
						method : "queryMarket",
						province : name
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						for ( var i = 0; i < data.length; i++) {
							$("#market").append(
									"<option value='"+data[i]+"' >" + data[i]
											+ "</option>");
						}
					}
				});
			}
			
		}
		
		/** 批发市场
				*/
		function getMarket2(obj) {
			var name = obj.value;
			$("#market2").empty();
			$("#market2").append(
					"<option value=''>批发市场</option>");
			$("#typeMarket2").empty();
			$("#typeMarket2").append(
					"<option value=''>产品种类</option>");
			$("#nameMarket2").empty();
			$("#nameMarket2").append(
					"<option value=''>品种</option>");
			if(name.length>0){
				$.ajax({
					type : "POST",
					async : true, //同步执行
					url : "farm.do",
					data : {
						method : "queryMarket",
						province : name
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						for ( var i = 0; i < data.length; i++) {
							$("#market2").append(
									"<option value='"+data[i]+"' >" + data[i]
											+ "</option>");
						}
					}
				});
			}
			
		}
	    	
	    /** 查找品类
				*/
		function getType(obj) {
			var name = obj.value;
			$("#typeMarket").empty();
			$("#typeMarket").append(
					"<option value=''>产品种类</option>");
			if(name.length>0){
				$.ajax({
					type : "POST",
					async : false, //同步执行
					url : "farm.do",
					data : {
						method : "queryType",
						market : name
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						for ( var i = 0; i < data.length; i++) {
							$("#typeMarket").append(
									"<option value='"+data[i]+"' >" + data[i]
											+ "</option>");
						}
					}
				});
			}
		}
		 /** 查找品类2
				*/
		function getType2(obj) {
			var name = obj.value;
			$("#typeMarket2").empty();
			$("#typeMarket2").append(
					"<option value=''>产品种类</option>");
			$("#nameMarket2").empty();
			$("#nameMarket2").append(
					"<option value=''>品种</option>");
			if(name.length>0){
				$.ajax({
					type : "POST",
					async : false, //同步执行
					url : "farm.do",
					data : {
						method : "queryType",
						market : name
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						for ( var i = 0; i < data.length; i++) {
							$("#typeMarket2").append(
									"<option value='"+data[i]+"' >" + data[i]
											+ "</option>");
						}
					}
				});
			}
		}
		
		 /** 查找品
				*/
		function getName(obj) {
			var name = obj.value;
			$("#nameMarket2").empty();
			$("#nameMarket2").append(
					"<option value=''>品种</option>");
			if(name.length>0){
				$.ajax({
					type : "POST",
					async : false, //同步执行
					url : "farm.do",
					data : {
						method : "queryName",
						market : $("#market2").val(),
						type : name
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						for ( var i = 0; i < data.length; i++) {
							$("#nameMarket2").append(
									"<option value='"+data[i]+"' >" + data[i]
											+ "</option>");
						}
					}
				});
			}
		}
		/**
		* 折线参数
		*/
		function lineOption(data){
			var option = {
		        chart: {
		            type: 'spline'
		        },
		        title: {
		            text: ""
		        },
		        subtitle: {
		            text: null
		        },
		        xAxis: {
		            categories: data.dateList
		        },
		        yAxis: {
		            title: {
		                text: '价格 (元)'
		            }
		        },
		       
		        tooltip: {
		            formatter: function() {
		                    return '<b>'+ this.series.name +'</b><br/>'+
		                     this.x +': '+ this.y +'元/千克 ';
		            }
		        },
		        plotOptions: {
		            line: {
		                dataLabels: {
		                    enabled: true
		                },
		                enableMouseTracking: false
		            }
		        },
		        series:data.ctList
		    };
		    return option;
		}
		/**
		*  数据查询  柱状图参数
		*/
		function chartOption(data,c){
			var opt = {
				chart : {
					renderTo : 'container2',
					type : 'column',
					margin : 75,
					options3d : {
						enabled : true,
						alpha : 15,
						beta : 15,
						depth : 50,
						viewDistance : 25
					},
					width : 1200,
					hight : 400
				},
				title : {
					text : null
				},
				plotOptions : {
					column : {
						depth : 25
					}
				},
				tooltip:{
					valueSuffix: '元/千克'
				},
				xAxis : [{
		        	categories: data.dateList
		        }],
				series : [ {
					name : c,
					data : data.priceList
				} ]
			};
			return opt;
		}
		var charter;
		/** 
				折线图
			*/
		function compareType(obj){
			var market;
			var typeMarket;
			if(obj==undefined){
				/* market = "北京朝阳区大洋路农副产品交易中心";
				typeMarket = "蔬菜"; */
				market = "昆明市斗南花卉鲜花批发交易市场";
				typeMarket = "玫瑰花";
			}else{
				market= $("#market").val();
				typeMarket = $("#typeMarket").val();
			}
			if(market.length>0 && typeMarket.length>0){
				$.ajax({
					type : "POST",
					async : false, //同步执行
					url : "farm.do",
					data : {
						method : "compare",
						market : market,
						type : typeMarket
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						if(data.dateList.length>0){
							$("#container").highcharts(lineOption(data));
						}else{
							alert("该市场最近五天内暂无数据更新！！");
						}
						
					}
				});
			}
			
		}
		/**
			*	数据查询
			*/
		function pieQuery(obj){
			var market;
			var typeMarket;
			var name;
			if(obj==undefined){
				/* market = "北京朝阳区大洋路农副产品交易中心";
				typeMarket = "蔬菜";
				name = "大蒜"; */
				market = "昆明市斗南花卉鲜花批发交易市场";
				typeMarket = "玫瑰花";
				name = "假日公主";
			}else{
				market = $("#market2").val();
				typeMarket = $("#typeMarket2").val();
				name = $("#nameMarket2").val();
			}
			if(market.length>0 && typeMarket.length>0 && name.length>0){
				$.ajax({
					type : "POST",
					async : false, //同步执行
					url : "farm.do",
					data : {
						method : "queryData",
						market : market,
						type : typeMarket,
						name : name
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						charter = new Highcharts.Chart(chartOption(data,name));
						showValues();
						$("#maqueeUl").empty();
						for(var i=0;i<data.farmList.length;i++){
							var html = "<li><div>"+data.farmList[i].name+"</div>";
							html += "<div>"+data.farmList[i].avgPrice+"</div>";
							html += "<div>"+data.farmList[i].market+"</div>";
							html += "<div>"+data.farmList[i].timeStr+"</div></li>";
							$("#maqueeUl").append(html);
						}
					}
				});
			}
		
		}
		function showValues() {
			$('#R0-value').html(charter.options.chart.options3d.alpha);
			$('#R1-value').html(charter.options.chart.options3d.beta);
		}
		/**
		* 导出当天数据
		*/
		function exportFarm(){
			var market;
			var typeMarket;
			market = $("#market2").val();
			typeMarket = $("#typeMarket2").val();
			if(market.length>0 && typeMarket.length>0){
				$("#exportForm").attr("action","./export.do?method=exportFarm");
				$("#exportForm").submit();
			}else{
				alert("请选择批发市场和产品种类！！");
			}
			/* window.location.href="./export.do?market="+market+"&type="+typeMarket;  */
			 /* $.ajax({
				type : "GET",
				async : false, //同步执行
				url : "./export.do?method=exportFarm",
				data : {
					market : market,
					type : typeMarket,
				},
				success : function(data) {
					alert(data);
				}
			});  */
		};
		
		/**价格分析参数
		*/
		function lineOpt(data,name){
			var opt = {                                          
		        chart: {                                                          
		        },                                                                
		        title: {                                                          
		            //text:name 
		            text:null                                    
		        },                                                                
		        xAxis: {                                                          
		            categories: data.daList
		        },  
		        yAxis: {
		            title: {
		                text: '价格 (元)'
		            }
		        },                                                              
		        tooltip: {                                                        
		            formatter: function() {                                       
		                var s;                                                    
		                if (this.point.name) { // the pie chart                   
		                    s = ''+                                               
		                        this.point.name +': '+ this.y +' fruits';         
		                } else {                                                  
		                    /* s = ''+                                               
		                        this.x  +': '+ this.y;  */
	                        s =  this.y + '元/千克';                           
		                }     
		                return s;                                                 
		            }                                                             
		        },                                                                
		        series: [{                                                        
		            type: 'column',                                               
		            name: '最小值',                                                 
		            data: data.minList                                       
		        }, {                                                              
		            type: 'column',                                               
		            name: '平均值',                                                 
		            data: data.avgList                                       
		        }, {                                                              
		            type: 'column',                                               
		            name: '最大值',                                                  
		            data: data.maxList                                       
		        }, {                                                              
		            type: 'spline',                                               
		            name: '平均值（折线）',                                              
		            data: data.avgList,                               
		            marker: {                                                     
		            	lineWidth: 2,                                               
		            	lineColor: Highcharts.getOptions().colors[3],               
		            	fillColor: 'white'                                          
		            }                                                             
		        }]  
	        }
	        return opt;                                                              
		}
		
		//价格分析请求
		function lineReq(){
			var year = $("#year").val();
			var month = $("#month").val();
			var name = $("#ttName").val();
			if(year.length>0 && name.length>0 && month.length>0){
				$.ajax({
					type : "POST",
					async : false, //同步执行
					url : "farm.do",
					data : {
						method : "priceAnalyse",
						year : year,
						month : month,
						name : name
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						if(data.minList != null && data.minList.length>0 ){
							$("#lineDa").highcharts(lineOpt(data,name));
						}else{
							alert("暂无数据");
						}
					}
				});
			} else if (year.length>0 && name.length>0){
				$.ajax({
					type : "POST",
					async : false, //同步执行
					url : "farm.do",
					data : {
						method : "priceAnalyse",
						year : year,
						name : name
					},
					dataType : "json", //返回数据形式为json
					success : function(data) {
						if(data.minList != null && data.minList.length>0 ){
							$("#lineDa").highcharts(lineOpt(data,name));
						}else{
							alert("暂无数据");
						}
					}
				});
			} else{
				alert("请选择年份或品种");
			}
		}
		
		function switchTab(obj,i){
			$(obj).addClass("on");
			$(obj).siblings().removeClass("on");
			$(".content").eq(i).removeClass("box_content_hidden").addClass("box_content_block");
			$(".content").eq(i).siblings().removeClass("box_content_block").addClass("box_content_hidden");
		}
		
		
		$(function(){
			/** 地图默认
		    */
		    changeTypeName();
			/** 
				折线图
			*/
			compareType();
			/**
			*	数据查询
			*/
			pieQuery();
			/**
			*	价格分析
			*/
		//	lineReq();
			
			$('#R0').on('change', function() {
				charter.options.chart.options3d.alpha = this.value;
				showValues();
				charter.redraw(false);
			});
			$('#R1').on('change', function() {
				charter.options.chart.options3d.beta = this.value;
				showValues();
				charter.redraw(false);
			});
			
			window.setInterval(autoScroll, 3000);
			
		});
		
		
	</script>
  </body>
</html>
