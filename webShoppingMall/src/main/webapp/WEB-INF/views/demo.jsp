<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>表单一体化定制</title>
<link rel="stylesheet" href="http://www.jqueryui.org.cn/Application/Home/View/Public/jqueryui/jquery-ui.css">
<link rel="stylesheet" href="http://www.jqueryui.org.cn/Application/Home/View/Public/css/style.css">

 
 
 

<script type="text/javascript"  src="http://www.jqueryui.org.cn/Application/Home/View/Public/jqueryui/jquery-1.9.1.js"></script>	
<script type="text/javascript"  src="http://www.jqueryui.org.cn/Application/Home/View/Public/jqueryui/jquery-ui.js"></script>	
<style>
  h1 { padding: .2em; margin: 0; }
  #products { float:left; width: 500px; margin-right: 2em; }
  #cart { width: 200px; float: left; margin-top: 1em; }
  /* 定义列表样式，以便最大化 droppable */
  #cart ol { margin: 0; padding: 1em 0 1em 3em; }
  </style>
  <script>
  $(function() {
    $( "#catalog" ).accordion();   //折叠面板
    $( "#catalog li" ).draggable({
      appendTo: "body",
      helper: "clone"
    });
    $( "#cart ol" ).droppable({
      activeClass: "ui-state-default",
      hoverClass: "ui-state-hover",
      accept: ":not(.ui-sortable-helper)",
      drop: function( event, ui ) {
        $( this ).find( ".placeholder" ).remove();
        $( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );
      }
    }).sortable({
      items: "li:not(.placeholder)",
      sort: function() {
        // 获取由 droppable 与 sortable 交互而加入的条目
        // 使用 connectWithSortable 可以解决这个问题，但不允许您自定义 active/hoverClass 选项
        $( this ).removeClass( "ui-state-default" );
      }
    });
  });
  </script>
</head>
<body>
 
<div id="products">
  <h1 class="ui-widget-header">产品</h1>
  <div id="catalog">
    <h2><a href="#">T-Shirts</a></h2>
    <div>
      <ul>
        <li>Lolcat Shirt</li>
        <li>Cheezeburger Shirt</li>
        <li>Buckit Shirt</li>
      </ul>
    </div>
    <h2><a href="#">Bags</a></h2>
    <div>
      <ul>
        <li>Zebra Striped</li>
        <li>Black Leather</li>
        <li>Alligator Leather</li>
      </ul>
    </div>
    <h2><a href="#">Gadgets</a></h2>
    <div>
      <ul>
        <li>iPhone</li>
        <li>iPod</li>
        <li>iPad</li>
      </ul>
    </div>
  </div>
</div>
 
<div id="cart">
  <h1 class="ui-widget-header">购物车</h1>
  <div class="ui-widget-content">
    <ol>
      <li class="placeholder">添加产品到这里</li>
    </ol>
  </div>
</div>
 
 
</body>
</html>