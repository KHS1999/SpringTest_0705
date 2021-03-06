package com.khs.test.lifecycle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.khs.test.lifecycle.model.Board;

@RestController
@RequestMapping("/lesson01/test02")
public class test02Controller {

	@RequestMapping("/1")
	public List<Map<String, Object>> movieList() {
		
		List<Map<String,Object>> movieList = new ArrayList<>();
		
		Map<String,Object> movie = new HashMap<>();
		movie.put("rate",15);
		movie.put("director", "봉준호");
		movie.put("time", 131);
		movie.put("title", "기생충");
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 0);
		movie.put("director", "로베르토 베니니");
		movie.put("time", 116);
		movie.put("title", "인생은 아름다워");		
		movieList.add(movie);

		movie = new HashMap<>();
		movie.put("rate", 12);
		movie.put("director", "크리스토퍼 놀란");
		movie.put("time", 147);
		movie.put("title", "인셉션");		
		movieList.add(movie);	
		
		return movieList;
	}
	
	@RequestMapping("/2")
	public List<Board> boardList() {
		
		List<Board> boardList = new ArrayList<>();
		
		Board content = new Board();
		content.setTitle("안녕하세요 가입인사 드립니다.");
		content.setUser("hagulu");
		content.setContent("안녕하세요. 가입했어요 앞으로도 잘 부탁 드립니다.");
		boardList.add(content);
		
		content = new Board();
		content.setTitle("헐 대박");
		content.setUser("bada");
		content.setContent("오늘 목요일이 었어... 금요일인줄");
		boardList.add(content);
		
		content = new Board();
		content.setTitle("오늘 데이트 한 이야기 해드릴게요");
		content.setUser("dulmary");
		content.setContent("....");
		boardList.add(content);
		
		return boardList;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<Board> entity(){
		
		Board content = new Board();
		content.setTitle("안녕하세요 가입인사 드립니다.");
		content.setUser("hagulu");
		content.setContent("안녕하세요. 가입했어요 앞으로도 잘 부탁 드립니다.");
		
		ResponseEntity<Board> entity = new ResponseEntity<>(content, HttpStatus.INTERNAL_SERVER_ERROR);
				return entity;
				}
	
}
