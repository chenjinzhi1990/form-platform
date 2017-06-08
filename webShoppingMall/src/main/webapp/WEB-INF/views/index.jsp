<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
String pwd=session.getAttribute("user").toString();
application.setAttribute("pwd", pwd);
application.setAttribute("flag",session.getAttribute("flag"));

%> 

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="../shop/resources/layui/css/layui.css">
<link rel="stylesheet" href="../shop/resources/layerdialoger/skin/layer.css">
<link rel="stylesheet" href="../shop/resources/css/jquery-ui.min.css">
<link rel="stylesheet" href="../shop/resources/layui/css/layui.css">
<link rel="stylesheet" href="../shop/resources/css/index.css">
<link rel="stylesheet" href="http://www.jqueryui.org.cn/Application/Home/View/Public/css/style.css">
<link rel="stylesheet" href="../shop/resources/css/common.css">
<link rel="stylesheet" href="../shop/resources/css/cssreset-min.css">




<title>表单一体化定制</title>
</head>
<body>	
 <input type="hidden" value="<%=request.getContextPath()%>" id="path">
	<div id="head">
		<div id="logo" style="float: left;">
			<img alt="科大国创" src="../shop/resources/images/ustc.png">
		</div>
		
			<ul class="layui-nav" lay-filter="demo">
					<li   class="layui-nav-item layui-this">
						<a href="">创建表单</a>
						<dl class="layui-nav-child">
							<dd><a href="">创建新表单</a></dd>
						</dl>
					</li>
<!-- 					  <li class="layui-nav-item layui-this"> -->
					<li class="layui-nav-item">
					    <a href="/shop/datasource">数据源</a>
<!-- 					    <dl class="layui-nav-child"> -->
<!-- 					      <dd><a href="">选项1</a></dd> -->
<!-- 					      <dd><a href="">选项2</a></dd> -->
<!-- 					      <dd><a href="">选项3</a></dd> -->
<!-- 					    </dl> -->
					 </li>
					 <li class="layui-nav-item"><a href="">数据处理</a></li>
					 <li class="layui-nav-item"><a href="/shop/toPreview">已创建表单</a></li>
<!-- 					 <li class="layui-nav-item"> -->
<!-- 					    <a href="javascript:;">解决方案</a> -->
<!-- 					    <dl class="layui-nav-child"> -->
<!-- 					      <dd><a href="">移动模块</a></dd> -->
<!-- 					      <dd><a href="">后台模版</a></dd> -->
<!-- 					      <dd class="layui-this"><a href="">选中项</a></dd> -->
<!-- 					      <dd><a href="">电商平台</a></dd> -->
<!-- 					    </dl> -->
<!-- 			      </li> -->
				 
			</ul>
		</div>
			
	 			<div id="container">
	 				<div id="left">
	 					<div id="products">
	 						<div class="ui-widget-header" style="width: 200px;height: 30px;">
								<div onclick="showformcontro(this)" style="cursor:pointer;position: relative; float: left; width: 100px;height: 30px;                 
							 				text-align: center;color: white;font-weight: bold;">表单组件</div>
								<div onclick="showformTemplate(this)" style="cursor:pointer;position: relative; float: left; width: 100px;height: 30px;                 
							 				text-align: center;color: white;font-weight: bold;">表单模板 </div>
							 </div>
							  <div id="catalog">
							    	<div id="formcontro">
							      		<ul style="cursor:move;">
									        <li><div>单行文本框</div></li>
									        <li><div>多行文本框</div></li>
									        <li><div>下拉框</div></li>
									        <li><div>多选框</div></li>
									        <li><div>密码框</div></li>
									        <li><div>单选框</div></li>
									        <li><div>日期</div></li>
									        <li><div>地址</div></li>
									        <li><div>文件的上传</div></li>
									        <li><div>分割线</div></li>
							      		</ul>
							    	</div>
							    	<div style="display: none;" id="formTemplate">
							    		<ul style="cursor:move;">
							    			<li><div class="Template"><div>员工入职表</div></div></li>
							    			<li><div class="Template"><div>请假流程表</div></div></li>
							    			<li><div class="Template"><div>采购表</div></div></li>
							    		</ul>
							    	</div>
							  </div>
						</div>
	 				</div>
	 				
	 				<div id="middle">
						<div id="cart">
							<div id="titleanddes">
							  <h1 class="ui-widget-header">表单名称</h1>
							  <div style="background-color: #f6a828;color: #fff;width: 750px;height: 50px;"><span >表单描述</span></div>
							 </div>
							  <div class="ui-widget-content">
							    <ol id="contorli">
							      <li class="placeholder"><img alt="" src="../shop/resources/images/arrow.png">从左边拖拽控件来创建你想要的表单</li>
							    </ol>
							    <div>
							    	<div id="buttons" style=" width: 100px; height: 25px;margin: 0px auto;">
							    	       <input type="button" onclick="toPreview()" value="预览";/>
							    	       <input type="button" id="save" value="保存"/>
							    	</div>
							    </div>
							  </div>
					</div>
	 				</div>
	 				<div id="right">
	 					<div id="attrtitle">
		 					<div>
		 						<div class='controlattr' style="cursor:pointer;position: relative; float: left; width: 115px;height: 25px;                 
							 				text-align: center;color: white;font-weight: bold;">控件属性</div>
		   						<div class='formattr' style="cursor:pointer; position: relative;  float: left; width: 115px;height: 25px;
		  										text-align: center;color: white;font-weight: bold;">表单属性</div>	
		 					</div>
	 					</div>
	 					<ul  style="margin-top: 25px;" id="showAttr">
	 						  
	 					</ul>
	 					<ul  style="margin-top: 25px;" id="showformAttr">
	 						  <li>
	 						  	<p>表单提交校验</p>
	 						  	<input type="button" value="添加提交校验条件"/>
	 						  </li>
	 						  <li>
	 						  	<p>数据源的绑定</p>
	 						  	<button><a href="/shop/datasource" >添加数据源</a></button>
	 						  </li>
	 					</ul>
	 					
	 				</div>
	 				
	 	</div>
             <!-- 用于页面的预览  -->
	 	<div id="preview" style="display: none;">
	 		<div style="margin: 15px;">
		 		<ul>
	<!-- 	 			<li> -->
	<!-- 	 				<p>sdfgretgetgergter gergergre</p> -->
	<!-- 	 				<p></p> -->
	<!-- 	 			</li> -->
		 		</ul>
	 		</div>
	 	</div>
	 	
	 	
	 	
	 	
	 	
	
<script type="text/javascript"  src="../shop/resources/js/jquery-1.11.0.min.js"></script>	
 <script>
	 var path = $("#path").val()
	</script>
<script type="text/javascript"  src="../shop/resources/js/jquery-ui.min.js"></script>	
<script type="text/javascript"  src="../shop/resources/layerdialoger/layer.js"></script>
<script type="text/javascript"  src="../shop/resources/layui/layui.js"></script>
<script type="text/javascript"  src="../shop/resources/js/index.js"></script>
<script type="text/javascript"  src="../shop/resources/js/index2.js"></script>
<script type="text/javascript"  src="../shop/resources/js/jquery.citys.js"></script>

		
	

</body>
</html>