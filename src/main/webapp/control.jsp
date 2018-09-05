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
		.kind_nav{
			display: flex;
			width: 1180px;
			height: 180px;
		}
		.kind_nav>li{
			flex:1 1 auto;
			width: 160px;
			height: 180px;
		}
        #MarketCount,#TypeCount,#NameCount,#DrawCount,#todayDrawCount,#Time{
            font-size: 30px;
            margin-top: 70px;
            color: #FFCC33;
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
						<div class="name">市场总数</div>
                        <div id="MarketCount"></div>
					</li>
					<li class="li_long">
						<div class="name">品类总数</div>
                        <div id="TypeCount"></div>
					</li>
					<li class="li_long">
						<div class="name">品种总数</div>
						<div id="NameCount"></div>
					</li>
					<li class="li_long">
						<div class="name">总抓取量</div>
						<div id="DrawCount"></div>
					</li>
					<li class="li_long">
						<div class="name">当天抓取量</div>
						<div id="todayDrawCount"></div>
					</li>
					<li class="li_long">
						<div class="name">抓取时间</div>
						<div id="Time"></div>
					</li>

				</ul>
				<!------------------------- 结束 -------------------------->
				<!----------------品种排行榜---------------  -->
				<div class="Top_Record" >
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#d8d8d8" class="m_t_5">
                    <tr>
                        <td width="20%" height="30" align="center" bgcolor="#FFFFFF" class="B">种类</td>
                        <td width="35%" height="30" align="center" bgcolor="#FFFFFF" class="B">市场</td>
                        <td width="15%" height="30" align="center" bgcolor="#FFFFFF" class="B">价格(元/斤)</td>
                        <td width="30%" height="30" align="center" bgcolor="#FFFFFF" class="B">日期</td>
                    </tr>
                    </table>
                    <td height="30" colspan="5" valign="top">
                        <table width="100%" border="0" align="center" id="show" cellpadding="0" cellspacing="0" class="f_s_14">

                        </table>
                        <table width="60%" align="right">
                            <tr>
								<td>
									<div id="barcon"  name="barcon">
										   <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
										<a href="" id="up" style="text-align:center"></a>
										<a id="h_text2"></a>
										<a href="" id="down"></a>
										<br>
										<a id="h_text"></a>
										到第<input id="pageJump_id" size =2 type="text"  />页

										<input type="submit" id="pageJump_button">
									</div>
								</td>
							</tr>
                        </table>
                    </td>
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
     *  tab切换
     */
    function switchTab(obj,i){
        $(obj).addClass("on");
        $(obj).siblings().removeClass("on");
        $(".content").eq(i).removeClass("box_content_hidden").addClass("box_content_block");
        $(".content").eq(i).siblings().removeClass("box_content_block").addClass("box_content_hidden");
    }
</script>

