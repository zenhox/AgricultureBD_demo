<%@ page language="java" pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import="java.util.*" %>

<html>
 <script src="./js/echarts.js"></script>
 <script src="./js/jquery-3.3.1.min.js"></script>
<body>

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js">
</script>
 <div id="main" style="width: 1200px;height:400px;"></div>
 <script>
 var myChart = echarts.init(document.getElementById('main'));
myChart.setOption({
	 title: { text: '农产品'},
     tooltip: {},
     legend: {data:['价格']},
     xAxis: { data: []},
     yAxis: {},
     series: [{ name: '价格', type:"line", data: []  }]
});

    window.onload = function(){
        document.getElementById("get").onclick = function()
{


        	var province = $("#select_1").find("option:selected").text();
        	var market = $("#select_2").find("option:selected").text();
        	var type = $("#select_3").find("option:selected").text();
        	var name = $("#select_4").find("option:selected").text();
            $.ajax({url:"http://localhost:8080/agriculture/datePrice/"+province+"/"+market+"/"+type+"/"+name+".do",success:function(result)
{                result = eval("("+result+")");
            	myChart.setOption({
	                  xAxis:{data: result.date},
	                  series:[{name:'价格',data:result.price}]
	
	
});
                 console.log(result);
                 $("#div1").html(result);
            }});
        }
    }
    
    
</script>
<h2>Hello World!</h2>

<div id="div1"></div>
    <label>省份:</label>
    <select id="select_1">
      <option value=1 selected="selected">山西</option>
    </select>
    <label>市场:</label>
    <select id="select_2">
      <option value=1 selected="selected">山西省太原市河西农产品有限公司</option>
    </select>
    <label>品类:</label>
    <select id="select_3">
      <option value=1 selected="selected">蔬菜</option>
    </select>
    <label>品名:</label>
    <select id="select_4">
      <option value=1 selected="selected">油麦菜</option>
      <option value=2 selected="selected">洋白菜</option>
      <option value=3 selected="selected">生姜</option>
    </select>
    <label>图表:</label>
    <button id="get">查询</button>
</body>
</html>
