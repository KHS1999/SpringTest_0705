package com.khs.test.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.khs.test.mybatis.model.RealEstate;

@Repository
public interface RealEstateDAO {

	// id 가 5인 real estate 정보 전달
	public RealEstate selectRealEstate(@Param("id")int id);
	
	// 전달받은 rentPrice 보다 적은 월세 매물 조회
	public List<RealEstate> selectRealEstatebyrentPrice(@Param("rentPrice")int rentPrice);
	
	public List<RealEstate> selectRealEstateByAreaPrice(
			@Param("area")int area
			,@Param("price") int price);
	
	public int insertRealEstateByObject(RealEstate RealEstate);
	
	public int insertRealEstate(@Param("realtorId")int realId
			,@Param("address")String address
			,@Param("area") int area
			,@Param("type") String type
			,@Param("price") int price
			,@Param("rentPrice") int rentPrice);
	
	public int updateRealEstate(@Param("id")int id
			,@Param("type") String type
			,@Param("price") int price);
	
	public int deleteRealEstate(@Param("id") int id);
}
