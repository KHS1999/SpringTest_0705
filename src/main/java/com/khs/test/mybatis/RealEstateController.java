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
public class RealEstateController {
	
	@Autowired
	private RealEstateBO realEstateBO;

	// realEstate 정보 하나 json으로 response에 출력
	// id 가 5인 real_estate 행 json으로 response에 출력
	@RequestMapping("/mybatis/test01/1")
	@ResponseBody
	public RealEstate realEstate(@RequestParam("id")int id) {
		RealEstate realEstate = realEstateBO.getRealEstate(id);
		
		return realEstate;
	}
	@RequestMapping("/mybatis/test01/2")
	@ResponseBody
	// 특정 값 보다 적은 rentPrice 를 가진 매물을 json 으로 response 출력
	public List<RealEstate> realEstatebyrentPrice(@RequestParam("rentPrice")int rentPrice){
		List<RealEstate> realestatebyrentPrice = realEstateBO.getselectRealEstatebyrentPrice(rentPrice);
		
		return realestatebyrentPrice;
	}
	
	// area price
	@RequestMapping("/mybatis/test01/3")
	@ResponseBody
	public List<RealEstate> realEstateByAreaPrice(
			@RequestParam("area") int area
			, @RequestParam("price") int price) {
		return realEstateBO.getRealEstateByAreaPrice(area, price);
	}
}
