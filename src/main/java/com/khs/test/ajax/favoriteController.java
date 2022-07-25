package com.khs.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khs.test.ajax.bo.FavoriteBO;
import com.khs.test.ajax.model.favorite;

@Controller
@RequestMapping("/ajax/favorite")
public class favoriteController {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	// 리스트 페이지
	@GetMapping("/list")
	public String favorite(Model model) {
		List<favorite> favoriteList = favoriteBO.getfavorite();
		model.addAttribute("favoriteList",favoriteList);
		return "/ajax/favoriteInfo";
	}
	
	// 즐겨찾기 추가
	@PostMapping("/insert")
	@ResponseBody
	public Map<String, String> addFavorite(@RequestParam("name") String name
				,@RequestParam("address") String address){
		
		int count = favoriteBO.addFavorite(name, address);
		
		// 성공시에 {"result": "success"}
		// 실패시에 {"result": " fail"}
		
		Map<String,String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			
			result.put("result", "fail");
		}
		return result;
	}
	
	@GetMapping("/input")
	public String favoriteInput() {
		
		return "ajax/favoriteInput";
	}
	
	@GetMapping("/is_duplicate")
	@ResponseBody
	public Map<String, Boolean>isDuplicate(@RequestParam("address") String address) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(favoriteBO.isDuplicateAddress(address)) {
			
			result.put("is_duplicate", true);
		}else {
			result.put("is_duplicate", false);
		}
		return result;
	}
}
