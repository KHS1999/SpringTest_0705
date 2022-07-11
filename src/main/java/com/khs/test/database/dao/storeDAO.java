package com.khs.test.database.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.khs.test.database.model.store;
import com.khs.test.mybatis.model.RealEstate;

@Repository
public interface storeDAO {

	// store 테이블 데이터 모두 가져오기
	public List<store> selectstoreList();
	
	
}
