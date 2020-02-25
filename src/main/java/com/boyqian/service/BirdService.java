package com.boyqian.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyqian.dao.BirdDao;
import com.boyqian.pojo.Bird;

/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018��8��9��-����10:29:51
 **/
@Service
public class BirdService {
	@Autowired
	BirdDao birdDao;
	
	public boolean insertBird(Bird bird){
		return birdDao.insertBird(bird);
	}
	
	public boolean updateBird(Bird bird){
		return birdDao.updateBird(bird);
	}
	public boolean deleteBirdType(int typeId){
		return birdDao.deleteBirdType(typeId);
	}
	public boolean deleteBird(int birdId){
		return birdDao.deleteBird(birdId);
	}
	public List<Bird> selectBird(int page,int limit){
		return birdDao.selectBird(page, limit);
		
	}
	public int selectBirdCount(){
		return birdDao.selectBirdCount();
	}
	public Bird selectBirdById(int birdId){
		return birdDao.selectBirdById(birdId);
	}
	public List<Bird> findAllBird(){
		return birdDao.findAllBird();
	}
 }
