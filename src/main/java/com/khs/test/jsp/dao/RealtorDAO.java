package com.khs.test.jsp.dao;

import org.springframework.stereotype.Repository;

import com.khs.test.jsp.model.Realtor;

@Repository
public interface RealtorDAO {
	
	public int insertRealtorWithID(Realtor realtor);
}
