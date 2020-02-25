package com.boyqian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boyqian.param.AreaReq;
import com.boyqian.param.BubbleGraphReq;
import com.boyqian.param.NameNumReq;
import com.boyqian.param.NameReq;
import com.boyqian.param.NameTimeNumReq;

public interface SearchDao {
	//饼图
	List<NameNumReq> findBirdNameAndNum();
	//柱图，线图，增量图
	List<NameTimeNumReq> findBirdNTN(@Param("area")String area);
	List<AreaReq> findAllArea();
	//气泡图
	List<NameReq> findAllName();
	int findBubbleCount(@Param("name")String name);
	List<BubbleGraphReq> findBubble(@Param("name")String name);
	
	
}
