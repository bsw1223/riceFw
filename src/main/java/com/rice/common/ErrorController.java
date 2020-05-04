package com.rice.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	
	@GetMapping
	public String errorDefault() {
		return "Error_default";
	}
	
	@GetMapping("/no-resource")
	public String noResource() {
		return "Error_404";
	}

	@GetMapping("/server-error")
	public String serverError() {
		return "Error_500";
	}
}
