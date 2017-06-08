<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
<link rel="stylesheet" href="../shop/resources/css/show.css">
<title>表单一体化定制</title>
</head>
<body>	
 <input type="hidden" value="<%=request.getContextPath()%>" id="path">
	<div id="head">
		<div id="logo" style="float: left;">
			<img alt="科大国创" src="../shop/resources/images/ustc.png">
		</div>
		
	</div>
         <!-- 用于页面的预览  -->
	 	<div id="preview" class="show-div1">
	 		<div style="margin: 15px;">
	 			<form action="/shop/saveMessage" method="POST">
		 		<ul>
	<!-- 	 			<li> -->
	<!-- 	 				<p>sdfgretgetgergter gergergre</p> -->
	<!-- 	 				<p></p> -->
	<!-- 	 			</li> -->
		 		</ul>
		 			<input type="submit" />
		 		</form>
	 		</div>
	 	</div>
	 	
	 	
	 	
	 	
	 	
	
<script type="text/javascript"  src="../shop/resources/js/jquery-1.11.0.min.js"></script>	
<script type="text/javascript"  src="../shop/resources/js/jquery-ui.min.js"></script>	
<script type="text/javascript"  src="../shop/resources/layerdialoger/layer.js"></script>
<script type="text/javascript"  src="../shop/resources/layui/layui.js"></script>
<script type="text/javascript"  src="../shop/resources/js/index.js"></script>
<script type="text/javascript"  src="../shop/resources/js/index2.js"></script>
<script type="text/javascript"  src="../shop/resources/js/jquery.citys.js"></script>
 <script>
	 var path = $("#path").val();
	 $(function(){
		 toPreview();
	 });
	</script>
		
	

</body>
</html>