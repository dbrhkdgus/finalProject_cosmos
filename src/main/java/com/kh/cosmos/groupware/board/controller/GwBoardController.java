package com.kh.cosmos.groupware.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.service.BoardService;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/board")
public class GwBoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private GroupwareService gwService;
	
	@GetMapping("/board.do")
	public String board(@RequestParam(defaultValue = "1") int cPage, int boardNo, int groupNo, Model model, HttpServletRequest request, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		log.debug("cPage = {}", cPage);
		log.debug("boardNo = {}", boardNo);
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		List<Post> boardPostList = boardService.selectAllPostInBoard(boardNo);
		log.debug("boardPostList = {}", boardPostList);
		model.addAttribute("boardPostList", boardPostList);
		model.addAttribute("title", "abcde");
		
		
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
		model.addAttribute("boardNo", boardNo);
		
		
		return "gw/board/notice";
	}
	
	@GetMapping("/noticeFrm.do")
	public String noticeFrm(int boardNo, Model model) {
		
		return "gw/board/noticeFrm";
	}
	
	@PostMapping("/boardFrm.do")
	public String boardFrm(int boardNo, Model model, HttpServletRequest request) {
		log.debug("boardNo = {}", boardNo);
		return "gw/board/boardFrm";
	}
	
	@PostMapping("/boardEnroll.do")
	public String boardEnroll(Post post){
		log.debug("post = {}", post);
		
		String memberId = post.getMemberId();
		log.debug("memberId = {}", post.getMemberId());
		
		int result = boardService.insertPost(post);
		
		
		return "redirect:/gw/board/board.do";
	
		
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
	
    public void groupwareHeaderSet(int groupNo, Model model, Authentication auth) {
        Member loginMember = (Member) auth.getPrincipal();
        Group myGroup = gwService.selectMyGroup(groupNo);
        List<Member> myGroupMemberList = gwService.selectAllGroupMembers(groupNo);
        
        
        
        List<Group> myGroupList = gwService.selectAllMyGroup(loginMember.getId());
        List<Attachment> groupBannerAttachList = gwService.selectAllGroupBannerAttach();
        List<String> memberProfileRenamedFilenameList = new ArrayList<String>();
        for(Member m : myGroupMemberList) {
            String memberProfileRenamedFilename = gwService.selectMemberProfileRenamedFilename(m.getId());
            memberProfileRenamedFilenameList.add(memberProfileRenamedFilename);
        }

        List<ChatRoom> chattingChannelList = gwService.selectAllChatRoomByGroupNo(groupNo);
        
        model.addAttribute("currGroupNo", groupNo);
        model.addAttribute("myGroup", myGroup);
        model.addAttribute("myGroupMemberList", myGroupMemberList);
        model.addAttribute("chattingChannelList", chattingChannelList);
        model.addAttribute("profile", gwService.selectMemberProfileRenamedFilename(loginMember.getId()));
        model.addAttribute("memberProfileRenamedFilenameList", memberProfileRenamedFilenameList);
        model.addAttribute("groupBannerAttachList", groupBannerAttachList);
        model.addAttribute("myGroupList", myGroupList);
    }
	
}
