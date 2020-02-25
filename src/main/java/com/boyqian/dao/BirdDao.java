package com.boyqian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boyqian.pojo.Bird;



/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018��8��9��-����10:27:03
 **/
public interface BirdDao {
	boolean insertBird(Bird bird);
	boolean updateBird(Bird bird);
	boolean deleteBirdType(int typeId);//ɾ������ͬʱ����Bird�е�type_id
	boolean deleteBird(int birdId);
	List<Bird> selectBird(@Param("page")int page,@Param("limit")int limit);
	List<Bird> findAllBird();
	int selectBirdCount();
	Bird selectBirdById(int birdId);
}
