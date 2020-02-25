package com.boyqian.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.boyqian.pojo.Type;
import com.boyqian.service.BirdService;
import com.boyqian.service.TypeService;

/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018��8��10��-����9:52:39
 **/
@Controller
public class TypeController {

	@Autowired
	private TypeService typeService;
	@Autowired
	private BirdService birdService;
	
	@RequestMapping("/addType")
	public ModelAndView addType(Type type,HttpServletRequest req){
		String typeName=req.getParameter("typeName");
		type.setTypeName(typeName);
		typeService.insertType(type);
		//�Ժ������޸ĸ����ӳɹ�����ʧ����Ϣ
		return new ModelAndView("redirect:type/index.jsp");
	}
	@RequestMapping("/updateType")
	public ModelAndView updateType(Type type,HttpServletRequest req){
		int typeId=Integer.parseInt(req.getParameter("typeId"));
		String typeName=req.getParameter("typeName");
		
		type.setTypeId(typeId);
		type.setTypeName(typeName);
		typeService.updateType(type);
		return new ModelAndView("redirect:type/index.jsp");
	}
	@RequestMapping("/deleteType")
	@ResponseBody
	public void deleteType(HttpServletRequest req){
		int typeId=Integer.parseInt(req.getParameter("typeId"));
	    typeService.deleteType(typeId);
	}
	@RequestMapping("/selectType")
	@ResponseBody
	public String selectType(HttpServletRequest req){
		int page=Integer.parseInt(req.getParameter("page"));
		int limit=Integer.parseInt(req.getParameter("limit"));
		int count=typeService.selectTypeCount();
		List<Type> typeList=typeService.seleectType((page-1)*limit, limit);
		JSONObject obj=new JSONObject();
		obj.put("code", 0);
		obj.put("msg", 1000);
		obj.put("count", count);
		obj.put("data", typeList);
		return obj.toString();
	}
	@RequestMapping("/selectTypeById")
	@ResponseBody
	public Type selectTypeById(HttpServletRequest req){
		int typeId=Integer.parseInt(req.getParameter("typeId"));
		return typeService.selectTypeById(typeId);
	}
	@RequestMapping("/findAllType")
	@ResponseBody
	public List<Type> findAllType(){
		return typeService.findAllType();
	}
}
