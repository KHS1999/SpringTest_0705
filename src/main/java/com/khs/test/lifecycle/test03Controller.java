package com.khs.test.lifecycle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test03Controller {

	@RequestMapping("/lifecycle/lesson01/test03/1")
	public String view() {
		return "lifecycle/test01";
		}
}
