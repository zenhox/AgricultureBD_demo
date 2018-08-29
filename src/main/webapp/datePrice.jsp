<%@ page language="java" pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import="java.util.*" %>

<html>
 <script src="./js/echarts.js"></script>
 <script src="./js/jquery-3.3.1.min.js"></script>
<body>

<!-script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"->
<script src="./js/jquery.min.js">
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

        function getMarket(){
            var province = $("#select_1").find("option:selected").text();
            var market = $("#select_2").find("option:selected").text();
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
                    console.log(arrayData.length)
                    console.log(arrayData[0])
                    $("#select_2").html('<option value=1 selected="selected">请选择</option>');
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
            var type = $("#select_3").find("option:selected").text();
            $.ajax({
                type:"GET",
                url:"",
                data:{
                    market:market
                },
                success:function (data) {
                    $("#select_3").html('<option value=1 selected="selected">请选择</option>');
                    for (var i = 0; i < data.length; i++) {
                        var tempOpt = document.createElement('option ');
                        $(tempOpt).attr('value',data[i].typeName);
                        $("#select_3").append(tempOpt);
                    }
                }
            })
        }
        function getName(){
            var name = $("#select_4").find("option:selected").text();
            $.ajax({
                type:"GET",
                url:"",
                data:{
                    name:name
                },
                success:function (data) {
                    for (var i = 0; i < data.length; i++) {
                        $("#select_3").html('<option value=1 sel ected="selected">请选择</option>');
                        var tempOpt = document.createElement('option ');
                        $(tempOpt).attr('value',data[i].nameName);
                        $("#select_4").append(tempOpt);
                    }
                }
            })
        }
        function getGraph(){
            $.ajax({url:"http://localhost:8080/agriculture/datePrice/"+province+"/"+market+"/"+type+"/"+name+".do",success:function(result) {
                    result = eval("("+result+")");
                    myChart.setOption({
                        xAxis:{data: result.date},
                        series:[{name:'价格',data:result.price}]
                    });
                    console.log(result);
                    $("#div1").html(result);
                }
            });
        }

        $("#select_1").change(function () {
            getMarket();
        });
        $("#select_2").change(getType);
        $("#select_3").change(getName);
        $("#select_4").change(getGraph);
    }
    
    
</script>

<div id="div1">
    <label>省份:</label>
    <select id="select_1">
        <option value=1 selected="selected">请选择</option>
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
    <label>市场:</label>
    <select id="select_2" style='width:200px;'>
        <option value=1 selected="selected">请选择</option>
    </select>
    <label>品类:</label>
    <select id="select_3">
        <option value=1 selected="selected">请选择</option>
    </select>
    <label>品名:</label>
    <select id="select_4">
      <option value=1 selected="selected">请选择</option>
    </select>
</div>
</body>
</html>
