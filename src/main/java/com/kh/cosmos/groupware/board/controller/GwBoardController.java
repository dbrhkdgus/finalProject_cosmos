package com.kh.cosmos.groupware.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.groupware.board.model.service.BoardService;
import com.kh.cosmos.groupware.board.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/board")
public class GwBoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/board.do")
	public void board() {
		
	}
	
	@GetMapping("/notice.do")
	public void notice(){}
	
	@GetMapping("/boardEnroll.do")
	public void boardEnroll() {}
	
	@GetMapping("/boardDetail.do")
	public void boardDetail() {}
	
	@GetMapping("/anonymous.do")
	public void anonymous() {}
	
	@PostMapping("/createBoardRoom.do")
	public String createBoardRoom(Board board, RedirectAttributes redirectAtt) {
		
		int result = boardService.createBoardRoom(board);
		redirectAtt.addAttribute("groupNo", board.getGroupNo());
		redirectAtt.addAttribute("msg", result > 0 ? "채팅방 ["+board.getBoardName()+"]이 개설되었습니다." : "실패");
		
		
		return "redirect:/gw/gw.do";
	}
}
