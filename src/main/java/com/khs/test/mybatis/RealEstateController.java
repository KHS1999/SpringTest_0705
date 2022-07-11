package com.khs.test.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khs.test.mybatis.bo.RealEstateBO;
import com.khs.test.mybatis.model.RealEstate;

@Controller
@RequestMapping("/mybatis/test01")
public class RealEstateController {
	
	@Autowired
	private RealEstateBO realEstateBO;

	// realEstate 정보 하나 json으로 response에 출력
	// id 가 5인 real_estate 행 json으로 response에 출력
	@RequestMapping("/1")
	@ResponseBody
	public RealEstate realEstate(@RequestParam("id")int id) {
		RealEstate realEstate = realEstateBO.getRealEstate(id);
		
		return realEstate;
	}
	@RequestMapping("/2")
	@ResponseBody
	// 특정 값 보다 적은 rentPrice 를 가진 매물을 json 으로 response 출력
	public List<RealEstate> realEstatebyrentPrice(@RequestParam("rentPrice")int rentPrice){
		List<RealEstate> realestatebyrentPrice = realEstateBO.getselectRealEstatebyrentPrice(rentPrice);
		
		return realestatebyrentPrice;
	}
	
	// area price
	@RequestMapping("/3")
	@ResponseBody
	public List<RealEstate> realEstateByAreaPrice(
			@RequestParam("area") int area
			, @RequestParam("price") int price) {
		return realEstateBO.getRealEstateByAreaPrice(area, price);
	}
	
	@ResponseBody
	@RequestMapping("/4")
	public String addRealEstateByObject() {
		
		RealEstate realestate = new RealEstate();
		realestate.setRealtorId(3);
		realestate.setAddress("푸르지용 리버 303동 1104호");
		realestate.setArea(80);
		realestate.setType("매매");
		realestate.setPrice(100000);
		
		int count = realEstateBO.addRealEstateByObject(realestate);
		 return "입력성공 : " + count;
	}
	
	@ResponseBody
	@RequestMapping("/5")
	public String addRealEstate(@RequestParam("realtorId")int realtorId) {
		int count = realEstateBO.addRealEstate(realtorId,"썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		return "입력성공 : " + count ;
	}
}
