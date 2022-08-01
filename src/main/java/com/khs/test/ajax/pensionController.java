package com.khs.test.ajax;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khs.test.ajax.bo.PensionBO;
import com.khs.test.ajax.model.pension;

@Controller
@RequestMapping("/ajax/pension")
public class pensionController {

	@Autowired
	private PensionBO pensionBO;
	
	@GetMapping("/list")
	public String pension(Model model) {
		List<pension> pensionList = pensionBO.getPensnionList();
		model.addAttribute("pensionList",pensionList);
		
		return "ajax/pensionInfo";
	}
	
	// 예약 삭제 api
	@GetMapping("/delete")
	@ResponseBody
	public Map<String,String> deletePensnion(@RequestParam("id") int id){
		
		Map<String, String> result = new HashMap<>();
		if(pensionBO.deletePensionList(id) == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 예약 데이터 저장 기능 api	
	@GetMapping("/insert")
	@ResponseBody
	public Map<String,String> addPension(@RequestParam("name") String name
			,@DateTimeFormat(pattern="yyyy년-MM월-dd일")
			@RequestParam("date") Date date
			,@RequestParam("day") int day
			,@RequestParam("headcount") int headcount
			,@RequestParam("phoneNumber") String phoneNumber) {
		
		Map<String,String> result = new HashMap<>();
		
		if(pensionBO.getinsertPension(name, date, day, headcount, phoneNumber) == 1) {
			result.put("result","success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}

	@GetMapping("/input")
	public String inputPension() {
		
		return "/ajax/pensionInput";
	}
	
	// 이름과 전화번호가 일치하는 예약 정보 얻어 오기 api
	// 조회된 결과 이름: 김인규 날짜: 2022년 7월 29일 숙박일수 : 3 ~~ 
	// {"name" : "김인규"}, {"date" : " 2022-07-29"}, {"day" : 3....}
	@GetMapping("/get")
	@ResponseBody
	public pension getBooking(
			@RequestParam("name") String name
			,@RequestParam("phoneNumber") String phoneNumber) {
		
		pension Pension = pensionBO.getBooking(name, phoneNumber);
		
		return Pension;
	}
	@GetMapping("/lookup")
	public String lookupPension() {
		
		return "/ajax/pensionLookUp";
	}
}
