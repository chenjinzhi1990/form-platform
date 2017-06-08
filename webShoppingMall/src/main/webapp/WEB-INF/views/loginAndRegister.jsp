<%@page pageEncoding="utf-8" contentType="text/html;utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>表单定制</title>
	
	<link rel="stylesheet" href="../shop/resources/css/login.css">
	<link rel="stylesheet" href="../shop/resources/css/rdc.min.css">
	<link rel="stylesheet" href="../shop/resources/layui/css/layui.css">
</head>
<body>

<div class="box">
    <img class="user-avater" src="../shop/resources/images/user-4.png"/>

 <form class="signin-form"  id="lilin"  method="post">
 
 			<input type="hidden" id="text" value=<%=application.getAttribute("flag") %>>
            <div >
                <input class="form-control form-input" id="username"  placeholder="用户名" type="text" name="username"/>
            </div>
            
            <div class="" style="margin: 20px 0;">
                <input class="form-control form-input" id="password" placeholder="密   码" type="password" value=<%=application.getAttribute("pwd") %> name="password"/>
            </div>
            
            
            <div class="save-div">
                <input type="checkbox" class="save-checkbox" value="yes"  id="rempwd" />
                <span class="save-pass">记住密码</span>
                
            </div> 
            <input type="button" id="submitss" class="btn btn-primary btn-submit" value="登&nbsp;&nbsp;录">
      		<span class="signup">还没有账户，立即<a class="signup-a" id="toRegister"  href="/shop/toRegister">注册</a></span>
        </form>

</div>



<script type="text/javascript"  src="../shop/resources/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"  src="../shop/resources/layui/layui.js"></script>
<script type="text/javascript"  src="../shop/resources/js/login.js"></script>
<script type="text/javascript"  src="../shop/resources/layerdialoger/layer.js"></script>
<script type="text/javascript"  src="../shop/resources/js/rdc.min.js"></script>
</body>
</html>
