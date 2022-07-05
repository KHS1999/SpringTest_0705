package com.khs.test.helloworld;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloworld {

	@RequestMapping("/helloworld")
			
	    public String helloWorld() {
	        return "Hello World!!";
	    }
	
}