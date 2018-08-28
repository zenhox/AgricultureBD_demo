<%@ page language="java" pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset= utf-8"%>

<%@ page import="java.util.*" %>

<html>
 <script src="echarts.js"></script>
 <script src="jquery-3.3.1.min.js"></script>
<body>

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js">
</script>
 <div id="main" style="width: 600px;height:400px;"></div>
 <script>
 var myChart = echarts.init(document.getElementById('main'));
myChart.setOption({
	 title: { text: '农产品'},
     tooltip: {},
     legend: {data:['价格']},
     xAxis: { data: []},
     yAxis: {},
     series: [{ name: '价格',type: 'bar',  data: []  }]
});

    window.onload = function(){
        document.getElementById("get").onclick = function()
{
            $.ajax({url:"http://localhost:8080/agriculture/datePrice/山西/山西省太原市河西农产品有限公司/蔬菜/油麦菜.do",success:function(result)
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
<button id="get">get</button>
<div id="div1"></div>
</body>
</html>
