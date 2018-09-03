<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <script src="./js/jquery-3.3.1.min.js"></script>
    <title>区域行情</title>
</head>

<body>
    <div id="area_div2" style="margin-left:250px;">
        <label for="areaQueryDate">查询日期：</label><input id="areaQueryDate" type="date" value="2018-08-01"/>
        <label style="font-size:15px;">品类:</label>
        <select id="area_select_1" style="width: 160px;height:30px;">
            <option value=1 selected="selected" >请选择</option>
            <option value=2>蔬菜</option>
            <option value=3>果品</option>
            <option value=4>水产品</option>
            <option value=5>副食品</option>
        </select>
        <label style="font-size:15px;">市场:</label>
        <select id="area_select_2" style="width: 240px;height:30px;">
            <option value=1 selected="selected">请选择</option>
        </select>
        <input type="button" id="area_queryButton" style="width:70px;height:30px;" value="查询"/>
    </div>


    <script>
        $(document).ready(function () {

            function area_getName(){
                console.log("嘤嘤嘤嘤嘤");
                var area_type = $("#area_select_1").find("option:selected").text();
                $.ajax({
                    type:"GET",
                    url:"http://localhost:8080/agriculture/areaGetName",
                    contentType:"UTF-8",
                    data:{
                        type:area_type
                    },
                    success:function (data) {
                        data=data.substring(1,data.length-1);
                        var arrayData = data.split(",");
                        for (var i = 0; i < arrayData.length; i++) {
                            var tempOpt = document.createElement('option');
                            $(tempOpt).attr('value',i+2);
                            $(tempOpt).text(arrayData[i]);
                            $("#area_select_2").append(tempOpt);
                        }
                    }
                })
            }

            function getAreaPriceData(){
                console.log("嘤嘤嘤");

            }

            // 接口尚未实现，先行注释
            // $("#area_select_1").change(area_getName);
            $("#area_queryButton").click(getAreaPriceData);
        })
    </script>
    <link rel="stylesheet" href="./css/stylesheet.css">
</body>
</html>