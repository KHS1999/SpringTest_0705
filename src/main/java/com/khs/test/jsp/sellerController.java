package com.khs.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import com.khs.test.jsp.bo.SellerBO;

@Controller
public class sellerController {
	
	@Autowired
	private SellerBO sellerBO;
	
	public String insertSeller() {
		sellerBO.addSeller(
				@RequestParam("nickname") String nickname
				,@RequestParam("profileImage") String profileImage
				,@RequestParam("temperature") double temperature
				)
		return "";
	}
}
