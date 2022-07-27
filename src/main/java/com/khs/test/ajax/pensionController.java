package com.khs.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@GetMapping("/insert")
	@ResponseBody
	public Map<String,String> addPension(@RequestParam("name") String name
			,@RequestParam("date") String date
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
}
