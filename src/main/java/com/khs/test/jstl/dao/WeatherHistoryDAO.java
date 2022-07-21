package com.khs.test.jstl.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.khs.test.jstl.model.WeatherHistory;

@Repository
public interface WeatherHistoryDAO {
	
	// 날씨 정보 모두 가져오기
	public List<WeatherHistory> selectWeatherHistory();
	
	// 날씨 정보 삽입
	public int insertWeatherHistory(
									 
									@Param("date") Date date
									,@Param("weather") String weather
									,@Param("temperatures") double temperatures
									,@Param("microDust") String microDust
									,@Param("precipitation") double precipitation
									,@Param("windSpeed") double windSpeed);
}
