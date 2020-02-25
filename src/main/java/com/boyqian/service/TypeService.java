package com.boyqian.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyqian.dao.TypeDao;
import com.boyqian.pojo.Type;

/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018年8月10日-下午9:53:07
 **/
@Service
public class TypeService {

	@Autowired
	TypeDao typeDao;
	public boolean insertType(Type type){
		return typeDao.insertType(type);
	}
	public boolean updateType(Type type){
		return typeDao.updateType(type);
	}
	public boolean deleteType(int typeId){
		return typeDao.deleteType(typeId);
	}
	public List<Type> seleectType(int page,int limit){
		return typeDao.selectType(page, limit);
	}
	public Type selectTypeById(int typeId){
		return typeDao.selectTypeById(typeId);
	}
	public int selectTypeCount(){
		return typeDao.selectTypeCount();
	}
	public List<Type> findAllType(){
		return typeDao.findAllType();
	}
}
