package com.kh.cosmos.groupware.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.attachment.model.service.AttachmentService;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.service.BoardService;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.main.model.service.MainService;
import com.kh.cosmos.member.model.vo.Member;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/board")
public class GwBoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private GroupwareService gwService;
	@Autowired
	private AttachmentService attachmentService;
	@Autowired
	private MainService mainService;
	
	@Autowired
	ServletContext application;

	@GetMapping("/board.do")
	public String board(@RequestParam(defaultValue = "1") int cPage, int boardNo, int groupNo, Model model,
			HttpServletRequest request, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);

		int limit = 10;
		int offset = (cPage - 1) * limit;

		List<Post> boardPostList = boardService.selectAllPostInBoard(boardNo, limit, offset);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		log.debug("boardPostList = {}", boardPostList);
		model.addAttribute("boardPostList", boardPostList);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("title", "# " + board.getBoardName());

		int totalContent = boardService.selectPostInBoardTotalCount(boardNo);
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);

		// MemberWithGroupList 불러오기
		List<MemberWithGroup> memberWithGroupList = boardService.memberWithGroupList(groupNo);

		// memberId, nickname map에 담기
		Map<String, String> memberWithGroupMap = new HashMap<>();
		for (MemberWithGroup memberWithGroup : memberWithGroupList) {
			memberWithGroupMap.put(memberWithGroup.getId(), memberWithGroup.getNickname());
		}
		model.addAttribute("memberWithGroupMap", memberWithGroupMap);

		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);

		model.addAttribute("pagebar", pagebar);

		return "gw/board/board";
	}

	@GetMapping("/notice.do")
	public String notice(@RequestParam(defaultValue = "1") int cPage, int boardNo, int groupNo, Model model,
			HttpServletRequest request, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);

		int limit = 10;
		int offset = (cPage - 1) * limit;

		List<Post> noticePostList = boardService.selectAllPostInNotice(boardNo, limit, offset);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		log.debug("noticePostList = {}", noticePostList);
		model.addAttribute("noticePostList", noticePostList);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("title", "# " + board.getBoardName());

		int totalContent = boardService.selectPostInBoardTotalCount(boardNo);
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);

		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);

		model.addAttribute("pagebar", pagebar);

		return "gw/board/notice";
	}
	

	@GetMapping("/noticeEnroll.do")
	public void noticeEnroll(@RequestParam int boardNo, @RequestParam int groupNo, Model model, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("title", "# " + board.getBoardName() + " 작성");
	}

	@PostMapping("/noticeEnroll.do")
	public String noticeEnroll(Post post, int boardNo, int groupNo,
			@RequestParam(value="upFile", required=false) MultipartFile upFile,RedirectAttributes redirectAttr,
    		Authentication authentication) {
		
		String memberId = post.getMemberId();
		log.debug("memberId = {}", post.getMemberId());
		Board board = boardService.selectBoardByBoardNo(boardNo);
		log.debug("***********board = {}", board);
		 try {
			 String saveDirectory = application.getRealPath("/resources/upFile/fileboard");
			 log.debug("saveDirectory = {}", saveDirectory);
		 
			 
		 if(upFile != null && !upFile.isEmpty() && upFile.getSize() != 0) {
			 log.debug("upFile = {}", upFile);
			 log.debug("upFile.name = {}",upFile.getOriginalFilename());
			 log.debug("upFile.size = {}",upFile.getSize());
		 
			 String originalFilename = upFile.getOriginalFilename();
			 String renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);
			 
			 // 1.서버컴퓨터에 저장
			 File dest = new File(saveDirectory, renamedFilename);
			 log.debug("dest = {}", dest);
			 upFile.transferTo(dest);
			 
			 // 2.DB에 attachment 레코드 등록
			 Attachment attach = new Attachment();
			 attach.setRenamedFilename(renamedFilename);
			 attach.setOriginalFilename(originalFilename);
			 attach.setGroupNo(groupNo);
			 attach.setMemberId(memberId);
			 
			 int attachNo = boardService.insertAttach(attach);
			 
			 int result = boardService.insertPostFile(post);
		 } else {
			 // 업무로직
			 int result = boardService.insertPost(post);
		 } 
		 
		 } catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅 throw e; //spring container에게 던짐.
			 	
		 }
		log.debug("***************boardType = {}", board.getBoardType());
		if(board.getBoardType() == 'N') {
			return "redirect:/gw/board/notice.do?boardNo="+boardNo+"&groupNo="+groupNo;
		} else {
			return "redirect:/gw/board/board.do?boardNo="+boardNo+"&groupNo="+groupNo;
		}
	}
	
	@GetMapping("/anonymousEnroll.do")
	public void anonymousEnroll(@RequestParam int boardNo, @RequestParam int groupNo, Model model, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("title", "# " + board.getBoardName() + " - 글쓰기");

	} 
	
	@PostMapping("/anonymousEnroll.do")
	public String anonymousEnroll(Post post, int boardNo, int groupNo, @RequestParam(value = "upFile", required = false) MultipartFile upFile, RedirectAttributes redirectAttr, Authentication authentication) {

		String memberId = post.getMemberId();
		log.debug("memberId = {}", post.getMemberId());
		Board board = boardService.selectBoardByBoardNo(boardNo);

		try {
			String saveDirectory = application.getRealPath("/resources/upFile/fileboard");
			log.debug("saveDirectory = {}", saveDirectory);

			if (upFile != null && !upFile.isEmpty() && upFile.getSize() != 0) {
				log.debug("upFile = {}", upFile);
				log.debug("upFile.name = {}", upFile.getOriginalFilename());
				log.debug("upFile.size = {}", upFile.getSize());

				String originalFilename = upFile.getOriginalFilename();
				String renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);

				// 1.서버컴퓨터에 저장
				File dest = new File(saveDirectory, renamedFilename);
				log.debug("dest = {}", dest);
				upFile.transferTo(dest);

				// 2.DB에 attachment 레코드 등록
				Attachment attach = new Attachment();
				attach.setRenamedFilename(renamedFilename);
				attach.setOriginalFilename(originalFilename);
				attach.setGroupNo(groupNo);
				attach.setMemberId(memberId);

				int attachNo = boardService.insertAttach(attach);

				int result = boardService.insertPostFile(post);
			} else {
				// 업무로직
				int result = boardService.insertPost(post);
			}

		} catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅 throw e; //spring container에게 던짐.

		}

		return "redirect:/gw/board/anonymous.do?boardNo=" + boardNo + "&groupNo=" + groupNo;
	}
	

	@GetMapping("/postModify.do")
	public void postModify(@RequestParam int postNo, Model model, Authentication auth) {
		Post post = boardService.selectOnePostInBoard(postNo);
		int boardNo = post.getBoardNo();
		Board board = boardService.selectBoardByBoardNo(boardNo);
		int groupNo = board.getGroupNo();
		groupwareHeaderSet(groupNo, model, auth);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("post", post);
		model.addAttribute("board", board);
		model.addAttribute("title", "# " + board.getBoardName() + " - 글쓰기");
		
	}
	
