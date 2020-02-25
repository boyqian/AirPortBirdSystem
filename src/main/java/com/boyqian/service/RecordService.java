package com.boyqian.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyqian.dao.RecordDao;
import com.boyqian.pojo.Record;

/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018年8月10日-下午9:52:57
 **/
@Service
public class RecordService {

	@Autowired
	RecordDao recordDao;
	public boolean insertRecord(Record record){
		return recordDao.insertRecord(record);
	}
	public boolean updateRecord(Record record){
		return recordDao.updateRecord(record);
	}
	public boolean deleteRecord(int recordId){
		return recordDao.deleteRecord(recordId);
	}
	public List<Record> selectRecord(int page,int limit){
		return recordDao.selectRecord(page, limit);
	}
	public int selectRecordCount(){
		return recordDao.selectRecordCount();
	}
	public Record selectRecordById(int recordId){
		return recordDao.selectRecordById(recordId);
	}
}
