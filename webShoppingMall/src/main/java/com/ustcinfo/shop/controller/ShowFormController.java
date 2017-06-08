package com.ustcinfo.shop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ustcinfo.shop.dao.SaveForm;
import com.ustcinfo.shop.entity.AllFormAssembly;
import com.ustcinfo.shop.entity.ResultValue;

@Controller
public class ShowFormController {
	@Resource(name = "saveForm")
	private SaveForm saveform;
	
	@RequestMapping(value="/show")
	public String getForm(){
		return "show";
	}
	
	
	// 查找我们保存的表单的组件信息
		@RequestMapping(value="/showform")
		@ResponseBody
		public ResultValue<List<AllFormAssembly>> selectassembly(String formname,String formid) {

		System.out.println(formname+formid);
			List<AllFormAssembly> list = new ArrayList<AllFormAssembly>();

			System.out.println(formname);
		
			list = saveform.selectFromAssembly(formname,formid);
			ResultValue<List<AllFormAssembly>> rv = new ResultValue<List<AllFormAssembly>>();
			rv.setData(list);

			return rv;
		}
		
		@RequestMapping(value="/showform")
		public String saveMessage(HttpServletRequest req){
			Map<String,Object> msg = req.getParameterMap();
			System.out.println(msg);
			return null;
		}
}
