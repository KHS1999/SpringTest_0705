package com.khs.test.database.bo;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khs.test.database.dao.storeDAO;
import com.khs.test.database.model.store;
@Service
public class storeBO {
	
	@Autowired
	private storeDAO storeDAO;
	
	// store 테이블 전체 데이터 조회
	public List<store>getstoreList(){
		List<store> storeList = storeDAO.selectstoreList();
		
		return storeList;
	}
}
