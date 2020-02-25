package com.boyqian.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.boyqian.param.NameNumReq;
import com.boyqian.pojo.Bird;
import com.boyqian.service.BirdService;
import com.boyqian.service.SearchService;

/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018��8��9��-����10:29:37
 **/
@Controller
public class BirdController {
	@Autowired
	private BirdService birdService;
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/addBird")
	public ModelAndView addBird(Bird bird,HttpServletRequest req){
		int typeId=Integer.parseInt(req.getParameter("typeId"));
		String birdName=req.getParameter("birdName");
		bird.setTypeId(typeId);
		bird.setBirdName(birdName);
		birdService.insertBird(bird);
		return new ModelAndView("redirect:bird/index.jsp");
	}
	@RequestMapping("/updateBird")
	public ModelAndView updateBird(Bird bird,HttpServletRequest req){
		int birdId=Integer.parseInt(req.getParameter("birdId"));
		int typeId=Integer.parseInt(req.getParameter("typeId"));
		String birdName=req.getParameter("birdName");
		bird.setBirdId(birdId);
		bird.setTypeId(typeId);
		bird.setBirdName(birdName);
		birdService.updateBird(bird);
		return new ModelAndView("redirect:bird/index.jsp");
	}
	@RequestMapping("/deleteBird")
	@ResponseBody
	public  void deleteBird(HttpServletRequest req){
		int birdId=Integer.parseInt(req.getParameter("birdId"));
		birdService.deleteBird(birdId);
	}
	@RequestMapping("/selectBird")
	@ResponseBody
	public String selectBird(HttpServletRequest req){
		int page=Integer.parseInt(req.getParameter("page"));
		int limit=Integer.parseInt(req.getParameter("limit"));
		//String birdName=req.getParameter("birdName");
		
		int count=birdService.selectBirdCount();
		List<Bird> birdList=birdService.selectBird((page-1)*limit, limit);
		JSONObject obj=new JSONObject();
		obj.put("code", 0);
		obj.put("msg", 1000);
		obj.put("count", count);
		obj.put("data", birdList);
		return obj.toString();
	}
	@RequestMapping("/selectBirdById")
	@ResponseBody
	public Bird selectBirdById(HttpServletRequest req){
		int birdId=Integer.parseInt(req.getParameter("birdId"));
		return birdService.selectBirdById(birdId);
	}
	@RequestMapping("/findAllBird")
	@ResponseBody
	public List<Bird> findAllBird(HttpServletRequest req){
		return birdService.findAllBird();
	}
	@RequestMapping("/findBirdNameAndNum")
	@ResponseBody
	public List<NameNumReq> findBirdNameAndNum(){
		List<NameNumReq> baseList=searchService.findBirdNameAndNum();
		return baseList;
	}
	@RequestMapping("/findArea")
	@ResponseBody
	public List<Object> findArea(){
		return searchService.findArea();
	}
	@RequestMapping("/findBubble")
	@ResponseBody
	public Object[] findBubble(){
		return searchService.findBubble();
	}
}