//	@PostMapping("/boardEnroll.do")
//	public String boardEnroll(Post post, int boardNo, int groupNo,
//			@RequestParam(value = "upFile", required = false) MultipartFile upFile, RedirectAttributes redirectAttr,
//			Authentication authentication) {
//		
//		String memberId = post.getMemberId();
//		log.debug("memberId = {}", post.getMemberId());
//		Board board = boardService.selectBoardByBoardNo(boardNo);
//		
//		try {
//			String saveDirectory = application.getRealPath("/resources/upFile/fileboard");
//			log.debug("saveDirectory = {}", saveDirectory);
//			
//			if (upFile != null && !upFile.isEmpty() && upFile.getSize() != 0) {
//				log.debug("upFile = {}", upFile);
//				log.debug("upFile.name = {}", upFile.getOriginalFilename());
//				log.debug("upFile.size = {}", upFile.getSize());
//				
//				String originalFilename = upFile.getOriginalFilename();
//				String renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);
//				
//				// 1.서버컴퓨터에 저장
//				File dest = new File(saveDirectory, renamedFilename);
//				log.debug("dest = {}", dest);
//				upFile.transferTo(dest);
//				
//				// 2.DB에 attachment 레코드 등록
//				Attachment attach = new Attachment();
//				attach.setRenamedFilename(renamedFilename);
//				attach.setOriginalFilename(originalFilename);
//				attach.setGroupNo(groupNo);
//				attach.setMemberId(memberId);
//				
//				int attachNo = boardService.insertAttach(attach);
//				
//				int result = boardService.insertPostFile(post);
//			} else {
//				// 업무로직
//				int result = boardService.insertPost(post);
//			}
//			
//		} catch (Exception e) {
//			log.error(e.getMessage(), e); // 로깅 throw e; //spring container에게 던짐.
//			
//		}
//		
//		if (board.getBoardType() == 'N') {
//			return "redirect:/gw/board/notice.do?boardNo=" + boardNo + "&groupNo=" + groupNo;
//		} else {
//			return "redirect:/gw/board/board.do?boardNo=" + boardNo + "&groupNo=" + groupNo;
//		}
//	}
	
	@GetMapping("/boardEnroll.do")
	public void boardEnroll(@RequestParam int boardNo, @RequestParam int groupNo, Model model, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("title", "# " + board.getBoardName() + " - 글쓰기");

	}

	@PostMapping("/boardEnroll.do")
	public String boardEnroll(Post post, int boardNo, int groupNo,
			@RequestParam(value = "upFile", required = false) MultipartFile upFile, RedirectAttributes redirectAttr,
			Authentication authentication) {

		String memberId = post.getMemberId();
		log.debug("memberId = {}", post.getMemberId());
		Board board = boardService.selectBoardByBoardNo(boardNo);

		try {
			String saveDirectory = application.getRealPath("/resources/upFile/fileboard");
			log.debug("saveDirectory = {}", saveDirectory);

			if (upFile != null && !upFile.isEmpty() && upFile.getSize() != 0) {
				log.debug("upFile = {}", upFile);
				log.debug("upFile.name = {}", upFile.getOriginalFilename());
				log.debug("upFile.size = {}", upFile.getSize());

				String originalFilename = upFile.getOriginalFilename();
				String renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);

				// 1.서버컴퓨터에 저장
				File dest = new File(saveDirectory, renamedFilename);
				log.debug("dest = {}", dest);
				upFile.transferTo(dest);

				// 2.DB에 attachment 레코드 등록
				Attachment attach = new Attachment();
				attach.setRenamedFilename(renamedFilename);
				attach.setOriginalFilename(originalFilename);
				attach.setGroupNo(groupNo);
				attach.setMemberId(memberId);

				int attachNo = boardService.insertAttach(attach);

				int result = boardService.insertPostFile(post);
			} else {
				// 업무로직
				int result = boardService.insertPost(post);
			}

		} catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅 throw e; //spring container에게 던짐.

		}

		if (board.getBoardType() == 'N') {
			return "redirect:/gw/board/notice.do?boardNo=" + boardNo + "&groupNo=" + groupNo;
		} else {
			return "redirect:/gw/board/board.do?boardNo=" + boardNo + "&groupNo=" + groupNo;
		}
	}

	@GetMapping("/boardDetail.do")
	public String boardDetail(@RequestParam int postNo, Model model, HttpServletRequest request, HttpServletResponse response, Authentication auth) {
		Post post = boardService.selectOnePostInBoard(postNo);
		Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		int groupNo = board.getGroupNo();
		groupwareHeaderSet(groupNo, model, auth);
		Attachment attach = mainService.selectOneAttach(post.getAttachNo());
		
		// MemberWithGroupList 불러오기
		List<MemberWithGroup> memberWithGroupList = boardService.memberWithGroupList(groupNo);

		// memberId, nickname map에 담기
		Map<String, String> memberWithGroupMap = new HashMap<>();
		for (MemberWithGroup memberWithGroup : memberWithGroupList) {
			memberWithGroupMap.put(memberWithGroup.getId(), memberWithGroup.getNickname());
		}
		model.addAttribute("memberWithGroupMap", memberWithGroupMap);
		
		log.debug("post = {}", post);
		model.addAttribute("post", post);
		model.addAttribute("attach", attach);
		model.addAttribute("title", "# " + board.getBoardName());

		return "gw/board/boardDetail";
	}
	
	@GetMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam int postNo, Model model, HttpServletRequest request, HttpServletResponse response, Authentication auth) {
		Post post = boardService.selectOnePostInNotice(postNo);
		Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		int groupNo = board.getGroupNo();
		groupwareHeaderSet(groupNo, model, auth);
		Attachment attach = mainService.selectOneAttach(post.getAttachNo());
		
		// MemberWithGroupList 불러오기
		List<MemberWithGroup> memberWithGroupList = boardService.memberWithGroupList(groupNo);

		// memberId, nickname map에 담기
		Map<String, String> memberWithGroupMap = new HashMap<>();
		for (MemberWithGroup memberWithGroup : memberWithGroupList) {
			memberWithGroupMap.put(memberWithGroup.getId(), memberWithGroup.getNickname());
		}
		model.addAttribute("memberWithGroupMap", memberWithGroupMap);
		
		log.debug("post = {}", post);
		model.addAttribute("post", post);
		model.addAttribute("attach", attach);
		model.addAttribute("title", "# " + board.getBoardName());

		return "gw/board/noticeDetail";
	}
	
	@GetMapping("/anonymousDetail.do")
	public String anonymousDetail(@RequestParam int postNo, Model model, HttpServletRequest request, HttpServletResponse response) {

		Post post = boardService.selectOnePostInAnonymous(postNo);
		log.debug("post = {}", post);
		/* Attachment attach = boardService.selectOneAttachInBoard(groupNo); */
		model.addAttribute("post", post);
		/* model.addAttribute("attach", attach); */

		return "gw/board/anonymousDetail";
	}


	@GetMapping("/deletePostBoard.do")
	public String deletePostBoard(@RequestParam int postNo, RedirectAttributes redirectAttr) {
		    	
		 Post post = boardService.selectOnePostInBoard(postNo);
		 Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		 Attachment attachment = mainService.selectOneAttach(post.getAttachNo());
		 
		 try {
				String saveDirectory = application.getRealPath("/resources/upFile/fileboard");
				String filename = attachment.getRenamedFilename();
				File delFile = new File(saveDirectory, filename);
				boolean delBool = delFile.delete();
				
				if(delBool == true) {
					boardService.deleteAttachInBoard(post.getAttachNo());
				}
				int result  = boardService.deletePostInBoard(postNo);
				log.debug("********** result = {} ", result);
				redirectAttr.addFlashAttribute("msg", result > 0 ? "게시물이 삭제되었습니다." : "실패");

			} catch (Exception e) {
				log.error(e.getMessage(), e); // 로깅
		}

		if (board.getBoardType() == 'N') {
			return "redirect:/gw/board/notice.do?boardNo=" + post.getBoardNo() + "&groupNo=" + board.getGroupNo();
		} else {
			return "redirect:/gw/board/board.do?boardNo=" + post.getBoardNo() + "&groupNo=" + board.getGroupNo();
		}
		 
	}
	
	@GetMapping("/anonymous.do")
	public String anonymous(@RequestParam(defaultValue = "1") int cPage, int boardNo, int groupNo, Model model,
			HttpServletRequest request, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);

		int limit = 10;
		int offset = (cPage - 1) * limit;

		List<Post> anonymousPostList = boardService.selectAllPostInAnonymous(boardNo, limit, offset);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		log.debug("anonymousPostList = {}", anonymousPostList);
		model.addAttribute("anonymousPostList", anonymousPostList);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("title", "# " + board.getBoardName());

		int totalContent = boardService.selectPostInBoardTotalCount(boardNo);
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);

		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);

		model.addAttribute("pagebar", pagebar);

		return "gw/board/anonymous";
	}

	
	@PostMapping("/createBoardRoom.do")
	public String createBoardRoom(Board board, RedirectAttributes redirectAtt) {

		int result = boardService.createBoardRoom(board);
		redirectAtt.addAttribute("groupNo", board.getGroupNo());
		redirectAtt.addAttribute("msg", result > 0 ? "게시판 ["+board.getBoardName()+"]이 개설되었습니다." : "실패");
		
		return "redirect:/gw/gw.do";
	}
	
	@PostMapping("/updateBoardRoom.do")
	public String updateBoardRoom(@ModelAttribute Board board, RedirectAttributes redirectAtt, HttpSession session) {
		String location = "/";
		try {
			log.debug("board = {}", board);
			
			int result = boardService.updateBoardRoom(board);
			redirectAtt.addFlashAttribute("msg", result > 0 ? "게시판이 변경되었습니다." : "실패");
			
			String redirect = (String) session.getAttribute("redirect");
			log.debug("redirect = {}", redirect);
			if(redirect != null) {
				location = redirect;
				session.removeAttribute("redirect");
			}
		} catch(Exception e) {
			log.error("게시판 변경 실패!", e);
			throw e;
		}
		
		return "redirect:/gw/gw.do?groupNo=" + board.getGroupNo();
	}
	
	@PostMapping("/deleteBoardRoom.do")
	public String deleteBoardRoom(@ModelAttribute Board board, RedirectAttributes redirectAtt, HttpSession session) {
		String location = "/";
		try {
			log.debug("board = {}", board);
			
			int result = boardService.deleteBoardRoom(board);
			redirectAtt.addFlashAttribute("msg", result > 0 ? "게시판이 삭제되었습니다." : "실패");
			
			String redirect = (String) session.getAttribute("redirect");
			log.debug("redirect = {}", redirect);
			if(redirect != null) {
				location = redirect;
				session.removeAttribute("redirect");
			}
		} catch(Exception e) {
			log.error("게시판 변경 실패!", e);
			throw e;
		}
		
		return "redirect:/gw/gw.do?groupNo=" + board.getGroupNo();
	}

	public void groupwareHeaderSet(int groupNo, Model model, Authentication auth) {
		Member loginMember = (Member) auth.getPrincipal();
		Group myGroup = gwService.selectMyGroup(groupNo);
		List<Member> myGroupMemberList = gwService.selectAllGroupMembers(groupNo);

		List<Group> myGroupList = gwService.selectAllMyGroup(loginMember.getId());
		List<Attachment> groupBannerAttachList = gwService.selectAllGroupBannerAttach();
		List<String> memberProfileRenamedFilenameList = new ArrayList<String>();
		for (Member m : myGroupMemberList) {
			String memberProfileRenamedFilename = gwService.selectMemberProfileRenamedFilename(m.getId());
			memberProfileRenamedFilenameList.add(memberProfileRenamedFilename);
		}

		List<ChatRoom> chattingChannelList = gwService.selectAllChatRoomByGroupNo(groupNo);
		List<Board> boardList = gwService.selectAllBoardRoomByGroupNo(groupNo);

		model.addAttribute("currGroupNo", groupNo);
		model.addAttribute("myGroup", myGroup);
		model.addAttribute("myGroupMemberList", myGroupMemberList);
		model.addAttribute("chattingChannelList", chattingChannelList);
		model.addAttribute("profile", gwService.selectMemberProfileRenamedFilename(loginMember.getId()));
		model.addAttribute("memberProfileRenamedFilenameList", memberProfileRenamedFilenameList);
		model.addAttribute("groupBannerAttachList", groupBannerAttachList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("myGroupList", myGroupList);
	}

}
