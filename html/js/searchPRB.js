function loadattrs(){
for(var i = 0;i < 100; i ++){

$("#attr").append('<option value="第'+i+'个PRB上检测到的干扰噪声的平均值（毫瓦分贝）"></option>');
}
}
//页面加载完时加载此函数
window.onload = function(){
loadattrs();
}


function getInfo(){
    var startTime;
    startTime=document.getElementById('startTime').value;
    
    console.log(startTime);

    var endTime;
    endTime=document.getElementById('endTime').value;
    console.log(endTime);

    var name;
    name=document.getElementById('txt_name').value;
    console.log(name);

    var attr;
    attr=document.getElementById('txt_attr').value;
    console.log(attr);

if (startTime==""||endTime==""||name==""||attr=="") {
    	alert("不允许为空！请检查搜索信息！");
    }
 else{

 var myChart = "";
    // 路径配置
    require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });

    // 使用
    require(
        [
            'echarts',
            'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            myChart = ec.init(document.getElementById('main'));

            
            // 为echarts对象加载数据
          //  myChart.setOption(option);
  
        }
    );

     require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });

    // 使用
    require(
        [
            'echarts',
            'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('main2'));
            
            var option1 = {
                title : {
                    text: 'PRB指标信息查询',
                    subtext: name
                },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:[attr]
                },
                grid:{
                    containLabel:true
                },
                calculable : true,
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap : false,
                        data : ['7.11','7.12','7.13','7.14','7.15']
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        axisLabel : {
                            formatter: '{value} %'
                        }
                    }
                ],
                series : [
                    {
                         name:attr,
                        type:'line',
                        data:[56, 78, 46, 34, 65, 35],
                    }
                ]
            };
            // 为echarts对象加载数据
            myChart.setOption(option1);
        }
    );
}
    }