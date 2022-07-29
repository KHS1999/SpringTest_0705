package com.khs.test.ajax.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.khs.test.ajax.model.pension;

@Repository
public interface PensionDAO {
	
	public List<pension> selectPension();
	
	public int deletePension(@Param("id") int id);
	
	public int insertPension(@Param("name") String name
			,@Param("date") Date date
			,@Param("day") int day
			,@Param("headcount") int headcount
			,@Param("phoneNumber") String phoneNumber
			,@Param("state") String state);
	
	public pension selectBooking(
			@Param("name") String name
			,@Param("phoneNumber") String phoneNumber);
}
