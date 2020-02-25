package com.boyqian.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.boyqian.pojo.Record;
import com.boyqian.service.RecordService;

/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018��8��10��-����9:52:31
 **/
@Controller
public class RecordController {

	@Autowired
	private RecordService recordService;
	
	@RequestMapping("/addRecord")
	public ModelAndView addRecord(Record record,HttpServletRequest req){
		int birdId=Integer.parseInt(req.getParameter("birdId"));
		String area=req.getParameter("area");
		int num=Integer.parseInt(req.getParameter("num"));
		double height=Double.parseDouble(req.getParameter("height"));
		record.setBirdId(birdId);
		record.setTime(new Date());
		record.setArea(area);
		record.setNum(num);
		record.setHeight(height);
		recordService.insertRecord(record);
		return new ModelAndView("redirect:record/index.jsp");
	}
	@RequestMapping("/updateRecord")
	public ModelAndView updateRecord(Record record,HttpServletRequest req){
		int recordId=Integer.parseInt(req.getParameter("recordId"));
		int birdId=Integer.parseInt(req.getParameter("birdId"));
		String area=req.getParameter("area");
		int num=Integer.parseInt(req.getParameter("num"));
		double height=Double.parseDouble(req.getParameter("height"));
		record.setRecordId(recordId);
		record.setBirdId(birdId);
		record.setTime(new Date());
		record.setArea(area);
		record.setNum(num);
		record.setHeight(height);
		recordService.updateRecord(record);
		return new ModelAndView("redirect:record/index.jsp");
	}
	@RequestMapping("/deleteRecord")
	@ResponseBody
	public void deleteRecord(HttpServletRequest req){
		int recordId=Integer.parseInt(req.getParameter("recordId"));
		recordService.deleteRecord(recordId);
	}
	@RequestMapping("/selectRecord")
	@ResponseBody
	public String selectRecord(HttpServletRequest req){
		int page=Integer.parseInt(req.getParameter("page"));
		int limit=Integer.parseInt(req.getParameter("limit"));
		int count=recordService.selectRecordCount();
		List<Record> recordList=recordService.selectRecord((page-1)*limit, limit);
		JSONObject obj=new JSONObject();
		obj.put("code", 0);
		obj.put("msg", 1000);
		obj.put("count", count);
		obj.put("data", recordList);
		return obj.toString();
	}
	public Record selectRecordById(HttpServletRequest req){
		int recordId=Integer.parseInt(req.getParameter("recordId"));
		return recordService.selectRecordById(recordId);
	}
	
}
