package com.ustcinfo.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ustcinfo.shop.dao.SaveForm;
import com.ustcinfo.shop.dao.UserDao;
import com.ustcinfo.shop.entity.AllFormAssembly;
import com.ustcinfo.shop.entity.FormGroupName;
import com.ustcinfo.shop.entity.FormMsg;
import com.ustcinfo.shop.entity.ResultValue;
import com.ustcinfo.shop.entity.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Resource(name = "userDao")
	private UserDao dao;

	@Resource(name = "saveForm")
	private SaveForm saveform;

	// 去到注册页面+
	@RequestMapping("/toRegister")
	public String toRegister() {

		return "register";
	}

	// 去到登录页面
	@RequestMapping("/toLogin")
	public String toLogin() {

		return "loginAndRegister";
	}

	@RequestMapping("/toIndex")
	public String toIndex() {

		return "index";
	}

	@RequestMapping("/demo")
	public String demo() {

		return "demo";
	}

	@RequestMapping("/toPreview")
	public String toPreview() {

		return "exitform";
	}

	@RequestMapping("/datasource")
	public String datasourceconfig() {

		return "datasource";
	}

	// 保存注册的信息
	@RequestMapping("/saveMsg")
	@ResponseBody
	public String saveMsg(String username, String email, String pwd) {

		User user = new User();
		// 等于空说明这个用户名可以使用
		if (dao.selectUser(username.trim()) == null) {

			System.out.println("该用户名可以使用");

			user.setUsername(username);
			user.setPassword(pwd);
			user.setEmail(email);
			dao.saveUser(user);
			String msg = "ok";
			return msg;
		} else {
			String msg = "no";
			return msg;

		}
	}

	// 保存注册的信息
	@RequestMapping("/Login")
	@ResponseBody
	public String login(String username, String password, boolean flag, HttpSession session) {

		System.out.println(username + password);

		User user = new User();
		user = dao.checkUser(username.trim(), password.trim());
		session.setAttribute("user", user.getPassword());
		session.setAttribute("flag", flag);

		System.out.println(user);

		if (user != null) {
			String result = "ok";
			return result;
		} else {
			String result = "no";
			return result;
		}

	}

	// 保存一个表单中的各个组件信息
	@RequestMapping("/save")
	@ResponseBody
	public String saveHTML(String[] allassembly, String formname,String formdesc) {
		String html="";
		
		// 保存下拉框中组件中的属性
		List<AllFormAssembly> list=new ArrayList<AllFormAssembly>();
			
		for (int x = 0; x < allassembly.length; x++) {
			//这个分割是得到每一个组件属性的数组
			String[] everyassembly = allassembly[x].split(",");
			
			//是单行文本框的进来了
			if(everyassembly[0].trim().equals("singletext")){
				AllFormAssembly allformassembly = new AllFormAssembly();
				allformassembly.setAssemblyname("singletext");
				for (int y = 1; y < everyassembly.length; y++) {
					if(y==1){
						allformassembly.setSingletextname(everyassembly[y]);
					}
					if(y==2){
						allformassembly.setSingletextid(everyassembly[y]);
					}
					if(y==3){
						allformassembly.setSingletextplaceholder(everyassembly[y]);
					}
					if(y==4){
						allformassembly.setSingletextmustenter(everyassembly[y]);
					}
					if(y==5){
						allformassembly.setWhichvalidate(everyassembly[y]);
					}
					if(y==6){
						allformassembly.setWarning(everyassembly[y]);
					}
					
				}
				
				list.add(allformassembly);
			}
            if(everyassembly[0].equals("textarea")){
            	
            	AllFormAssembly allformassembly = new AllFormAssembly();
            	allformassembly.setAssemblyname("textarea");
				for (int y = 1; y < everyassembly.length; y++) {
					if(y==1){
						allformassembly.setTextareaname(everyassembly[y]);
					}
					if(y==2){
						allformassembly.setTextareaid(everyassembly[y]);
					}
					if(y==3){
						allformassembly.setTextareaplaceholder(everyassembly[y]);
					}
					if(y==4){
						allformassembly.setTextareamustenter(everyassembly[y]);
					}
				}
				
				list.add(allformassembly);
			}
            if(everyassembly[0].equals("combobox")){
            	AllFormAssembly allformassembly = new AllFormAssembly();
            	allformassembly.setAssemblyname("combobox");
				for (int y = 1; y < everyassembly.length; y++) {
					if(y==1){
						allformassembly.setComboboxname(everyassembly[y]);
					}
					if(y==2){
						allformassembly.setComboboxid(everyassembly[y]);
					}
					if(y==3){
						allformassembly.setComboboxmustenter(everyassembly[y]);
					}
					if(y==4){
						allformassembly.setComboboxhtml(everyassembly[y]);
					}
					
				}
				list.add(allformassembly);
				
			}
		
		}
			//将组件保存到数据库中
			for (int t = 0; t < list.size(); t++) {
				list.get(t).setFormname(formname);
				list.get(t).setFormid("001");
				saveform.saveFormAssembly(list.get(t));

			}
			//保存表单中信息
			FormMsg formmsg=new FormMsg();
			formmsg.setFormgroupname("默认分组");
			formmsg.setFormdesc(formdesc);
			formmsg.setFormname(formname);
			formmsg.setFormid("003");
			formmsg.setFormname(formname);
			
			saveform.saveFormMsg(formmsg);
			
			
			
			FormGroupName  formgroupname=new FormGroupName();
			formgroupname.setFormname(formname);
			formgroupname.setFormgroupname("默认分组");
			formgroupname.setFormid("003");
			
			//把这个表单名字保存到分组中去
			saveform.saveFormToFormGroupName(formgroupname);
			
			
			
		
			 html = "yes";
			return html;

	}

	// 查找我们保存的表单的组件信息
	@RequestMapping(value="/toselectassembly")
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
	
	//根据表单分组的名字查找标的信息
	@RequestMapping("/toselectform")
	@ResponseBody
	public ResultValue<List<FormMsg>> toselectform(String formgroupname) {
		List<FormMsg> list=new ArrayList<FormMsg>();
		
		list=saveform.selectFormMsg(formgroupname);
		ResultValue<List<FormMsg>> rv = new ResultValue<List<FormMsg>>();
		
		rv.setData(list);
		
		return rv;
		
	}
	
	
	

}
