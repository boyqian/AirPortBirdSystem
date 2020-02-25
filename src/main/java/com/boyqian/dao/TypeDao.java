package com.boyqian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boyqian.pojo.Type;

/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018年8月10日-下午9:50:37
 **/
public interface TypeDao {
	boolean insertType(Type type);
	boolean updateType(Type type);
	boolean deleteType(int typeId);
	List<Type> selectType(@Param("page")int page,@Param("limit")int limit);
	int selectTypeCount();
	Type selectTypeById(int typeId);
	List<Type> findAllType();
}
