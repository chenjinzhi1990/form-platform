package com.ustcinfo.shop.utils;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class ParseHTMLByhttpclient {

	
	public static String  previewCode(){
		
		try {

			HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
			CloseableHttpClient client = httpClientBuilder.build();

		
			HttpGet httpGet = new HttpGet("http://127.0.0.1:8080/shop/toIndex");
			httpGet.setHeader("User-Agent", "OSX Intel Chrome");
			HttpResponse getresponse = client.execute(httpGet);
			HttpEntity getentity = getresponse.getEntity();
			String getrespContent = EntityUtils.toString(getentity, "utf-8");
			
			Document preview = Jsoup.parse(getrespContent);
			Element contentbaidu = preview.getElementById("middle");
			

			return contentbaidu.toString();

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

		
		
	}
	
	public static void main(String[] args) {
		System.out.println(previewCode());
	}
	
}
