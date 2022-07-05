package com.khs.test.lifecycle;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.khs.test.lifecycle.model.Subject;

@RestController
@RequestMapping("/lesson01/test01")
public class test01Controller {
	
	@RequestMapping("/1")
	public String lessson() {
		return "lesson";
	}
	@RequestMapping("/2")
	public Map<String, Integer> printMap() {
		
		Map<String, Integer> map = new HashMap<>();
		map.put("국어",80);
		map.put("수학",90);
		map.put("영어",85);
		
		return map;
	}

	@RequestMapping("/2.1")
	public ResponseEntity<Subject> entity(){
		Subject subject = new Subject();
		subject.setKorean(80);
		subject.setMath(90);
		subject.setEnglish(85);
		
		ResponseEntity<Subject> entity = new ResponseEntity(subject, HttpStatus.INTERNAL_SERVER_ERROR);
		return entity;
	}
	
}
