package com.boyqian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boyqian.pojo.Record;

/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018年8月10日-下午9:50:23
 **/
public interface RecordDao {
	boolean insertRecord(Record record);
	boolean updateRecord(Record record);
	boolean deleteRecord(int recordId);
	List<Record> selectRecord(@Param("page")int page,@Param("limit")int limit);
	int selectRecordCount();
	Record selectRecordById(int recordId);
}
