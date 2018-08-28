<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   	<title>云南省党务信息大数据分析与应用平台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="images/yn.png" />
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link rel="stylesheet" type="text/css" href="css/nongye_price.css" /> 
	<link href="css/sroll.css" rel="stylesheet" type="text/css">
	

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
			height:630px; width: 450px; margin-top:-40px; margin-right:5px;
					 float:right; z-index: 100;
		}
		#price-map{
			height:550px; width:750px; float:right; margin-left:-60px;
			
		}
		
		.nav ul ul {
			visibility:hidden;
			list-style:none;
	         border-radius: 0px; padding: 0;
	        position: absolute; top: 100%;
	    }
	    .nav ul ul li {
	    	margin:0;
            float: none; 
            z-index:10;
          	 border-top: 1px solid #6b727c;
            border-bottom: 1px solid #575f6a;
            background: #5f6975;
            position: relative;
        }
        .nav ul ul li a {
      	  margin:0;
            padding: 2px 30px;
            color: #fff;
        }   
        .nav ul ul li:hover {
            background: #4b545f;
        }
    </style>  
  </head>
   
  <body>
  	<!----------------------------- 导航栏部分----------------------- -->
	<div class="top_t">
		<div class="top_tittle">
			<div class="logo" style="font-size: 22px; width:380px;">
				<font color="white">云南省党务信息大数据分析与应用平台</font>
			</div>
			<span style="display: none"> </span>
			<div class="login_register" style="font-size: 12px">
					<a href="./visit.do?method=news" >登录系统</a>
				</div>
			<div class="nav" >
				<ul>
					<li><a href="javascript:;"  class="nav_aclick">云岭指数</a>
						<ul>
                			<li><a href="./visit.do?method=news">使用指数</a></li>
                			<li><a href="http://202.203.185.4:8080/studymark/index.jsp">学习指数</a></li>
                			<li><a href="http://202.203.185.4:8080/studymark/party.jsp">党务指数</a></li>
                			<li><a href="http://202.203.185.4:8080/studymark/confer.jsp">宣传动员指数</a></li>
                		</ul>
					</li>
					<li><a href="javascript:alert('正在建设中....');">热词分析</a></li>
					<!-- <li><a href="./visit.do?method=news"  >红岭云指数</a>
						<ul>
                			<li><a href="#">Photoshop</a></li>
                			<li><a href="#">Illustrator</a></li>
                		</ul>
					</li>
					<li><a href="./visit.do?method=news" >红岭云指数</a>
						<ul>
                			<li><a href="#">Photoshop</a></li>
                			<li><a href="#">Illustrator</a></li>
                		</ul>
					</li> -->
				</ul>
			</div>
		</div>
	</div>
  	<div class="main">
		<div class="main_center">
			<!-- <div class="price_1">
				<div class="title">
					<br />
					<h2>
						<font color="black" size="4" ><b>价格预测</b>
						</font>
					</h2>
				</div>
				<div class="content">
				   <div class="search">
				   		<span class="search_name">蜜桃雪山(香槟)</span>
				   		<span class="search_name">冷美人</span>
				   		<span class="search_name on">卡罗拉(新市场)</span>
				   		<span class="search_name">戴安娜</span>
				   		<span class="search_name">大桃红</span>
				   </div>
				   <div id="container" style="width:99%;height:580px;"></div>
			    </div>
			</div> -->
			
			<div class="price_1">
				<div class="title">
					<br />
					<h2>
						<font color="black" size="4" ><b>各地访问量分析</b>
						</font>
					</h2>
				</div>
				<div class="content">
					<div id="price-map"  >
					</div>
					<div id="price-zhu"  >
					</div>
					
					<!-- <div id="main" style="width:99%;height:580px;"></div> -->
				</div>
			</div>
			<!--  
			<div class="price_2">
				<div class="title">
					<br />
					<h2>
						<font color="black" size="4" ><b>行业分析</b>
						</font>
					</h2>
				</div>
				<div class="content">
					<div class="read-head">
						<h1>2015年国内农产品价格行情预测：稳中偏弱走势</h1>
					</div>
					<div class="read-content">
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015年国际大宗农产品价格延续上年跌势，国内市场供应总体充足、价格跌多涨少、进口继续增长。预计2016年国际农产品市场供需仍然较为宽松，价格下行压力较大；国内粮食价格在托市政策支持下将继续保持稳定，棉花价格有望低位企稳，油脂油料价格继续弱势震荡，食糖继续下行可能性较大，鲜活农产品涨跌幅度趋缓，农产品进口仍将增长。</p>
					<p class="bold"><b></b>粮棉油糖价格预计稳中偏弱</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受宏观经济下行压力、国际价格下跌及托市政策趋稳影响，预计2015年国内农产品价格呈现稳中偏弱的走势。</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;粮食供需平衡略有余、库存充足，再加上2015年小麦最低收购价维持2014年水平，2015年稻谷最低收购价和玉米临储价预计稳中略涨或者不涨，国内市场价格不会大涨也不至于大跌，将基本稳定在2014年的水平。</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;棉花、大豆实行目标价格改革，取消临时收储政策，国内价格将与国际价格同步波动，受国际价格偏弱和棉花国内供大于需的影响，预计这两个品种2015年价格也将偏弱运行。</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015年油菜籽临储政策走向未定，即使继续实行临储政策，预计临储价格也涨幅不大，市场价格也将基本稳定在2014年的水平。食用植物油价格将受到全球油脂供应宽松、进口冲击的影响，保持在较低水平。</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;预计2014/2015榨季国内食糖产量1200万吨左右，食糖消费将继续增长至1520万吨，国内食糖产需缺口扩大到320万吨，但900万吨以上的庞大库存仍将使市场呈现严重供大于求，国内糖价将继续承压下行。</p>
					<p class="bold"><b></b>畜禽产品价格有望稳中有涨</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受生猪价格持续低迷影响，能繁母猪存栏量同比下滑已维持13个月，2014年9月份能繁母猪存栏环比减0.5%，同比减10.4%，预计2015年下半年生猪出栏或可能出现阶段性供需偏紧，生猪市场价格总体向好。
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家禽养殖企业盈利水平好转，如果不再出现其他突发性事件影响，预计年末将迎来新一轮的上涨，后期受宏观经济形势平稳预期以及国际饲料粮价格下跌影响，预计2015年禽肉、禽蛋价格总体稳中有涨。</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;肉牛存栏2014年10月同比降9%，肉羊存栏增1.4%，总供给偏紧的态势依然存在，2015年牛羊肉价格仍有一定的上涨空间。</p>
					<p class="bold"><b></b>原料奶收购价上涨可能性不大</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;由于美国、新西兰和英国等奶业主产国牛奶生产形势较好，加上2014年8月份以来俄罗斯实行禁止从欧洲、美国和澳大利亚进口乳制品，全球乳制品价格下行压力较大。2014年11月4日恒天然全球最新竞拍价为每吨2634美元，明显低于2012年5~6月的竞拍价格。从现在的期货合约价来看，2015年3月份以后才有企稳迹象，大多数竞拍者保持“观望”态度，竞拍量没有明显增加。2015年原料奶收购价格受到中澳自贸区、俄罗斯对欧美澳乳制品进口禁令、欧盟奶制品配额政策等多重外部因素影响，上涨可能性不大。
					</p>
					<p class="bold"><b></b>果蔬和水产品价格基本持稳</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总的来看，这几年果蔬价格是在上涨的，这主要是因为种植成本推动和需求拉动。但由于这两年蔬菜面积比较稳定，且经济下行压力下农村外出务工劳动力相对减少，蔬菜需求相比前几年会略有下降，预计蔬菜市场价格也会保持基本稳定。</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;近几年全国果园面积稳定中略有增长，品种结构持续微调，水果生产态势总体向好，市场供应有保证，目前水果价格处于高位，预计2015年价格不会持续大幅上涨。</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;水产品价格在经济下行压力、公款消费缩减等因素影响下，即使有鱼粉短缺等成本因素支撑，也不具备上涨条件，特别是梭子蟹、大闸蟹等中高端产品销售仍会处于低迷状态，需求量较大的仍将是低值、低价的大宗品种。 </p>
					<p class="bold"><b></b>农产品进口仍将继续增长</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015年农产品国内外价差仍将比较明显，这是由我国农产品竞争力低的根本因素决定的。特别是在美国2014年法案的作用下，美国和全球农产品价格将更为便宜，我国农产品进口数量将进一步增加。据模型测算，与2008年农业法案相比，2014年美国农业法案将导致2014/2015年度我国大豆、棉花、玉米、小麦、豆油进口分别增加0.10%、0.45%、0.20%、0.11%、0.07%。同时，中澳自贸协定生效后与中新自贸协定叠加影响，将使我国牛羊肉和奶粉进口增加。中国—东盟自贸区建设逐步深化，将使我国水果进口增加。另外，巴西正在扩大热带地区大豆种植面积，中亚地区的乌克兰等国积极扩大对我国的玉米出口，美国稻米协会也在谋划扩大对中国的稻米出口，这些将成为我国2015年的农产品进口压力。
					</p>
					</div>
				</div>
			</div>
			
			-->
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</div>
	
    <script type="text/javascript" src="js/jquery.min.js"></script> 
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/echarts.js"></script>
	<script type="text/javascript">
		 
	
		$(function(){
			fore();
			
			
			$('li').has('ul').mouseover(function(){
				$(this).children('ul').css('visibility','visible');
				}).mouseout(function(){
				$(this).children('ul').css('visibility','hidden');
				})
	
			   
			
			/* $(".search_name").click(function(){
				$(this).addClass("on");
				$(this).siblings().removeClass("on");
				fore("昆明市斗南花卉鲜花批发交易市场",$(this).text());
			});
			 */
		});
		
		var fore = function(){
			$.ajax({
				type : "POST",
				async : false, //同步执行
				url : "visit.do",
				data : {
					method : "newFunc"
				},
				dataType : "json", //返回数据形式为json
				success : function(data) {
					mapData(data);
				}
			});
		};
		
		
		function mapData(data){
			require.config({
	            paths: {
	                echarts: 'js/build/dist'
	            }
	        });
			// 使用
	        require(
	            [
	                'echarts',
	                'echarts/chart/bar',
					'echarts/chart/map'
	            ],
	            function (ec) {
					// --- 地图 ---
					var myChart = ec.init(document.getElementById('price-map'));
					var myChart2 = ec.init(document.getElementById('price-zhu'));
					var cityMap = {
						"大理白族自治州": "532900"
					};
					var mapGeoData = require('echarts/util/mapData/params');
					for (var city in cityMap) {
						// 自定义扩展图表类型
						mapGeoData.params[city] = {
							getGeoJson: (function (c) {
								var geoJsonName = cityMap[c];
								return function (callback) {
									$.getJSON('js/geoJson/china-main-city/' + geoJsonName + '.json', callback);
								}
							})(city)
						}
					}
					option = {
						title: {
							text : '大理白族自治州',
							x:'center'
						},
						tooltip : {
							trigger: 'item'
						},
						dataRange: {
					        min: data.mdList[data.mdList.length-1].value,
					        max: data.mdList[0].value,
					        x: 'left',
					        y: 'bottom',
					        /* color: ['rgba(0, 0, 0, 0)', 'orange', 'yellow','lime','blue'], */
					        text:['高','低'],           // 文本，默认为数值文本
					        calculable : true
					    },
						series : [
							{
								name: '访问量',
								type: 'map',
								mapType: '大理白族自治州',
								selectedMode : 'single',
								itemStyle:{
		                            normal:{label:{show:true,
		                            	formatter : function(a, b) {
		                            		if(b=="-"){
		                            			return a;
		                            		}else{
		                            			//return a+":"+b;
		                            			return a;
		                            		}
		                            		
			
										}
		                            }},
		                            emphasis:{label:{show:true}}
		                        },
								data:data.mdList
							}
						]
					};
					myChart.setOption(option, true);
					
					var yData = [];
		    	var xData = [];
		    	for ( var number = data.mdList.length-1; number >=0; number--) {
					yData.push(data.mdList[number].name);
					xData.push(data.mdList[number].value);
				}
				var color_data = [ '#0472DE', '#0472DE', '#0472DE', 
				'#499DE8','#5CAAEB','#6AB3ED','#7ABDF0',
				'#81C1F1','#8AC8F2','#91CCF3','#98CFF4','#A1D6F5','#B2E1F8','#B9E6F9' ];
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
					
					myChart2.setOption(opt, true);
				}
	        );
		
		}
		
		
	</script>
  </body>
</html>
