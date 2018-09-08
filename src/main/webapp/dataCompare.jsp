<%@ page language="java" pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import="java.util.*" %>

<html>
<head>
    <%--<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>--%>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>--%>
    <script type="text/javascript" src="./js/echarts.js"></script>
    <title>全国农业市场信息大数据分析平台</title><link rel="shortcut icon" href="images/yn.png"  /></link>
    <script src='http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js'></script>
</head>
<body>

<div id="static_main" style="width: 1200px;height:400px;"></div>

<script>
    //初始化Echart
    var static_myChart=echarts.init(document.getElementById('static_main'));
    option = {
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['1','2','3','4','5']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['bar', 'stack', ]},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        dataZoom:[{type:'inside',start:10,end:60},{type:'slider',start:10,end:60}],
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                data : []
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'1',
                type:'line',
                tiled: '总量',

                emphasis : {
                    label : {show: true}},
                itemStyle : {
                },
                data:[]
            },
            {
                name:'2',
                type:'line',
                tiled: '总量',
                smooth: true,
                emphasis : {
                    label : {show: true}},
                itemStyle : {
                },
                data:[
                ]
            },
            {
                name:'3',
                type:'line',
                tiled: '总量',
                emphasis : {
                    label : {show: true}},
                itemStyle : {
                },

                data:[]
            },
            {
                name:'4',
                type:'line',
                tiled: '总量',
                emphasis : {
                    label : {show: true}},
                itemStyle : {
                },

                data:[]
            },
            {
                name:'5',
                type:'line',
                tiled: '总量',
                emphasis : {
                    label : {show: true}},
                itemStyle : {
                },

                data:[]
            },
        ]
    };

    function static_unique(array){
        var n = [array[0]]; //结果数组
        //从第二项开始遍历
        for(var i = 1; i < array.length; i++) {
            //如果当前数组的第i项在当前数组中第一次出现的位置不是i，
            //那么表示第i项是重复的，忽略掉。否则存入结果数组
            if (array.indexOf(array[i]) == i) n.push(array[i]);
        }
        return n;
    }


    static_myChart.setOption(option);
    $(document).ready(function () {
        var static_date1=[];//获取到的原始数据
        var static_date2=[];
        var static_date3=[];
        var static_date4=[];
        var static_date5=[];
        var static_dateCombine=[];//日期合并
        var static_Finaldate=[];//日期去重
        var static_price1=[];//获取到的原始数据
        var static_price2=[];
        var static_price3=[];
        var static_price4=[];
        var static_price5=[];
        var static_price1Final=[];//按照Echart要求对应最终日期处理了上述的原始数据
        var static_price2Final=[];
        var static_price3Final=[];
        var static_price4Final=[];
        var static_price5Final=[];
        var static_province=null;
        var static_market=null;
        var static_type=null;
        var static_name=null;
        var static_currentInf=0;
        var static_data=[];



        //以下是获取数据并且绘制折线比较图的界面
        function static_getGraph(){

            /* if (static_currentInf!=3){
                   alert("请选择3个品种");
                   return;
               }
             */

            var province = static_data[0].province;
            var market = static_data[0].market;
            var type = static_data[0].type;
            var name = static_data[0].name;

            console.log("条目1"+province+market+type+name);
            $.ajax({
                async: false,
                url:"http://localhost:8080/agriculture/datePrice/"+province+"/"+market+"/"+type+"/"+name+".do",
                success:function(result) {
                    result = eval("("+result+")");
                    console.log(result);

                    static_date1= result.date;
                    static_price1=result.price;
                    if(static_currentInf==1)
                    {     static_Finaldate=static_date1;
                        static_price1Final=static_price1;

                        static_myChart.setOption({
                            xAxis:{data: static_Finaldate},
                            series:[{name:'1',symbolSize: 6,data:static_price1Final}]
                        });
                        return;
                    }

                },error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("选项有误，请检查选项是否有问题或与系统管理员联系");
                }
            });
            getGraphStep2();
        }

        function getGraphStep2(){



            var province = static_data[1].province;
            var market = static_data[1].market;
            var type = static_data[1].type;
            var name = static_data[1].name;

            console.log("条目2"+province+market+type+name);
            $.ajax({
                async: false,
                url:"http://localhost:8080/agriculture/datePrice/"+province+"/"+market+"/"+type+"/"+name+".do",
                success:function(result) {

                    result = eval("("+result+")");
                    console.log(result);
                    static_date2= result.date;
                    static_price2=result.price;
                    if(static_currentInf==2)
                    {
                        static_dateCombine=static_date1.concat(static_date2);
                        static_Finaldate=static_unique(static_dateCombine);
                        static_Finaldate.sort(AscSort);
                        for(var i=0;i<static_Finaldate.length;i++)
                        {

                            for(var j=0;j<static_date1.length;j++)
                            {
                                if(static_Finaldate[i]==static_date1[j])
                                {
                                    static_price1Final[i]=static_price1[j];
                                    break;
                                }
                                else {
                                    static_price1Final[i]="-"
                                }
                            }
                        }
                        for(var i=0;i<static_Finaldate.length;i++)
                        {

                            for(var j=0;j<static_date2.length;j++)
                            {
                                if(static_Finaldate[i]==static_date2[j])
                                {
                                    static_price2Final[i]=static_price2[j];
                                    break;
                                }
                                else {
                                    static_price2Final[i]="-"
                                }
                            }
                        }



                        static_myChart.setOption({
                            xAxis:{data: static_Finaldate},
                            series:[{name:'1',symbolSize: 6,data:static_price1Final},{name:'2',symbolSize: 6,data:static_price2Final}]
                        });
                        return;
                    }

                },error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("选项有误，请检查选项是否有问题或与系统管理员联系");
                }
            });
            getGraphStep3();
            /* 刷新查询 */

        }

        function getGraphStep3(){



            var province = static_data[2].province;
            var market = static_data[2].market;
            var type = static_data[2].type;
            var name = static_data[2].name;

            console.log("条目3" + province+market+type+name);
            $.ajax({
                async: false,
                url:"http://localhost:8080/agriculture/datePrice/"+province+"/"+market+"/"+type+"/"+name+".do",
                success:function(result) {

                    result = eval("("+result+")");

                    console.log(result);
                    static_date3= result.date;
                    static_price3=result.price;

                    if(static_currentInf==3) {
                        /*日期组合：横坐标更新 生成横坐标参数*/

                        static_dateCombine = static_date1.concat(static_date2);
                        static_dateCombine = static_dateCombine.concat(static_date3);
                        static_Finaldate = static_unique(static_dateCombine);
                        static_Finaldate.sort(AscSort);

                        /*生成价格参数*/
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date1.length; j++) {
                                if (static_Finaldate[i] == static_date1[j]) {
                                    static_price1Final[i] = static_price1[j];
                                    break;
                                }
                                else {
                                    static_price1Final[i] = "-"
                                }
                            }
                        }
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date2.length; j++) {
                                if (static_Finaldate[i] == static_date2[j]) {
                                    static_price2Final[i] = static_price2[j];
                                    break;
                                }
                                else {
                                    static_price2Final[i] = "-"
                                }
                            }
                        }
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date3.length; j++) {
                                if (static_Finaldate[i] == static_date3[j]) {
                                    static_price3Final[i] = static_price3[j];
                                    break;
                                }
                                else {
                                    static_price3Final[i] = "-"
                                }
                            }
                        }
                        /*参数赋值 画图*/


                        static_myChart.setOption({
                            xAxis: {data: static_Finaldate},
                            series: [{name: '1', symbolSize: 6, data: static_price1Final}, {
                                name: '2',
                                symbolSize: 6,
                                data: static_price2Final
                            }, {name: '3', symbolSize: 6, data: static_price3Final}]
                        });
                        return;
                    }
                    $("#static_div1").html(result);
                },error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("选项有误，请检查选项是否有问题或与系统管理员联系");
                }

            });
            getGraphStep4();
        }

        function getGraphStep4(){



            var province = static_data[3].province;
            var market = static_data[3].market;
            var type = static_data[3].type;
            var name = static_data[3].name;

            console.log("条目4" + province+market+type+name);
            $.ajax({
                async: false,
                url:"http://localhost:8080/agriculture/datePrice/"+province+"/"+market+"/"+type+"/"+name+".do",
                success:function(result) {

                    result = eval("("+result+")");

                    console.log(result);
                    static_date4= result.date;
                    static_price4=result.price;

                    if(static_currentInf==4) {
                        /*日期组合：横坐标更新 生成横坐标参数*/

                        static_dateCombine = static_date1.concat(static_date2);
                        static_dateCombine = static_dateCombine.concat(static_date3);
                        static_dateCombine = static_dateCombine.concat(static_date4);
                        static_Finaldate = static_unique(static_dateCombine);
                        static_Finaldate.sort(AscSort);

                        /*生成价格参数*/
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date1.length; j++) {
                                if (static_Finaldate[i] == static_date1[j]) {
                                    static_price1Final[i] = static_price1[j];
                                    break;
                                }
                                else {
                                    static_price1Final[i] = "-"
                                }
                            }
                        }
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date2.length; j++) {
                                if (static_Finaldate[i] == static_date2[j]) {
                                    static_price2Final[i] = static_price2[j];
                                    break;
                                }
                                else {
                                    static_price2Final[i] = "-"
                                }
                            }
                        }
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date3.length; j++) {
                                if (static_Finaldate[i] == static_date3[j]) {
                                    static_price3Final[i] = static_price3[j];
                                    break;
                                }
                                else {
                                    static_price3Final[i] = "-"
                                }
                            }
                        }
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date4.length; j++) {
                                if (static_Finaldate[i] == static_date4[j]) {
                                    static_price4Final[i] = static_price4[j];
                                    break;
                                }
                                else {
                                    static_price4Final[i] = "-"
                                }
                            }
                        }
                        /*参数赋值 画图*/


                        static_myChart.setOption({
                            xAxis: {data: static_Finaldate},
                            series: [{name: '1', symbolSize: 6, data: static_price1Final}, {
                                name: '2',

                                symbolSize: 6,
                                data: static_price2Final
                            }, {name: '3', symbolSize: 6, data: static_price3Final},
                                {name:'4',symbolSize:6,data:static_price4Final}]
                        });
                        return;
                    }
                    $("#static_div1").html(result);
                },error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("选项有误，请检查选项是否有问题或与系统管理员联系");
                }

            });
            getGraphStep5();
        }

        function getGraphStep5(){



            var province = static_data[4].province;
            var market = static_data[4].market;
            var type = static_data[4].type;
            var name = static_data[4].name;

            console.log("条目5" + province+market+type+name);
            $.ajax({
                async: false,
                url:"http://localhost:8080/agriculture/datePrice/"+province+"/"+market+"/"+type+"/"+name+".do",
                success:function(result) {

                    result = eval("("+result+")");

                    console.log(result);
                    static_date5= result.date;
                    static_price5=result.price;

                    if(static_currentInf==5) {
                        /*日期组合：横坐标更新 生成横坐标参数*/

                        static_dateCombine = static_date1.concat(static_date2);
                        static_dateCombine = static_dateCombine.concat(static_date3);
                        static_dateCombine = static_dateCombine.concat(static_date4);
                        static_dateCombine = static_dateCombine.concat(static_date5);
                        static_Finaldate = static_unique(static_dateCombine);
                        static_Finaldate.sort(AscSort);

                        /*生成价格参数*/
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date1.length; j++) {
                                if (static_Finaldate[i] == static_date1[j]) {
                                    static_price1Final[i] = static_price1[j];
                                    break;
                                }
                                else {
                                    static_price1Final[i] = "-"
                                }
                            }
                        }
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date2.length; j++) {
                                if (static_Finaldate[i] == static_date2[j]) {
                                    static_price2Final[i] = static_price2[j];
                                    break;
                                }
                                else {
                                    static_price2Final[i] = "-"
                                }
                            }
                        }
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date3.length; j++) {
                                if (static_Finaldate[i] == static_date3[j]) {
                                    static_price3Final[i] = static_price3[j];
                                    break;
                                }
                                else {
                                    static_price3Final[i] = "-"
                                }
                            }
                        }
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date4.length; j++) {
                                if (static_Finaldate[i] == static_date4[j]) {
                                    static_price4Final[i] = static_price4[j];
                                    break;
                                }
                                else {
                                    static_price4Final[i] = "-"
                                }
                            }
                        }
                        for (var i = 0; i < static_Finaldate.length; i++) {

                            for (var j = 0; j < static_date5.length; j++) {
                                if (static_Finaldate[i] == static_date5[j]) {
                                    static_price5Final[i] = static_price5[j];
                                    break;
                                }
                                else {
                                    static_price5Final[i] = "-"
                                }
                            }
                        }
                        /*参数赋值 画图*/


                        static_myChart.setOption({
                            xAxis: {data: static_Finaldate},
                            series: [{name: '1',  symbolSize: 6, data: static_price1Final}, {
                                name: '2',
                                symbolSize: 6,
                                data: static_price2Final
                            }, {name: '3',  symbolSize: 6, data: static_price3Final},
                                {name:'4',symbolSize:6,data:static_price4Final},
                                {name:'5',symbolSize:6,data:static_price5Final}]
                        });
                        return;
                    }
                    $("#static_div1").html(result);
                },error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("选项有误，请检查选项是否有问题或与系统管理员联系");
                }

            });

        }



        /*排序*/
        function  AscSort(x, y)
        {
            return  x  ==  y  ?   0  : (x  >  y  ?   1  :  - 1 );
        }

        //以下是动态获取下拉框内容的函数
        function static_getMarket(){
            static_province = $("#static_select_1").find("option:selected").text();
            $.ajax({
                type:"GET",
                url:"http://localhost:8080/agriculture/getMarket",
                contentType:"UTF-8",
                data:{
                    province:static_province
                },
                success:function (data) {
                    data=data.substring(1,data.length-1);
                    var arrayData = data.split(",");
                    $("#static_select_2").html('<option value=1 selected="selected">请选择</option>');
                    $("#static_select_3").html('<option value=1 selected="selected">请选择</option>');
                    $("#static_select_4").html('<option value=1 selected="selected">请选择</option>');
                    for (var i = 0; i < arrayData.length; i++) {
                        var tempOpt = document.createElement('option');
                        $(tempOpt).attr('value',i+2);
                        $(tempOpt).text(arrayData[i]);
                        $("#static_select_2").append(tempOpt);
                    }
                }
            })
        }
        function static_getType(){
            static_market = $("#static_select_2").find("option:selected").text();
            $.ajax({
                type:"GET",
                url:"http://localhost:8080/agriculture/getType",
                data:{
                    province:static_province,
                    market:static_market
                },
                success:function (data) {
                    $("#static_select_3").html('<option value=1 selected="selected">请选择</option>');
                    $("#static_select_4").html('<option value=1 selected="selected">请选择</option>');
                    data=data.substring(1,data.length-1);
                    var arrayData = data.split(",");
                    for (var i = 0; i < arrayData.length; i++) {
                        var tempOpt = document.createElement('option');
                        $(tempOpt).attr('value',i+2);
                        $(tempOpt).text(arrayData[i]);
                        $("#static_select_3").append(tempOpt);
                    }
                }
            })
        }
        function static_getName(){
            static_type = $("#static_select_3").find("option:selected").text();
            $.ajax({
                type:"GET",
                url:"http://localhost:8080/agriculture/getName",
                data:{
                    province:static_province,
                    market:static_market,
                    type:static_type
                },
                success:function (data) {
                    $("#static_select_4").html('<option value=1 selected="selected">请选择</option>');
                    data=data.substring(1,data.length-1);
                    var arrayData = data.split(",");
                    for (var i = 0; i < arrayData.length; i++) {
                        var tempOpt = document.createElement('option');
                        $(tempOpt).attr('value',i+2);
                        $(tempOpt).text(arrayData[i])
                        $("#static_select_4").append(tempOpt);
                    }
                }
            })
        }

        // 根据表格获取所有数据
        function static_getAllInf(){
            for (var i=0;i<currentInf;i++){
                $.ajax({
                    async: false,
                    type:"GET",
                    url:"http://localhost:8080/agriculture/getDataForContrast.do",
                    data:{
                        province:data[i].province,
                        market:data[i].market,
                        type:data[i].type,
                        name:data[i].name
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
        //动态添加表格中的数据
        function static_showTable(static_data) {
            var flagment = document.createDocumentFragment();
            for (var i = 0; i < static_data.length; i++) {
                var templi = document.createElement('tr');

                var tempEm1  = document.createElement('td');
                tempEm1.innerText = static_data[i].province;
                tempEm1.style.width="240";
                tempEm1.style.height="30";
                tempEm1.style.textAlign="center";
                templi.appendChild(tempEm1);

                var tempEm2  = document.createElement('td');
                tempEm2.innerText = static_data[i].market;
                tempEm2.style.width="418.33";
                tempEm2.style.height="30";
                tempEm2.style.textAlign="center";
                templi.appendChild(tempEm2);

                var tempEm3  = document.createElement('td');
                tempEm3.innerText = static_data[i].type;
                tempEm3.style.width="179.17";
                tempEm3.style.height="30";
                tempEm3.style.textAlign="center";
                templi.appendChild(tempEm3);

                var tempEm4  = document.createElement('td');
                tempEm4.innerText = static_data[i].name;
                tempEm4.style.width="358.33";
                tempEm4.style.height="30";
                tempEm4.style.textAlign="center";
                templi.appendChild(tempEm4);

                flagment.appendChild(templi)
            }
            $('#static_showInfTable').append(flagment)
        }
        function static_addOneInf(){
            static_name = $("#static_select_4").find("option:selected").text();

            if (static_province=="请选择" ||static_market=="请选择"||static_type=="请选择"||static_name=="请选择" || static_currentInf>=5){
                alert("选择有误或选择条目超过5个，请重新选择");
            }else{
                document.getElementById("static_showInfTable").innerHTML = "";
                static_data.push(
                    {
                        province:static_province,
                        market :static_market,
                        type :static_type,
                        name :static_name
                    }
                )
                static_showTable(static_data);
                static_currentInf++;
            }

        }
        function static_delAllInf(){
            document.getElementById("static_showInfTable").innerHTML = "";
            //清空当前条目数量
            static_currentInf=0;
            //清空暂存数据
            static_data=[];
            //清空Echart
            static_myChart.setOption(option);
        }


        $("#static_select_1").change(static_getMarket);
        $("#static_select_2").change(static_getType);
        $("#static_select_3").change(static_getName);

        $("#static_queryButton").click(static_getGraph);

        $("#static_addButton").click(static_addOneInf);
        $("#static_cleanButton").click(static_delAllInf);
    })
</script>
<div id="static_div1"></div>
<div id="static_div2" style="margin-left:50px;">
    <label style="font-size:15px;">省份:</label>
    <select id="static_select_1" style="width: 160px;height:30px;">
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
    <select id="static_select_2" style="width: 240px;height:30px;">
        <option value=1 selected="selected">请选择</option>
    </select>
    <label style="font-size:15px;">品类:</label>
    <select id="static_select_3" style="width:160px;height:30px;">
        <option value=1 selected="selected">请选择</option>
    </select>
    <label style="font-size: 15px;">品名:</label>
    <select id="static_select_4" style="width:160px;height:30px;">
        <option value=1 selected="selected">请选择</option>
    </select>

    <button id="static_addButton" class="slide">添加</button>
    <button id="static_cleanButton" class="slide">清空</button>
    <button id="static_queryButton" class="slide">查询</button>

</div>
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
        <table width="100%" border="0" align="center" id="static_showInfTable" cellpadding="0" cellspacing="0" class="f_s_14">
        </table>
    </td>
</div>
</body>
</html>