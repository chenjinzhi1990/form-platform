package com.ustcinfo.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ustcinfo.shop.entity.AllFormAssembly;
import com.ustcinfo.shop.entity.FormGroupName;
import com.ustcinfo.shop.entity.FormMsg;

@Repository("saveForm")
public interface SaveForm {
		
		
		//保存表单
		public void saveFormAssembly(AllFormAssembly allformassembly);
		//拿出表单中的组件
		public List<AllFormAssembly> selectFromAssembly(@Param("formname")String formname,@Param("formid")String formid);
		
		//保存表单的名字到表单分组中去
		public void saveFormToFormGroupName(FormGroupName formgroupname);
		
		//查找分组里面的表单
		public List<FormMsg> selectFormMsg(String formgroupname);
		
		//保存表单信息
		public void saveFormMsg(FormMsg formmsg);
		
		
}
