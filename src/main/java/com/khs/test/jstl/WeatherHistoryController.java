package com.khs.test.jstl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khs.test.jstl.bo.WeatherHistoryBO;
import com.khs.test.jstl.model.WeatherHistory;

@Controller
public class WeatherHistoryController {
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/jstl/test05")
	public String test05(Model model) {
		
		// 날씨 정보 리스트
		List<WeatherHistory> weatherHistory = weatherHistoryBO.getWeatherHistory();
		model.addAttribute("weatherHistory",weatherHistory);
		return "jstl/test05";
	}
	
	// 날짜, 날씨, 기온, 강수량, 미세먼지, 풍속
	@GetMapping("/jstl/test06")
	public String test06(
						@DateTimeFormat(pattern="yyyy년 MM월 dd일")
						@RequestParam("date") Date 	date
						,@RequestParam("weather") String weather
						,@RequestParam("temperatures") double temperatures
						,@RequestParam("microDust") String microDust
						,@RequestParam("precipitation") double precipitation
						,@RequestParam("windSpeed") double windSpeed) {
		int count = weatherHistoryBO.addWeatherHistory(date,weather,temperatures,microDust,precipitation,windSpeed);
		return   "redirect:/jstl/test05";
	}
	
	@GetMapping("jstl/weatherinput")
	public String insertweatherHistory() {
		
		return "jstl/weatherInput";
	}
}
