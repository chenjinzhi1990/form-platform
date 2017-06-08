<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery热气球动画背景登录框</title>

<link rel="stylesheet" href="../shop/resources/css/main.css">
<link rel="stylesheet" href="../shop/resources/layui/css/layui.css">

</head>
<body>


<div class="login">
    <div class="box png">
		<div class="logo png"></div>
		<div class="input">
			<div class="log">
				
				<div class="name">
					<label >用户名:</label><input type="text" class="text" id="value_1" placeholder="3-10位汉字、数字、字母、下划线" name="value_1" tabindex="1">
				</div>
				<div class="email">
				 <label>邮箱地址:</label><input type="text" class="text" id="value_2" placeholder="邮箱" name="value_3" tabindex="2">
				</div>
				
				<div class="pwd">
					<label>登录密码:</label><input type="password" class="text" id="value_3" placeholder="6-20位字母数字组合" name="value_5" tabindex="3">
					
				</div>
				<div class="pwd">
					<label>确认密码:</label><input type="password" class="text" id="value_4" placeholder="6-20位字母数字组合" name="value_2" tabindex="4">
					
					<input type="button" id="submit" class="submit" tabindex="5" value="注册">
					
					
					<div class="check"></div>
				</div>
				
				
				
				
				<div class="tip"></div>
			</div>
		</div>
	</div>
    <div class="air-balloon ab-1 png"></div>
	<div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
</div>

<script type="text/javascript" src="../shop/resources/js/jQuery.js"></script>
<script type="text/javascript" src="../shop/resources/js/fun.base.js"></script>
<script type="text/javascript" src="../shop/resources/js/script.js"></script>
<script type="text/javascript" src="../shop/resources/js/register.js"></script>
<script type="text/javascript"  src="../shop/resources/layerdialoger/layer.js"></script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
</div>
</body>
</html>