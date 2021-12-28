package com.kh.cosmos.groupware.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.groupware.board.model.service.BoardService;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/board")
public class GwBoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/board.do")
	public String board(@RequestParam(defaultValue = "1") int cPage, int boardNo, Model model, HttpServletRequest request) {
		log.debug("cPage = {}", cPage);
		log.debug("boardNo = {}", boardNo);
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		List<Post> boardPostList = boardService.selectAllPostInBoard(boardNo);
		log.debug("boardPostList = {}", boardPostList);
		model.addAttribute("boardPostList", boardPostList);
		
		
		return "gw/board/board";
	}
	
	@GetMapping("/notice.do")
	public String notice(@RequestParam(defaultValue = "1") int cPage, int boardNo, Model model, HttpServletRequest request) {
		log.debug("cPage = {}", cPage);
		log.debug("boardNo = {}", boardNo);
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		List<Post> noticePostList = boardService.selectAllPostInNotice(boardNo);
		log.debug("noticePostList = {}", noticePostList);
		model.addAttribute("noticePostList", noticePostList);
		
		
		return "gw/board/notice";
	}
	
	@GetMapping("/noticeEnroll.do")
	public String noticeEnroll() {
		
		return "gw/board/noticeEnroll";
	}
	
	
	@GetMapping("/boardEnroll.do")
	public String boardEnroll() {
		
		return "gw/board/boardEnroll";
	}
	
	
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
