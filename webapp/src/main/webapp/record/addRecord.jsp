<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
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
  <title>鸟类管理</title>
  <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
  <script type="text/javascript" src="<%=basePath%>layui/layui.js"></script>
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
 
 <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; ">
  <legend>添加记录信息</legend>
</fieldset>
<form class="layui-form" action="<%=basePath%>addRecord" method="post">
   <div class="layui-form-item">
   <div class="layui-inline">
      <label class="layui-form-label">鸟名称</label>
      <div class="layui-input-inline">
         <select name=birdId" id="birdName">
          <option value="0">请选择</option>
        </select>
      </div>
    </div>
  </div>
    <div class="layui-form-item">
  <div class="layui-inline">
      <label class="layui-form-label">区域</label>
      <div class="layui-input-inline">
      <input type="tel" name="area" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
      <div class="layui-form-item">
  <div class="layui-inline">
      <label class="layui-form-label">数量</label>
      <div class="layui-input-inline">
      <input type="tel" name="num" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
      <div class="layui-form-item">
  <div class="layui-inline">
      <label class="layui-form-label">高度</label>
      <div class="layui-input-inline">
      <input type="tel" name="height" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
  <div class="layui-input-block">
  ${msg}
  </div>
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">提交添加</button>
    </div>
  </div>
</form>  
</div>
</div>
<script>
//JavaScript代码区域
layui.use('form', function(){
  var form = layui.form;
  
});
</script>
<script type="text/javascript">
      $(document).ready(function(){
    	  function init(obj){
    		  return $(obj).html("<option value='0'>请选择</option>");
    	  }
     
      $.ajax({
    	  url:'<%=basePath%>findAllBird',
    	  type:'get',
    	  dataType:'json',
    	  success:function(data){
    		  getMessage(data);
    	  }
      });
      function getMessage(data){
    	  init($('#birdName'));
    	  for(var i in data){
    		  var result=" <option value='" + data[i].birdId + "'>" + data[i].birdName + "</option>"
    	  	  $('#birdName').append(result);
    	  }
      }
      });
</script>
</body>
</html> 
        