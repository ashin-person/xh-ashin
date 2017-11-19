package com.ashin.core;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

/**
 * 自定义日期转换器
 * @author xgrv
 *
 */
public class CustomDateEdtor implements WebBindingInitializer {

	@Override
	public void initBinder(WebDataBinder binder, WebRequest request) {
		// TODO Auto-generated method stub
		binder.registerCustomEditor(
				Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
		
	}

}
