package com.ashin.core;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

/**
 * 响应类的工具类
 * 
 * @author ashin Liang
 *
 */
public class ResponseUtils {
	
	public static void sendContentToWeb(HttpServletResponse resp,String type,String content){
		try {
			resp.setContentType(type);
			resp.getWriter().write(content);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//json格式
	public static void sendJSONContentToWeb(HttpServletResponse resp,String content){
		String contentType = "application/json;charset=UTF-8";
		sendContentToWeb(resp,contentType,content);
	}
	
	//xml类型
	public static void sendXMLContentToWeb(HttpServletResponse resp,String content){
		String contentType = "text/xml;charset=UTF-8";
		sendContentToWeb(resp,contentType,content);
	}
	
	//txt类型
	public static void sendTXTContentToWeb(HttpServletResponse resp,String content){
		String contentType = "text/plain;charset=UTF-8";
		sendContentToWeb(resp,contentType,content);
	}

}
