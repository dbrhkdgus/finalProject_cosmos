package com.kh.cosmos.groupware.my.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/my")
public class GwMyController {
	@GetMapping("/my.do")
	public void my() {}
	
	@GetMapping("/saved.do")
	public void saved() {}
}