<script>
    window.onload = function (ev) {
        //   执行函数，获得data
        var mydata = JSON.parse(localStorage.getItem('mydata'));

        function GetMonitorData() {
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/agriculture/AllData",
                success: function (data) {
                    data=data.substring(1,data.length-1);
                    console.log(data);
                    var arrayAllData = data.split(",");
                    console.log(arrayAllData);
                    document.getElementById("MarketCount").innerText=arrayAllData[0];
                    document.getElementById("TypeCount").innerText=arrayAllData[1];
                    document.getElementById("NameCount").innerText=arrayAllData[2];
                    document.getElementById("DrawCount").innerText=arrayAllData[3];
                    document.getElementById("todayDrawCount").innerText=arrayAllData[4];
                    document.getElementById("Time").innerText=arrayAllData[5];

                }
            }
        )}
        GetMonitorData();

        function showTable(data) {
            var flagment = document.createDocumentFragment();
            for (var i = 0; i < data.length; i++) {
                var templi = document.createElement('tr');

                var tempEm1  = document.createElement('td');
                tempEm1.innerText = data[i].type;
                tempEm1.style.width="240";
                tempEm1.style.height="30";
                tempEm1.style.textAlign="center";
                templi.appendChild(tempEm1);

                var tempEm2  = document.createElement('td');
                tempEm2.innerText = data[i].market;
                tempEm2.style.width="418.33";
                tempEm2.style.height="30";
                tempEm2.style.textAlign="center";
                templi.appendChild(tempEm2);

                var tempEm3  = document.createElement('td');
                tempEm3.innerText = data[i].price;
                tempEm3.style.width="179.17";
                tempEm3.style.height="30";
                tempEm3.style.textAlign="center";
                templi.appendChild(tempEm3);

                var tempEm4  = document.createElement('td');
                tempEm4.innerText = data[i].date;
                tempEm4.style.width="358.33";
                tempEm4.style.height="30";
                tempEm4.style.textAlign="center";
                templi.appendChild(tempEm4);

                flagment.appendChild(templi)
            }
            $('#show').append(flagment);
        }
        showTable(mydata);
        function goPage(pno,psize) {
            var itable = document.getElementById("show");
            var num = itable.rows.length;//表格所有行数(所有记录数)
            console.log(num);
            var totalPage = 0;//总页数
            var pageSize = psize;//每页显示行数

            //计算分几页
            if (num / pageSize > parseInt(num / pageSize)) {
                totalPage = parseInt(num / pageSize) + 1;
            } else {
                totalPage = parseInt(num / pageSize);
            }

            var currentPage = pno;//当前页数
			console.log(currentPage);
            var startRow = (currentPage - 1) * pageSize + 1;//开始显示的行  31
            var endRow = currentPage * pageSize;//结束显示的行   40

            endRow = (endRow > num) ? num : endRow;

            console.log(endRow);

            //遍历显示数据实现分页
            for (var i = 1; i < (num + 1); i++) {
                var irow = itable.rows[i - 1];
                if (i >= startRow && i <= endRow) {
                    irow.style.display = "block";//此元素将显示为块级元素，此元素前后会带有换行符。
                } else {
                    irow.style.display = "none";//此元素不会被显示。
                }
            }


            var tempStr = "共" + totalPage + "页 "+num + "条记录" ;
            var tempStr_id=document.getElementById("h_text");
            tempStr_id.innerText=tempStr;
            var tempStr2="当前第" + currentPage + "页";
            var tempStr2_id=document.getElementById("h_text2");
            tempStr2_id.innerText=tempStr2;

            var pageJump=document.getElementById("pageJump_button")
            if (currentPage > 1 && currentPage <totalPage) {
                var templi1 = document.getElementById("up");
                templi1.href="#";
                templi1.onclick=function(){
                    goPage(currentPage-1,pageSize);
                }
                templi1.innerText="上一页";

                var templi2=document.getElementById("down");
                templi2.href="#";
                templi2.onclick=function () {
                    goPage(currentPage+1,pageSize);
                }
                templi2.innerText="下一页";

                pageJump.href="#";
                pageJump.onclick=function(){
                    goPage(document.getElementById("pageJump_id").value,pageSize);
                }
            } else if(currentPage == 1){
                var templi3=document.getElementById('up');
                templi3.innerText="首页";


                var templi4=document.getElementById('down');
                templi4.href="#";
                templi4.innerText="下一页";
                templi4.onclick=function () {
                    goPage(currentPage+1,pageSize);
                }
                pageJump.href="#";
                pageJump.onclick=function(){
                    goPage(document.getElementById("pageJump_id").value,pageSize);
                }
            }else if(currentPage == totalPage){
                var templi5 = document.getElementById('up');
                templi5.href="#";
                templi5.onclick=function(){
                    goPage(currentPage-1,pageSize);
                }
                templi5.innerText="上一页";

                var templi6=document.getElementById('down');
                templi6.innerText="尾页";

                pageJump.href="#";
                pageJump.onclick=function(){
                    goPage(document.getElementById("pageJump_id").value,pageSize);
                }
            }
        }
        goPage(1,10);


    }
</script>


</body>
</html>