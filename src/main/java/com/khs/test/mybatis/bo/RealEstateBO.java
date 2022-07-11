package com.khs.test.mybatis.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khs.test.mybatis.dao.RealEstateDAO;
import com.khs.test.mybatis.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;

	// id가 5인 real_estate 정보 전달
	public RealEstate getRealEstate(int id) {
		RealEstate realEstate = realEstateDAO.selectRealEstate(id);
		
		return realEstate;
		
	
	}
	
	// 전달 받은 rentPrice 보다 적은 월세의 매물 조회
	public List<RealEstate> getselectRealEstatebyrentPrice(int rentPrice) {
		List<RealEstate> realEstatebyrentPrice = realEstateDAO.selectRealEstatebyrentPrice(rentPrice);
		
		return realEstatebyrentPrice;
	}
	
	public List<RealEstate> getRealEstateByAreaPrice(int area, int price){
		return	realEstateDAO.selectRealEstateByAreaPrice(area, price);
		
	}
	public int addRealEstateByObject(RealEstate RealEstate) {
		
		return realEstateDAO.insertRealEstateByObject(RealEstate);
	}
	
	public int addRealEstate(int realtorId, String address,int area, String type, int price, int rentPrice) {
		return realEstateDAO.insertRealEstate(realtorId,address,area,type,price,rentPrice);
	}
}
