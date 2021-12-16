package com.kh.cosmos.groupware.tdl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/tdl")
public class GwTDLController {
	@GetMapping("tdl.do")
	public void tdl() {}
}
