package com.khs.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khs.test.jsp.bo.RealtorBO;
import com.khs.test.jsp.model.Realtor;

@Controller
@RequestMapping("/jsp/realtor")
public class realtorController {
	
	@Autowired RealtorBO realtorBO;
	
	@PostMapping("/insert/view")
	// 공인중개사 정보 전달 받고, 데이터 저장
	public String addRealtorView(
			@ModelAttribute Realtor realtor, Model model) {
		realtorBO.addRealtorWithId(realtor);
		model.addAttribute("realtor", realtor);
		return "jsp/realtorInfo";
	}
	
	@GetMapping("/input/view")
	public String inputView() {
		return "jsp/realtorInput";
	}
}
