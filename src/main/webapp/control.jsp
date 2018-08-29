<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<meta http-equiv="expires" CONTENT="Wed, 26 Feb 2016 08:21:57 GMT">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="images/yn.png" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link href="css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/nongye_price.css" />
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
#type {
	position: absolute;
	top: 230px;
	margin: 20px auto 0px;
	width: 400px;
	height: 250px;
	left: 798px
}

#type a {
	position: absolute;
	padding: 3px 6px;
	font-family: Microsoft YaHei;
	color: #fff;
	TOP: 0px;
	font-weight: bold;
	text-decoration: none;
	left: 0px
}

#type a:hover {
	border: #eee 1px solid;
}

#type .red {
	color: black
}
#highcharts-8{
	top:40px;
}
.price_3{
	width:1200px;
}
.content_left{
	float:left;
	width:58%;
	margin-left:8px;
	border-right: 1px solid #dfdfdf;
	border-top:1px solid #dfdfdf;
}
.content_right{
	float:left;
	width:40%;
	border-top:1px solid #dfdfdf;
}

.content h3{
	/* margin-left:30px; */
	text-align: center;
	margin-top:20px;
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
					<li><a href="./index.jsp">首页</a></li>
					<li><a href="./control.jsp" class="nav_aclick">数据监控</a></li>
					<li><a href="./contrast.jsp" >数据查询</a></li>
					<li><a href="./forecast.jsp">价格预测</a></li>
					<li><a href="javascript:">企业地图</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!------------------------------- 结束 ----------------------------->
	<div class="main">
		<div class="main_center">
			<!-- -------------当天数据查询监控---------------  -->
			<div class="price_1">
				<div class="title">
					<!-- <br />
					<h2>
						<font color="black" size="4" ><b>实时监控</b>
						</font>
					</h2> -->
					<div id="box">  
				     <ul id="tab">  
				         <li class="two on" id="tab_1" onClick="switchTab(this,0)">实时监控</li>  
				         <li class="two" id="tab_2" onClick="switchTab(this,1)">抓取量查询</li>  
				     </ul>
				   </div> 
				</div>
				<div class="content box_content_block">
					<ul class="kind_nav">
						<li class="li_long li_first" >
							<!-- <div class="name">市场总数</div> -->
							<div id="a" style="width: 280px;height: 190px;"></div>
						</li>
						<li class="li_long">
							<!-- <div class="name">品类总数</div> -->
							<div id="b" style="width: 280px;height: 190px;"></div>
						</li>
						<li class="li_long">
							<div class="name">品种总数</div>
							<div id="c"></div>
						</li>
						 <li class="li_long">
							<div class="name">总抓取量</div>
							<div id="d"></div>
						</li>
					<!--	<li class="li_long">
							<div class="name">当天抓取量</div>
							<div id="e"></div>
						</li>
						<li class="li_long">
							<div class="name">抓取时间</div>
							<div id="f"></div>
						</li> -->
						
					</ul>
					<!------------------------- 结束 -------------------------->
					<!----------------品种排行榜---------------  -->
					<div class="Top_Record">
						<div class="topRec_List">
							<dl>
								<dd>序号</dd>
								<dd>品种名称</dd>
								<dd>批发市场名称</dd>
								<dd>时间</dd>
							</dl>
							<div class="maquee">
								<ul>
									<c:forEach items="${farm.farmList }" var="f" varStatus="s">
										<li>
										<div>${s.index }</div>
										<div>${f.name }</div>
										<div>${f.market }</div>
										<div>${f.time }</div>
										</li>
									</c:forEach> 
								</ul>
							</div>
						</div>
					</div>
					<!-- ------------- market排行榜 ----------------->
					<div class="apple">
						<ul>
							<c:forEach items="${farm.marketList }" var="f" varStatus="s">
										<li>
									<div>
										<a href="javascript:">${f }</a>
									</div> 
								</li> 
							</c:forEach>
						</ul>
					</div>
					<!-- -------------type排行榜---------------  -->
					<div id="type">
						<c:forEach items="${farm.typeList }" var="f" varStatus="s">
								<a class="red" href="#">${f }</a>
						</c:forEach>
					</div>
				</div>
				
				<div class="content box_content_hidden">
					<div class="search">
						<div class="fields">
								<select name="province" style="width: 160px;height:30px;"
									onchange="getMarket(this);" tabindex="2" id="province">
									<option value="">省份</option>
									<c:forEach items="${farm.provinceList }" var="f">
										<option value="${f }">${f }</option>
									</c:forEach>
								</select> 
								<select name="country" style="width: 240px;height:30px;"
									onchange="getType(this);" tabindex="2" id="market">
									<option value="">批发市场</option>
								</select> 
								<select name="type" style="width:160px;height:30px;"
									id="typeMarket" tabindex="2">
									<option value="">产品种类</option>
								</select> 
								<input type="button" value="开始查询"
									onclick="getCount(this);" class="search_btn"
								 />
						</div>
					</div>
					<div class="content_left">
						<h3>
							<font color="black" >抓取数量
							</font>
						</h3> 
						<!--------------数据查询的部分 ---------------->
						<div id="show-search"></div>
					</div>
					<div class="content_right">
						 <h3>
							<font color="black" >所占记录数
							</font>
						</h3> 
						<div id="main" style="" ></div>
					</div>
				</div>
			</div>
	<%-- 		
		<div class="price_3" >
			<div class="title">
				<br />
				<h2>
					<font color="black" size="4" ><b>抓取量查询</b>
					</font>
				</h2>
			</div>
			<div class="content">
				<div class="search">
					<div class="fields">
							<select name="country" style="width: 240px;height:30px;"
								onchange="getType(this);" tabindex="2" id="market">
								<option value="">批发市场</option>
								<c:forEach items="${farm.marketAllList }" var="f">
									<option value="${f }">${f }</option>
								</c:forEach>
							</select> 
							<select name="type" style="width:160px;height:30px;"
								id="typeMarket" tabindex="2">
								<option value="">产品种类</option>
							</select> 
							<input type="button" value="开始查询"
								onclick="getCount(this);" class="search_btn"
							 />
					</div>
				</div>
				<div class="content_left">
					<h3>
						<font color="black" >抓取数量
						</font>
					</h3> 
					<!--------------数据查询的部分 ---------------->
					
					<div id="show-search"></div>
						
				</div>
				<div class="content_right">
					 <h3>
						<font color="black" >所占记录数
						</font>
					</h3> 
					<div id="main" style="" ></div>
				</div>
				
				</div>
			</div> --%>
					
		<jsp:include page="bottom.jsp"></jsp:include>
		</div>
		
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript"  src="js/script.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/echarts.js"></script>
	 <!-- <script type="text/javascript" src="js/exporting.js"></script> -->
	<script type="text/javascript" src="js/radialIndicator.min.js"></script>
	<!-- <script type="text/javascript" src="js/jquery.dialogBox.js"></script>
	 -->
	<script type="text/javascript">
				/**
				 s实时监控
				*/
				var marketCount = ${farm.marketCount };
				var typeCount = ${farm.typeCount};
				var nameCount = ${farm.nameCount};
				var sumCount = ${farm.sumCount};
			//	var crawlCount = ${farm.crawlCount};
				//var dateTime = ${farm.dateTime};
				$(function() {
					getCount(null);
					// Step:3 conifg ECharts's path, link to echarts.js from current page.
				    // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
				    require.config({
				        paths: {
				            echarts: './js'
				        }
				    });
				    require(
				        [
				            'echarts',
				            'echarts/chart/gauge'
				        ],
				        function (ec) {
				        	 // --- 地图 ---
				            var myChartA = ec.init(document.getElementById('a'));
				            myChartA.setOption(aOption(marketCount,'市场总数'));
				            var myChartB = ec.init(document.getElementById('b'));
				            myChartB.setOption(bOption(typeCount,'品类总数'));
				        }
				    ); 
					//初始化实时监控
					$('#c').radialIndicator({
						barColor: '#228B22',
						radius: 70,
						barWidth: 10,
						minValue: 0,
						maxValue: nameCount*2
					});
					$('#d').radialIndicator({
						barColor: '#4488BB', 
						barWidth: 10,
						radius: 70,
						minValue: 0,
						maxValue: sumCount*1.1
					});
				/* 	$('#e').radialIndicator({
						barColor: '#228B22',
						barWidth: 10,
						radius: 70,
						minValue: 0,
						maxValue: crawlCount*1.8
					});
					$('#f').radialIndicator({
						//barColor: '#FF4500', 
						barColor: '#4488BB', 
						radius: 70,
						barWidth: 10,
						minValue: 0,
						initValue: dateFormat(dateTime),
						maxValue: dateFormat(dateTime)*1.01,
						format: '####-##-## ##:##:##'
					});  */
			        var radialObjC = $('#c').data('radialIndicator');
			        radialObjC.animate(nameCount);
			        var radialObjD = $('#d').data('radialIndicator');
			        radialObjD.animate(sumCount);
			        /* var radialObjE = $('#e').data('radialIndicator');
			        radialObjE.animate(crawlCount);
			        var radialObjF = $('#f').data('radialIndicator');
			        radialObjF.animate(dateFormat(dateTime)); */
			        
					/* window.setInterval(timerUpdate, 20000); */
					function timerUpdate(){
						var chars = [0,1,2];
						nameCount=nameCount+chars[Math.floor(Math.random()*chars.length)];
						var random = Math.ceil(Math.random()*5)+6;
						sumCount = sumCount+random;
						crawlCount = crawlCount+random;
						dateTime = dateTime+20*1000;
						radialObjC.animate(nameCount);
						radialObjD.animate(sumCount);
						/* radialObjE.animate(crawlCount);
						radialObjF.animate(dateFormat(dateTime)); */
					};
					/* setInterval('autoScroll2("")', 10000); */
					/**
					* 滚动
					*/
					var i = 0;
					function autoScroll() {
						$(".apple").find("ul").animate({
							marginTop : "-39px"
						}, 500, function() {
							$(this).css({
								marginTop : "0px"
							}).find("li:first").appendTo(this);
						});
						
						$(".maquee").find("ul").animate({
							marginTop : "-195px"
						}, 3000, function() {
							$(this).css({
								marginTop : "0px"
							}).find("li:lt(5)").appendTo(this);
						});
						i++;
						if(i==2){
							timerUpdate();
							i = 0;
						}
					}
					
					window.setInterval(autoScroll, 10000); 
				})
				
				/**
				*   将毫秒数 转化为日期格式
				*/
				function dateFormat(dateTime){
					var date = new Date(dateTime);
					var month = (date.getMonth()+1)+"";
					if(month.length==1){
						month="0"+month;
					}
					var day = date.getDate()+"";
					if(day.length==1){
						day = "0"+day;
					}
					var hour = date.getHours()+"";
					if(hour.length==1){
						hour = "0"+hour;
					}
					var minute = date.getMinutes()+"";
					if(minute.length==1){
						minute = "0"+minute;
					}
					var second = date.getSeconds()+"";
					if(second.length==1){
						second = "0"+second;
					}
					var formatDate = date.getFullYear()+""+month+day+hour+minute+second;
					return formatDate;
				}
				
				function aOption(count,name){
					 var opt = {
					 	series : [
					        {
					            name:null,
					            type:'gauge',
					            splitNumber: 2,       // 分割段数，默认为5
					            min : 0,
					            max : count,
					            axisLine: {            // 坐标轴线
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    color: [[0.2, '#228b22'],[0.8, '#48b'],[1, '#ff4500']], 
					                    width: 8
					                }
					            },
					            axisTick: {            // 坐标轴小标记
					                splitNumber: 10,   // 每份split细分多少段
					                length :12,        // 属性length控制线长
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    color: 'auto'
					                }
					            }, 
					            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
					                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                    color: 'auto'
					                }
					            }, 
					            splitLine: {           // 分隔线
					                show: true,        // 默认显示，属性show控制显示与否
					                length :30,         // 属性length控制线长
					                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					                    color: 'auto'
					                }
					            },
					            pointer : {
					                width : 5
					            },
					            title : {
					                show : true,
					                offsetCenter: [0, '-40%'],       // x, y，单位px
					                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                    fontWeight: 'bolder'
					                }
				                },
					            data:[{value: count, name: name}]
					        }
					    ]
					 }
					 return opt;
				}
				
				function bOption(count,name){
					var max = count * 2;
					 var opt = {
					 	series : [
					        {
					            name:null,
					            type:'gauge',
					            splitNumber: 2,       // 分割段数，默认为5
					            min : 0,
					            max : max,
					            axisLine: {            // 坐标轴线
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    color: [[0.2, '#228b22'],[0.8, '#48b'],[1, '#ff4500']], 
					                    width: 8
					                }
					            },
					            axisTick: {            // 坐标轴小标记
					                splitNumber: 8,   // 每份split细分多少段
					                length :12,        // 属性length控制线长
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    color: 'auto'
					                }
					            },
					            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
					                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                    color: 'auto'
					                }
					            }, 
					            splitLine: {           // 分隔线
					                show: true,        // 默认显示，属性show控制显示与否
					                length :30,         // 属性length控制线长
					                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					                    color: 'auto'
					                }
					            },
					            pointer : {
					                width : 5
					            },
					            title : {
					                show : true,
					                offsetCenter: [0, '-40%'],       // x, y，单位px
					                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                    fontWeight: 'bolder'
					                }
				                },
					            data:[{value: count, name: name}]
					        }
					    ]
					 }
					 return opt;
				}
				//window.setInterval(timerUpdate, 30000);
				/* function timerUpdate(){
					var typeSum = parseInt($("#typeSum").text());
					var totalSum = parseInt($("#totalSum").text());
					var todaySum = parseInt($("#todaySum").text());
					var chars = [0,1,2];
					$("#typeSum").hide("slow");
					$("#typeSum").text(typeSum+chars[Math.floor(Math.random()*chars.length)]).show("slow");
					var random = Math.ceil(Math.random()*5)+6;
					$("#totalSum").hide("slow").show("slow").text(totalSum+random);
					$("#todaySum").hide("slow").show("slow").text(todaySum+random);
					var date = new Date();
					var month = parseInt(date.getMonth())+1;
					$("#newDateTime").text(date.getFullYear()+"-"+month+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds());
				} */
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
							async : true, //同步执行
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
				/**
				*  折线图
				*/
				function lineOption(data){
					var option = {
				        chart: {
				            zoomType: 'x',
				            spacingRight: 20,
				            marginTop:50,
				            width:630
				        },
				        title: {
				            text: null
				        },
				        subtitle: {
				            text: null
				        },
				        xAxis: {
				        	title: {
				                text: '日期'
				            },
				            categories: data.dateList  
				        },
				        yAxis: {
				            title: {
				                text: '抓取记录数量'
				            }
				        },
				        tooltip: {
				            shared: true
				        },
				        legend: {
				            enabled: false
				        },
				        plotOptions: {
				            area: {
				                fillColor: {
				                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
				                    stops: [
				                        [0, Highcharts.getOptions().colors[0]],
				                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
				                    ]
				                },
				                lineWidth: 1,
				                marker: {
				                    enabled: false
				                },
				                shadow: false,
				                states: {
				                    hover: {
				                        lineWidth: 1
				                    }
				                },
				                threshold: null
				            }
				        },
				
				        series: [{
				            type: 'area',
				            name: '抓取记录数量',
				            data: data.countList
				        }]
				    }
				    return option;
				}
				
				/** 饼图动态参数
				*/		
				function params(da){
					var option = {
					        chart: {
					            type: 'pie',
					            options3d: {
					                enabled: true,
					                alpha: 25,
					                beta: 0
					            },
					            width:450,
					            marginTop:1,
					            marginLeft:130
					        },
					        title: {
					        	text:null,
					        	y:100
					        },
					      	credits: {
					      		enabled:false
					      	},
					      	exporting: {
					      		enabled:false
					      	},
					        plotOptions: {
					            pie: {
					                allowPointSelect: true,
					                cursor: 'pointer',
					                depth: 15,
					                dataLabels: {
					                    enabled: true,
					                    format: '{point.name}'
					                }
					            }
					        },
					        series: [{
					            type: 'pie',
					            name: '所占的记录数:',
					            data: da
					        }]
					    }
					  return option;
				}
				/**数据查询
				*/
				function getCount(obj) {
					var market = "";
					var type ="";
					if(obj!=null){
						market = $('#market').val();
						type = $('#typeMarket').val();
					}else{
						market = "北京新发地批发市场";
						type = "蔬菜";
					}
					if(market.length>0 && type.length>0){
						$.ajax({
							type : "POST",
							async : false, //同步执行
							url : "farm.do?method=crawlCount",
							data : {
								market : market,
								type : type
							},
							dataType : "JSON", //返回数据形式为json
							success : function(data) {
								if(data.dateList!=null){
									$("#show-search").highcharts(lineOption(data));
									$("#main").highcharts(params(eval(data.pieJson)));
								}else{
									alert("该市场最近五天内暂无数据更新！！");
								}
								
							}
						});
					}
					
				};
				
				/**
				*  tab切换
				*/
				function switchTab(obj,i){
					$(obj).addClass("on");
					$(obj).siblings().removeClass("on");
					$(".content").eq(i).removeClass("box_content_hidden").addClass("box_content_block");
					$(".content").eq(i).siblings().removeClass("box_content_block").addClass("box_content_hidden");
				}
			</script>
</body>
</html>