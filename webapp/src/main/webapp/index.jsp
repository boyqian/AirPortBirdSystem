<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>鸟类可视化管理系统</title>
  <link rel="stylesheet" href="<%=basePath %>layui/css/layui.css">
  <script type="text/javascript" src="<%=basePath %>layui/layui.js"></script>
  <script type="text/javascript" src="<%=basePath%>js/jquery-3.2.1.js"></script>
  <script type="text/javascript" src="<%=basePath %>js/echarts.min.js" charset="utf-8"></script>
</head>
<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">可视化鸟类管理 系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
     		  张恒
        </a>
      </li>
    </ul>
  </div>
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item"><a href="<%=basePath %>type/index.jsp">鸟类管理</a></li>
        <li class="layui-nav-item"><a href="<%=basePath %>bird/index.jsp">鸟名管理</a></li>
        <li class="layui-nav-item"><a href="<%=basePath %>record/index.jsp">记录管理</a></li>
        <li class="layui-nav-item"><a href="<%=basePath %>index.jsp">视图查看</a></li>
      </ul>
    </div>
  </div>
  
<div class="layui-body">
  <div class="layui-row">
    <div class="layui-col-md6">
      <div class="grid-demo">
     <div id="main2" style="width: 800px;height:400px;"></div>
      </div>
    </div>
    <div class="layui-col-md6">
      <div class="grid-demo">
      	 <div id="main4" style="width: 800px;height:400px;"></div>
      </div>
    </div>
  </div>
    <div class="layui-row">
    <div class="layui-col-md6">
      <div class="grid-demo">
      <div id="main" style="width: 800px;height:400px;"></div>
      </div>
    </div>
    <div class="layui-col-md6">
      <div class="grid-demo">
     <div id="main3" style="width: 800px;height:400px;"></div>
      </div>
    </div>
  </div>
