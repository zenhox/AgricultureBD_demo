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
        <div id="map">
            <div id="price-map">
            </div>
        </div>
    </div>



    <script type="text/javascript" src="js/highcharts.js"></script>
    <script type="text/javascript" src="js/radialIndicator.min.js"></script>
    <script type="text/javascript" src="js/jquery.dialogBox.js"></script>
    <script type="text/javascript" src="js/echarts.js"></script>
    <script type="text/javascript" src="js/koala.min.1.5.js"></script>
    <script type="text/javascript" src="js/geoJson/china-main-city/china.js"></script>
    <script>
        $(document).ready(function () {
            areaAllData=[];

            function area_getName(){
                //查询的日期
                var area_Date = $('#areaQueryDate').val();
                var area_type = $("#area_select_1").find("option:selected").text();
                $.ajax({
                    type:"GET",
                    url:"http://localhost:8080/agriculture/areaGetName",
                    contentType:"UTF-8",
                    data:{
                        type:area_type,
                        date:area_Date
                    },
                    success:function (data) {
                        $("#area_select_2").html('<option value=1 selected="selected">请选择</option>');
                        data=data.substring(1,data.length-1);
                        console.log(data);
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
                var area_Date = $('#areaQueryDate').val();
                var area_type = $("#area_select_1").find("option:selected").text();
                var area_name = $("#area_select_2").find("option:selected").text();
                areaAllData=[];
                $.ajax({
                    type:"GET",
                    url:"http://localhost:8080/agriculture/areaGetAllData",
                    contentType:"UTF-8",
                    data:{
                        type:area_type,
                        date:area_Date,
                        name:area_name
                    },
                    success:function (data) {

                        var arrayData = data.split(",")
                        for(var i=0;i<arrayData.length;i++){
                            var singleData=arrayData[i].split(":");
                            areaSingleData={
                                name:singleData[0],
                                value:parseFloat(singleData[1])
                            }
                            areaAllData.push(areaSingleData);
                        }

                        $.getJSON('./js/geoJson/china-main-city/china.json', function (data) {
                            echarts.registerMap('china', data);
                            var myChart = echarts.init(document.getElementById('price-map'));

                            var Mydata = areaAllData;

                            var yData = [];

                            //排序
                            Mydata.sort(function(o1, o2) {
                                if (isNaN(o1.value) || o1.value == null) return -1;
                                if (isNaN(o2.value) || o2.value == null) return 1;
                                return o1.value - o2.value;
                            });

                            //左侧图显示
                            for (var i = 0; i < Mydata.length; i++) {
                                yData.push(Mydata[i].name);
                            }
                            //修改
                            var MaxData=parseInt(Mydata[Mydata.length-1].value)+1;
                            console.log(MaxData);

                            var option = {
                                //title设置
                                title: {
                                    text: '全国平均价格分布图',
                                    textStyle: {
                                        fontSize: 50
                                    },
                                    x: '0'
                                },
                                //鼠标事件，显示对应区域地名与价格
                                tooltip: {
                                    show: true,
                                    formatter: function(params) {
                                        return params.name + '：' + params.data['value']+'元/斤'
                                    },
                                },
                                //左下角图形参数设置

                                visualMap: {
                                    type: 'continuous',
                                    text: ['高', '低'],
                                    showLabel: true,
                                    seriesIndex: [0],
                                    min: 0,
                                    max: MaxData,
                                    textStyle: {
                                        color: '#000'
                                    },
                                    bottom: 50,
                                    left: 'left',
                                },
                                grid: {
                                    right: 10,
                                    top: 80,
                                    bottom: 30,
                                    width: '20%'
                                },
                                //控制左侧图形x轴
                                xAxis: {
                                    type: 'value',
                                    scale: true,
                                    position: 'top',
                                    splitNumber: 1,
                                    boundaryGap: false,
                                    splitLine: {
                                        show: false
                                    },
                                    axisLine: {
                                        show: false
                                    },
                                    axisTick: {
                                        show: false
                                    },
                                    axisLabel: {
                                        margin: 2,
                                        textStyle: {
                                            color: 'black'
                                        }
                                    }
                                },
                                yAxis: {
                                    type: 'category',
                                    nameGap: 16,
                                    axisLine: {
                                        show: false,
                                        lineStyle: {
                                            color: '#ddd'
                                        }
                                    },
                                    axisTick: {
                                        show: false,
                                        lineStyle: {
                                            color: '#ddd'
                                        }
                                    },
                                    //左侧显示地名
                                    axisLabel: {
                                        interval: 0,
                                        textStyle: {
                                            color: 'black'
                                        }
                                    },
                                    data: yData
                                },
                                geo: {
                                    roam: true,
                                    map: 'china',
                                    left: 'left',
                                    right:'300',
                                    layoutSize: '80%',
                                    label: {
                                        emphasis: {
                                            show: false
                                        }
                                    },
                                    itemStyle: {
                                        emphasis: {
                                            areaColor: '#fff464'
                                        }
                                    },
                                    regions: [{
                                        name: '南海诸岛',
                                        value: 0,
                                        itemStyle: {
                                            normal: {
                                                opacity: 0,
                                                label: {
                                                    show: true
                                                }
                                            }
                                        }
                                    }],
                                },
                                series: [{
                                    name: 'mapSer',
                                    type: 'map',
                                    roam: false,
                                    geoIndex: 0,
                                    label: {
                                        show: false,
                                    },
                                    data: Mydata
                                }, {
                                    name: 'barSer',
                                    type: 'bar',
                                    roam: false,
                                    visualMap: false,
                                    zlevel: 2,
                                    barMaxWidth: 20,
                                    itemStyle: {
                                        normal: {
                                            color: '#ff8240'
                                        },
                                        emphasis: {
                                            color: "#3596c0"
                                        }
                                    },
                                    label: {
                                        normal: {
                                            show: false,
                                            position: 'right',
                                            offset: [0, 10]
                                        },
                                        emphasis: {
                                            show: true,
                                            position: 'right',
                                            offset: [10, 0]
                                        }
                                    },
                                    data: Mydata
                                }]
                            };
                            myChart.setOption(option);
                        });

                    }
                })

            }

            // 接口尚未实现，先行注释
            $("#area_select_1").change(area_getName);
            $("#area_queryButton").click(getAreaPriceData);
        })
    </script>
    <link rel="stylesheet" href="./css/stylesheet.css">
</body>
</html>