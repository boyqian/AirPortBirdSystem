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
  <title>鸟类类别管理</title>
  <link rel="stylesheet" href="<%=basePath %>layui/css/layui.css">
  <script type="text/javascript" src="<%=basePath %>layui/layui.js"></script>
  <script type="text/javascript" src="<%=basePath%>js/jquery-3.2.1.js"></script>
</head>
<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">鸟类可视化管理系统</div>
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
        <li class="layui-nav-item"><a href="<%=basePath %>/index.jsp">视图查看</a></li>
      </ul>
    </div>
  </div>
  
<div class="layui-body">
 <a href="<%=basePath %>record/addRecord.jsp"><button class="layui-btn layui-btn-sm">
    添加<i class="layui-icon">&#xe654;</i>
  </button></a>
<table id="demo" lay-filter="record"></table>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="detail">编辑查看</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>           
<script>
layui.use('table', function(){
  var table = layui.table;

  //监听表格复选框选择
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  layui.laytpl.toDateString = function(d, format){
	    var date = new Date(d || new Date())
	    ,ymd = [
	      this.digit(date.getFullYear(), 4)
	      ,this.digit(date.getMonth() + 1)
	      ,this.digit(date.getDate())
	    ]
	    ,hms = [
	      this.digit(date.getHours())
	      ,this.digit(date.getMinutes())
	      ,this.digit(date.getSeconds())
	    ];

	    format = format || 'yyyy-MM-dd HH:mm:ss';

	    return format.replace(/yyyy/g, ymd[0])
	    .replace(/MM/g, ymd[1])
	    .replace(/dd/g, ymd[2])
	    .replace(/HH/g, hms[0])
	    .replace(/mm/g, hms[1])
	    .replace(/ss/g, hms[2]);
	  };
	  //数字前置补零
	  layui.laytpl.digit = function(num, length, end){
	    var str = '';
	    num = String(num);
	    length = length || 2;
	    for(var i = num.length; i < length; i++){
	      str += '0';
	    }
	    return num < Math.pow(10, length) ? str + (num|0) : num;
	  };
  table.render({
	  elem:'#demo'
	  ,height:520
	  ,url:'/bird/selectRecord'
	  ,page:true
	  ,limit:10
	  ,cols: [[
		{type:'checkbox', fixed: 'left'},
		{field: 'recordId',title:'记录ID',width:120, sort: true},
		{field: 'birdName',title:'鸟名称',width:120, sort: true},
		{field: 'num', title: '数量', width:160,sort: true}, 
		{field: 'height', title: '高度', width:160,sort: true},
		{field: 'area', title: '出现区域', width:160,sort: true}, 
		{field: 'time', title: '记录时间', width: 180, templet: '<div>{{ layui.laytpl.toDateString(d.time) }}</div>',sort: true},
	    {width:178, align:'center', toolbar: '#barDemo',title:'操作'}
	  ]]
	  ,jump:function(obj,first){//触发分页后的回调
		  alert("ok");
		  if(!first){//点击跳页触发函数自身，并传递当前页：obj.curr
			  $('#demo').remove();
		  		
		  }
	  }
	});

  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  //监听工具条
  table.on('tool(record)', function(obj){
    var data= obj.data;
    if(obj.event === 'detail'){
    	$.ajax({
      		type:'post',
        	url:'<%=basePath%>/selectRecordById',
        	data:{"recordId":data.recordId},
        	success:function(result){
        		layer.open({
        			  type: 1, 
        			  area: ['400px', '500px'],
        			  title:'记录详情-'+result.recordId,
        			  content: "<form class='layui-form' action='<%=basePath%>/updateRecord' method='post'>"
       				   +" <div class='layui-form-item'>"
    				   +"</div>"
        				   +"<div class='layui-form-item'>"
        				   +"<div class='layui-inline'>"
        				   +" <label class='layui-form-label'>鸟类名称</label>"
        				   +"<div class='layui-input-inline'>"
        				   +"<input type='hidden' name='recordId'  value='"+result.recordId+"'>"
        				   +"<input type='tel' name='typeName' autocomplete='off' class='layui-input' value='"+result.birdId+"'>"
        				   +" </div> </div> </div>"
        				   +"<div class='layui-form-item'>"
        				   +"<div class='layui-input-block'>"
        				   +"<button class='layui-btn' lay-submit='' lay-filter='demo1'>提交更改</button>"
        				   +"</div></div>"
        				   +"</form>"
        			});
        	},
        	error:function(){
        		layer.msg("查看失败，请重新操作！");
        	}
        }); 
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        //执行删除
     	 $.ajax({
      		type:'post',
        	url:'<%=basePath%>/deleteRecord',
        	data:{"recordId":data.recordId},
        	success:function(result){
        		layer.msg("删除成功");
        	},
        	error:function(){
        		layer.msg("删除失败，请重新操作！");
        	}
        }); 
      	obj.del();
        layer.close(index);
      });
    }
  });
});
</script>
</div>
</div>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>