</div>
</div>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'<%=basePath%>findBirdNameAndNum',
		dataType:'json',
		success:function(result){
			//开始初始化数据
			 var myChart = echarts.init(document.getElementById('main'));
			 option = {
					    title : {
					        text: '已记录鸟类信息',
					        x:'center'
					    },
					    tooltip : {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    },
					    series : [
					        {
					            name: '名称',
					            type: 'pie',
					            radius : '55%',
					            center: ['50%', '60%'],
					            data:result,
					            itemStyle: {
					                emphasis: {
					                    shadowBlur: 10,
					                    shadowOffsetX: 0,
					                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					                }
					            }
					        }
					    ]
					};
			 myChart.setOption(option);
		}
	});
	
	$.ajax({
		type:'post',
		url:'<%=basePath%>findBirdNameAndNum',
		dataType:'json',
		success:function(result){
	 		var birdName=new Array();
			var Num=new Array();
		    for(var i=0;i<result.lenght;i++){
		    	birdName.push(result[i].name);
		    	Num.push(result[i].value);
			 }; 
			//开始初始化数据
			 var myChart2 = echarts.init(document.getElementById('main2'));
			 var option2 = {
			            title: {
			                text: '信息展示'
			            },
			            tooltip: {},
			            legend: {
			                data:['折线图']
			            },
			            xAxis: {
			                data: ["燕子","乌鸦","金头鸟"]
			            },
			            yAxis: {},
			            series: [{
			                name: '名称：数量',
			                type: 'line',
			                data: [12,56,25]
			            }]
			        };
			 myChart2.setOption(option2);
		}
	});
	/////////
	$.ajax({
		type:'post',
		url:'<%=basePath%>findBubble',
		dataType:'json',
		success:function(data){
			console.log("Bubble"+data);
			console.log("Bubble0::"+data[0]);
			console.log("Bubble0::"+data[0].day);
			console.log("Bubble0::value:day:"+data[0][0].day);
	/* 		var data = [
			    	    [[1,77,17,'6只','\nA','\n2018-08-01 12:00:00'],[2,77.4,20,'4只','\nB','\n2018-08-01 12:00:00'],[14,68,11,'18只','\nC','\n2018-08-01 12:00:00'],[4,74.7,10582082,'3只','\nC','\n2018-08-01 12:00:00'],[24,75,4,'2只','\nA','\n2018-08-01 12:00:00']],
			    	    [[6,81.8,23,'6只','\nN','\n2018-08-01 12:00:00'],[22,81.7,35,'4只','\nN','\n2018-08-01 12:00:00'],[23,76.9,13,'18只','\nF','\n2018-08-01 12:00:00'],[24,78.5,11,'3只','\nB','\n2018-08-01 12:00:00'],[30,80.8,5,'2只','\nD','\n2018-08-01 12:00:00']],
			            [[27,67,17,'36只','\nA','\n2018-08-01 12:00:00'],[12,73.4,27,'4只','\nN','\n2018-08-01 12:00:00'],[13,58,11,'2只','\nB','\n2018-08-01 12:00:00'],[18,58.7,10,'23只','\nF','\n2018-08-01 12:00:00'],[7,56,4,'12只','\nD','\n2018-08-01 12:00:00']]
			    	]; */
		/* 	var myChart3=echarts.init(document.getElementById('main3'));
			    	option3 = {
			    	    backgroundColor: new echarts.graphic.RadialGradient(0.3, 0.3, 0.8, [{
			    	        offset: 0,
			    	        color: '#f7f8fa'
			    	    }, {
			    	        offset: 1,
			    	        color: '#cdd0d5'
			    	    }]),  
			    	    title: {
			    	        text: '本月鸟类分布全方位模型'
			    	    },
			    	    legend: {
			    	        right: 10,
			    	        data: ['麻雀', '小云雀','大鸟']
			    	    },
			    	     xAxis: {
			    	        splitLine: {
			    	            lineStyle: {
			    	                type: 'dashed'
			    	            }
			    	        }
			    	    },
			    	    yAxis: {
			    	        splitLine: {
			    	            lineStyle: {
			    	                type: 'dashed'
			    	            }
			    	        },
			    	        scale: true
			    	    }, 
			    	    series: [
			    	        {
			    	        name: '麻雀',
			    	        data: data[0],
			    	        type: 'scatter',
			    	        symbolSize: function (data) {
			    	            return data[2];
			    	        },
			    	        label: {
			    	            emphasis: {
			    	                show: true,
			    	                formatter: function (param) {
			    	                    return param.data[3]+param.data[4]+param.data[5];
			    	                },
			    	                position: 'top'
			    	            }
			    	        },
			    	        itemStyle: {
			    	            normal: {
			    	                shadowBlur: 10,
			    	                shadowColor: 'rgba(120, 36, 50, 0.5)',
			    	                shadowOffsetY: 5,
			    	                color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
			    	                    offset: 0,
			    	                    color: 'rgb(251, 118, 123)'
			    	                }, {
			    	                    offset: 1,
			    	                    color: 'rgb(204, 46, 72)'
			    	                }])
			    	            }
			    	        }
			    	    }, {
			    	        name: '小云雀',
			    	        data: data[1],
			    	        type: 'scatter',
			    	        symbolSize: function (data) {
			    	            return data[2];
			    	        },
			    	        label: {
			    	            emphasis: {
			    	                show: true,
			    	                formatter: function (param) {
			    	                    return param.data[3]+param.data[4]+param.data[5];
			    	                },
			    	                position: 'top'
			    	            }
			    	        },
			    	        itemStyle: {
			    	            normal: {
			    	                shadowBlur: 10,
			    	                shadowColor: 'rgba(25, 100, 150, 0.5)',
			    	                shadowOffsetY: 5,
			    	                color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
			    	                    offset: 0,
			    	                    color: 'rgb(129, 227, 238)'
			    	                }, {
			    	                    offset: 1,
			    	                    color: 'rgb(25, 183, 207)'
			    	                }])
			    	            }
			    	        }
			    	    },{ 
			    	    	name: '大鸟',
			    	        data: data[2],
			    	        type: 'scatter',
			    	        symbolSize: function (data) {
			    	            return data[2];
			    	        },
			    	        label: {
			    	            emphasis: {
			    	                show: true,
			    	                formatter: function (param) {
			    	                    return param.data[3]+param.data[4]+param.data[5];
			    	                },
			    	                position: 'top'
			    	            }
			    	        },
			    	        itemStyle: {
			    	            normal: {
			    	                shadowBlur: 10,
			    	                shadowColor: 'rgba(130, 6, 50, 0.5)',
			    	                shadowOffsetY: 5,
			    	                color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
			    	                    offset: 0,
			    	                    color: 'rgb(200, 18, 133)'
			    	                }, {
			    	                    offset: 1,
			    	                    color: 'rgb(24, 46, 72)'
			    	                }])
			    	            }
			    	        }
			    	    }]
			    	};
			    	myChart3.setOption(option3); */
		}
		
	});
	
	

	    	
	    	$.ajax({
	    		type:'post',
	    		url:'<%=basePath%>findArea',
	    		dataType:'json',
	    		success:function(result){
	    			console.log(result);
	    			var myChart4=echarts.init(document.getElementById('main4'));
	    	    	option4 = {
	    	    		    tooltip : {
	    	    		        trigger: 'axis',
	    	    		        axisPointer : {
	    	    		            type: 'shadow'
	    	    		        }
	    	    		    },
	    	    		    title: {
	    		    	        text: '地区总共出现的鸟的数量'
	    		    	    },
	    	    		    legend: {
	    	    		        data:['A','B','C','D','F','N']
	    	    		    },
	    	    		    toolbox: {
	    	    		        show : true,
	    	    		        orient : 'vertical',
	    	    		        y : 'center',
	    	    		        feature : {
	    	    		            mark : {show: true},
	    	    		            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
	    	    		            restore : {show: true},
	    	    		            saveAsImage : {show: true}
	    	    		        }
	    	    		    },
	    	    		    calculable : true,
	    	    		    xAxis : [
	    	    		        {
	    	    		            type : 'category',
	    	    		            data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
	    	    		        }
	    	    		    ],
	    	    		    yAxis : [
	    	    		        {
	    	    		            type : 'value',
	    	    		            splitArea : {show : true}
	    	    		        }
	    	    		    ],
	    	    		    grid: {
	    	    		        x2:40
	    	    		    },
	    	    		    series : [
	    	    		        {
	    	    		            name:'A',
	    	    		            type:'bar',
	    	    		            stack: '总量',
	    	    		            data:result[0]
	    	    		        },
	    	    		        {
	    	    		            name:'B',
	    	    		            type:'bar',
	    	    		            stack: '总量',
	    	    		            data:result[1]
	    	    		        },
	    	    		        {
	    	    		            name:'C',
	    	    		            type:'bar',
	    	    		            stack: '总量',
	    	    		            data:result[2]
	    	    		        },
	    	    		        {
	    	    		            name:'D',
	    	    		            type:'bar',
	    	    		            stack: '总量',
	    	    		            data:result[3]
	    	    		        },
	    	    		        {
	    	    		            name:'F',
	    	    		            type:'bar',
	    	    		            stack: '总量',
	    	    		            data:result[4]
	    	    		        },
	    	    		        {
	    	    		            name:'N',
	    	    		            type:'bar',
	    	    		            stack: '总量',
	    	    		            data:result[5]
	    	    		        }
	    	    		    ]
	    	    		};
	    	    	myChart4.setOption(option4);
	    		}
	    	});
	    	
	
});
</script>
</body>
</html>