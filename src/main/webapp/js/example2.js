(function () {
    require.config({
        paths: {
            echarts: './js'
        },
        packages: [
            {
                name: 'BMap',
                location: './js',
                main: 'main'
            }
        ]
    });

    require(
    [
        'echarts',
        'BMap',
        'echarts/chart/map'
    ],
    function (echarts, BMapExtension) {

        // 初始化地图
        var BMapExt = new BMapExtension($('#bMap')[0], BMap, echarts,{
           // enableMapClick: false
        	disableMapClick: true
        });
        var map = BMapExt.getMap();
        var container = BMapExt.getEchartsContainer();

        var startPoint = {
            x: 104.114129,
            y: 37.550339
        };

        var point = new BMap.Point(startPoint.x, startPoint.y);
        map.centerAndZoom(point, 5);
      //  map.enableScrollWheelZoom(false);//开启滚动缩放
    //	map.enableContinuousZoom(false);//开启缩放平滑
        map.disableScrollWheelZoom();
        map.disableContinuousZoom(false);
        map.disableDragging();     //禁止拖拽
        map.disableDoubleClickZoom();//禁用双击放大。
        /*map.enableDragging(); */
    	//addControl(map);
        // 地图自定义样式
        
        option = {
            color: ['gold','aqua','lime'],
           /* title : {
                text: null,
                subtext:'数据纯属虚构',
                x:'center',
                textStyle : {
                    color: 'black'
                }
            },*/
            tooltip : {
                trigger: 'item',
                formatter: function (v) {
                    return v[1].replace(':', ' > ');
                }
            },
            /*legend: {
                orient: 'vertical',
                x:'left',
                data:['北京', '上海', '广州'],
                selectedMode: 'single',
                selected:{
                    '上海' : false,
                    '广州' : false
                },
                textStyle : {
                    color: '#fff'
                }
            },*/
           /* toolbox: {
                show : true,
                orient : 'vertical',
                x: 'right',
                y: 'center',
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },*/
            dataRange: {
                min : 0,
                max : da[da.length-1].value,
                x: 'right',
                calculable : false,
                color: ['#ff3333', 'orange', 'yellow','lime','aqua'],
                textStyle:{
                    color:'#fff'
                }
            },
            series : [
                {
                    name:'北京',
                    type:'map',
                    mapType: 'none',
                    data:[],
                    geoCoord: {
                    	"安徽":[117.17,31.52],
                    	"北京":[116.24,39.55],
                    	"重庆":[106.54,29.59],
                    	"福建":[119.18,26.05],
                    	"甘肃":[103.51,36.04],
                    	"广东":[113.14,23.08],
                    	"广西":[108.19,22.48],
                    	"贵州":[106.42,26.35],
                    	"海南":[110.20,20.02],
                    	"河北":[114.30,38.02],
                    	"河南":[113.40,34.46],
                    	"黑龙江":[126.36,45.44],
                    	"湖北":[114.17,30.35],
                    	"湖南":[112.59,28.12],
                    	"吉林":[125.19,43.54],
                    	"江苏":[118.46,32.03],
                    	"江西":[28.40,115.55],
                    	"辽宁":[123.25,41.48],
                    	"内蒙古":[111.41,40.48],
                    	"宁夏":[106.16,38.27],
                    	"青海":[101.48,36.38],
                    	"山东":[117.00,36.40],
                    	"山西":[112.33,37.54],
                    	"陕西":[108.57,34.17],
                    	"上海":[121.29,31.14],
                    	"四川":[104.04,30.40],
                    	"天津":[117.12,39.02],
                    	"西藏":[91.08,29.39],
                    	"新疆":[87.36,43.45],
                    	"云南":[102.42,25.04],
                    	"浙江":[120.10,30.16],
                    	"香港":[115.12,21.23],
                    	"澳门":[115.07,21.33],
                    	"台湾":[121.30,25.03]
                    },
                    markPoint : {
                        symbol:'emptyCircle',
                        symbolSize : function (v){
                            return 10 + v/10
                        },
                        effect : {
                            show: true,
                            shadowBlur : 0
                        },
                        itemStyle:{
                            normal:{
                                label:{show:false}
                            }
                        },
                        data : da
                    }

                }
            ]
        };

        var myChart = BMapExt.initECharts(container);
        window.onresize = myChart.onresize;
        BMapExt.setOption(option);
    }
);
})();

//添加比例尺
function addControl(map){
	var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
	var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
	/*缩放控件type有四种类型:
	BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
	map.addControl(top_left_control);        
	map.addControl(top_left_navigation);     
	map.addControl(top_right_navigation);  
}