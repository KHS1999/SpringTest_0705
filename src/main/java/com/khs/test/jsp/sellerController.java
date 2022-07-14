package com.khs.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khs.test.jsp.bo.SellerBO;
import com.khs.test.jsp.model.Seller;

@Controller
public class sellerController {
	
	@Autowired
	private SellerBO sellerBO;
	
	@ResponseBody
	@PostMapping("/jsp/test/1")
	public String addSeller(
			@RequestParam("nickname") String nickname
			,@RequestParam(value = "profileImage", required = false) String profileImage
			,@RequestParam("temperature") double temperature) {
		
		int count = sellerBO.addSeller(nickname, profileImage, temperature);
		return "추가된 행 개수 : " + count;
	}
	
	@GetMapping("/jsp/sellerInput_View")
	public String sellerInputView() {
		return "jsp/sellerInput_view";
	}
	
	@GetMapping("/jsp/Info")
	public String sellerInfo(
			@RequestParam(value="id", required=false) Integer id
			, Model model) {
		
		// 비필수 파라미터
		// 값이 전달되면 그 값으로 세팅
		// 값이 전달이 안되면 null
//		Seller seller = null;
		
//		if(id ==null) {
//			seller = sellerBO.getLastseller();
//			
//					
//		}else {				
//			seller = sellerBO.getSeller(id);
//		}
		Seller seller = sellerBO.getSeller(id);
			model.addAttribute("seller", seller);
		
				return "/jsp/sellerInfo";
		
	}
}
