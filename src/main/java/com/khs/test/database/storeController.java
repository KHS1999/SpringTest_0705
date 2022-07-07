package com.khs.test.database;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khs.test.database.bo.storeBO;
import com.khs.test.database.model.store;
@Controller
public class storeController {
	
	@Autowired
	private storeBO storeBO;
	
	@RequestMapping("/database/test01/1")
	@ResponseBody

	public List<store>test01() {
			// store 테이블의 모든 행을 json 으로 response에 전달한다.
		List<store> storeList = storeBO.getstoreList();
			
		return storeList;
		
	}
}
