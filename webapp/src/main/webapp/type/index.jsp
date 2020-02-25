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
 <a href="<%=basePath %>type/addType.jsp"><button class="layui-btn layui-btn-sm">
    添加<i class="layui-icon">&#xe654;</i>
  </button></a>
 <div class="demoTable">
  搜索类型：
  <div class="layui-inline">
    <input class="layui-input" name="type_name" id="demoReload" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
  <div class="layui-inline">
 <a id="deltype"> 
 <button class="layui-btn layui-btn-danger" data-type="getCheckData">
 批量删除<i class="layui-icon">&#xe640;</i>
 </button></a>
</div>
</div>
<table id="demo" lay-filter="type"></table>
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
  
  table.render({
	  elem:'#demo'
	  ,height:520
	  ,url:'/bird/selectType'
	  ,page:true
	  ,limit:10
	  ,cols: [[
		{type:'checkbox', fixed: 'left'},
		{field: 'typeId',title:'ID',width:120, sort: true},
	    {field: 'typeName', title: '类型', width:400,sort: true}, 
	    {width:178, align:'center', toolbar: '#barDemo',title:'操作'}
	  ]]
	  ,jump:function(obj,first){//触发分页后的回调
		  alert("ok");
		  if(!first){//点击跳页触发函数自身，并传递当前页：obj.curr
			  $('#demo').remove();
		  		
		  }
	  }
	});
  //事件
 	var active = {
 	//表格的重载
    reload: function(){
      var demoReload = $('#demoReload');
      
      //执行重载
      table.reload('demo', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
          //key: {
            type_name: demoReload.val()
         // }
        }
      });
    },
 	//获取选中数据
<%--  	getCheckData: function(){ 
	      var checkStatus = table.checkStatus('demo')
	      ,data = checkStatus.data;
	      layer.confirm('真的删除所选行么', function(index){
	          //执行批量删除
	          var type = new Array()
	          for(var i=0;i<data.length;i++){
	        	  type[i]=data[i].type_id;
	          }
	      	 $.ajax({
	       		type:'post',
	         	url:'<%=basePath%>type/deleteType',
	         	data:{"type":type},
	         	traditional: true,//属性在这里设置
	         	success:function(result){
	         		layer.msg("删除成功");
	         		window.setTimeout("window.location.href='<%=basePath%>admin/user.jsp'",500);
	         	},
	         	error:function(){
	         		layer.msg("删除失败，请重新操作！");
	         	}
	         }); 
	      });
	    }  --%>
  
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  //监听工具条
  table.on('tool(type)', function(obj){
    var data= obj.data;
    if(obj.event === 'detail'){
    	$.ajax({
      		type:'post',
        	url:'<%=basePath%>/selectTypeById',
        	data:{"typeId":data.typeId},
        	success:function(result){
        		layer.open({
        			  type: 1, 
        			  area: ['400px', '200px'],
        			  title:'鸟类详情-'+result.typeName,
        			  content: "<form class='layui-form' action='<%=basePath%>/updateType' method='post'>"
       				   +" <div class='layui-form-item'>"
    				   +"</div>"

        				   +"<div class='layui-form-item'>"
        				   +"<div class='layui-inline'>"
        				   +" <label class='layui-form-label'>类型名称</label>"
        				   +"<div class='layui-input-inline'>"
        				   +"<input type='hidden' name='typeId'  value='"+result.typeId+"'>"
        				   +"<input type='tel' name='typeName' autocomplete='off' class='layui-input' value='"+result.typeName+"'>"
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
        	url:'<%=basePath%>/deleteType',
        	data:{"typeId":data.typeId},
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