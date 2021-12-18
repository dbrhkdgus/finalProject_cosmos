package com.kh.cosmos.groupware.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/board")
public class GwBoardController {
	
	@GetMapping("/board.do")
	public void board() {}
	
	@GetMapping("/notice.do")
	public void notice(){}
	
	@GetMapping("/boardEnroll.do")
	public void boardEnroll() {}
	
	@GetMapping("/boardDetail.do")
	public void boardDetail() {}
	
	@GetMapping("/anonymous.do")
	public void anonymous() {}
}
