<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>蔬菜动态可视化</title>
	<link rel="stylesheet" href="./css/stylesheet.css">
</head>
<script src="./js/jquery-3.3.1.min.js"></script>
<body>
    <center>
        <%--<input type="file" id="inputfile" name="fileContent">--%>
        <%--下拉框--%>
        <div id="div2" style="margin-left:auto">
            <label style="font-size:15px;">省份:</label>
            <select id="animate_select_1" style="width: 160px;height:30px;">
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
            <select id="animate_select_2" style="width: 240px;height:30px;">
                <option value=1 selected="selected">请选择</option>
            </select>
            <label style="font-size:15px;">品类:</label>
            <select id="animate_select_3" style="width:160px;height:30px;">
                <option value=1 selected="selected">请选择</option>
            </select>
            <label style="font-size: 15px;">品名:</label>
            <select id="animate_select_4" style="width:160px;height:30px;">
                <option value=1 selected="selected">请选择</option>
            </select>

            <button id="addButton" class="slide">添加</button>
            <button id="cleanButton" class="slide">清空</button>
            <button id="queryButton" class="slide">查询</button>
        </div>
            <label for="staDate">开始日期：</label><input id="staDate" type="date" value="2018-01-01"/>
            <label for="endDate">结束日期：</label><input id="endDate" type="date" value="2018-08-01"/>
        <div class="Top_Record" >
            <table id= "allInf" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#d8d8d8" class="m_t_5">
                <tr>
                    <td width="20%" height="30" align="center" bgcolor="#FFFFFF" class="B">省份</td>
                    <td width="35%" height="30" align="center" bgcolor="#FFFFFF" class="B">市场</td>
                    <td width="15%" height="30" align="center" bgcolor="#FFFFFF" class="B">类型</td>
                    <td width="30%" height="30" align="center" bgcolor="#FFFFFF" class="B">品名</td>
                </tr>
            </table>
            <td height="30" colspan="5" valign="top">
                <table width="100%" border="0" align="center" id="showInfTable" cellpadding="0" cellspacing="0" class="f_s_14">
                </table>
            </td>
        </div>
        <%--动画播放标签--%>
            <svg id="animatePlayer" width="1200" height="700"></svg>



        <%--引入的js脚本--%>
		<script src="./js/d3.js"></script>
        <script src="./js/config.js"></script>
        <script src="./js/visual.js"></script>
        <script>
           $(document).ready(function () {
               var animate_province=null;
               var animate_market=null;
               var animate_type=null;
               var animate_name=null;
               var currentInf=0;
               var data = [];
               var animate_data="name,type,value,date\n";

               function animate_getMarket(){
                   animate_province = $("#animate_select_1").find("option:selected").text();
                   $.ajax({
                       type:"GET",
                       url:"http://localhost:8080/agriculture/getMarket",
                       contentType:"UTF-8",
                       data:{
                           province:animate_province
                       },
                       success:function (data) {
                           data=data.substring(1,data.length-1);
                           var arrayData = data.split(",");
                           $("#animate_select_2").html('<option value=1 selected="selected">请选择</option>');
                           $("#animate_select_3").html('<option value=1 selected="selected">请选择</option>');
                           $("#animate_select_4").html('<option value=1 selected="selected">请选择</option>');
                           for (var i = 0; i < arrayData.length; i++) {
                               var tempOpt = document.createElement('option');
                               $(tempOpt).attr('value',i+2);
                               $(tempOpt).text(arrayData[i]);
                               $("#animate_select_2").append(tempOpt);
                           }
                       }
                   })
               }
               function animate_getType(){
                   animate_market = $("#animate_select_2").find("option:selected").text();
                   $.ajax({
                       type:"GET",
                       url:"http://localhost:8080/agriculture/getType",
                       data:{
                           province:animate_province,
                           market:animate_market
                       },
                       success:function (data) {
                           $("#animate_select_3").html('<option value=1 selected="selected">请选择</option>');
                           $("#animate_select_4").html('<option value=1 selected="selected">请选择</option>');
                           data=data.substring(1,data.length-1);
                           var arrayData = data.split(",");
                           for (var i = 0; i < arrayData.length; i++) {
                               var tempOpt = document.createElement('option');
                               $(tempOpt).attr('value',i+2);
                               $(tempOpt).text(arrayData[i]);
                               $("#animate_select_3").append(tempOpt);
                           }
                       }
                   })
               }
               function animate_getName(){
                   animate_type = $("#animate_select_3").find("option:selected").text();
                   $.ajax({
                       type:"GET",
                       url:"http://localhost:8080/agriculture/getName",
                       data:{
                           province:animate_province,
                           market:animate_market,
                           type:animate_type
                       },
                       success:function (data) {
                           $("#animate_select_4").html('<option value=1 selected="selected">请选择</option>');
                           data=data.substring(1,data.length-1);
                           var arrayData = data.split(",");
                           for (var i = 0; i < arrayData.length; i++) {
                               var tempOpt = document.createElement('option');
                               $(tempOpt).attr('value',i+2);
                               $(tempOpt).text(arrayData[i])
                               $("#animate_select_4").append(tempOpt);
                           }
                       }
                   })
               }

               // 根据表格获取所有数据
               function getAllInf(){
                   var start_Date = $('#staDate').val();
                   var end_Date = $("#endDate").val();
                   for (var i=0;i<currentInf;i++){
                       $.ajax({
                           async: false,
                           type:"GET",
                           url:"http://localhost:8080/agriculture/getDataForContrast.do",
                           data:{
                               province:data[i].province,
                               market:data[i].market,
                               type:data[i].type,
                               name:data[i].name,
                               startDate:start_Date,
                               endDate:end_Date
                           },
                           success:function (data) {
                               animate_data = animate_data + data;
                               //console.log(animate_data);
                               // if(i==currentInf-1){
                               //     console.log("所有数据获取完毕");
                               //     console.log(animate_data);
                               //     startAnimate(animate_data);
                               //
                               // }
                           }
                       })
                        //console.log(animate_data);
                   }
                   console.log(animate_data);
                   document.getElementById("animatePlayer").innerHTML="";
                   // 清空动画播放标签，防止重复播放
                   startAnimate(animate_data);
                   animate_data="name,type,value,date\n";
               }
               function showTable(data) {
                   var flagment = document.createDocumentFragment();
                   for (var i = 0; i < data.length; i++) {
                       var templi = document.createElement('tr');

                       var tempEm1  = document.createElement('td');
                       tempEm1.innerText = data[i].province;
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
                       tempEm3.innerText = data[i].type;
                       tempEm3.style.width="179.17";
                       tempEm3.style.height="30";
                       tempEm3.style.textAlign="center";
                       templi.appendChild(tempEm3);

                       var tempEm4  = document.createElement('td');
                       tempEm4.innerText = data[i].name;
                       tempEm4.style.width="358.33";
                       tempEm4.style.height="30";
                       tempEm4.style.textAlign="center";
                       templi.appendChild(tempEm4);

                       flagment.appendChild(templi)
                   }
                   $('#showInfTable').append(flagment)
               }
               function addOneInf(){
                   animate_name = $("#animate_select_4").find("option:selected").text();

                   if (animate_province=="请选择" ||animate_market=="请选择"||animate_type=="请选择"||animate_name=="请选择" || currentInf>=10){
                       alert("选择有误或选择条目超过10个，请重新选择");
                   }else{
                       document.getElementById("showInfTable").innerHTML = "";
                       data.push(
                           {
                               province:animate_province,
                               market :animate_market,
                               type :animate_type,
                               name :animate_name
                           }
                       )
                       showTable(data);
                       currentInf++;
                   }

               }
               function delAllInf(){
                   document.getElementById("showInfTable").innerHTML = "";
                   data=[];
                   currentInf=0;
               }


               $("#animate_select_1").change(animate_getMarket);
               $("#animate_select_2").change(animate_getType);
               $("#animate_select_3").change(animate_getName);
               $("#queryButton").click(getAllInf);
               $("#addButton").click(addOneInf);
               $("#cleanButton").click(delAllInf);
           })
        </script>
        <link rel="stylesheet" href="./css/stylesheet.css">
    </center>


</body>
</html>