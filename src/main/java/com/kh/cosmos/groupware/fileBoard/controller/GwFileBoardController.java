package com.kh.cosmos.groupware.fileBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/fileBoard")
public class GwFileBoardController {
	@GetMapping("/fileBoard.do")
	public void fileBoard() {}
	
	@GetMapping("/fileEnroll.do")
	public void fileEnroll() {}
}
