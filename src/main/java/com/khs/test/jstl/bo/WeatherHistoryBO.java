package com.khs.test.jstl.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khs.test.jstl.dao.WeatherHistoryDAO;
import com.khs.test.jstl.model.WeatherHistory;

@Service
public class WeatherHistoryBO {
	@Autowired
	private WeatherHistoryDAO weatherHistoryDAO;
	
	// 날씨 정보 리스트 가져오기
	public List<WeatherHistory> getWeatherHistory() {
		
		List<WeatherHistory> weatherHistory = weatherHistoryDAO.selectWeatherHistory();
			return weatherHistory;
	}
		// 날씨 정보 입력하기
		public int addWeatherHistory(Date date, String weather, double temperatures, String microDust, double precipitation, double windSpeed) {
			
			return weatherHistoryDAO.insertWeatherHistory(date,weather,temperatures,microDust,precipitation,windSpeed);
			
		}
	
}
