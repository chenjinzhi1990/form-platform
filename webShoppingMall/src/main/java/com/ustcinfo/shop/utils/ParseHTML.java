package com.ustcinfo.shop.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class ParseHTML {

	
	  public String  parseFormHTML(String formhtml){
		  
		  Document preview = Jsoup.parse(formhtml);
		  //这样就获得了表单的名字
		  String formname  = preview.select("h1").text();
		  //获取表单的详细描述
		  String formdesc=preview.getElementById("titleanddes").select("span").text();
		  //获取表单中的内容
		  
		  
		  
		return null;
	  }
}
