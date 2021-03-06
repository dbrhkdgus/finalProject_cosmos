package com.kh.cosmos.groupware.board.controller;

import java.beans.PropertyEditor;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.attachment.model.service.AttachmentService;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.service.BoardService;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostReplyCount;
import com.kh.cosmos.groupware.board.model.vo.PostWithNickname;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.main.model.service.MainService;
import com.kh.cosmos.main.model.vo.Reply;
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
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// ????????????, ??????????????????("" -> null)
		PropertyEditor editor = new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, editor);
	}

	@Autowired
	ServletContext application;

	@GetMapping("/board.do")
	public String board(@RequestParam(defaultValue = "1") int cPage, int boardNo, int groupNo, Model model,
			HttpServletRequest request, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = boardService.selectPostInBoardTotalCount(boardNo);
		String url = request.getRequestURI();
		url += "?boardNo=" + boardNo + "&groupNo=" + groupNo;
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		model.addAttribute("pagebar", pagebar);
	
		// MemberWithGroupList ????????????
		List<MemberWithGroup> memberWithGroupList = boardService.memberWithGroupList(groupNo);
		
		// memberId, nickname map??? ??????
		Map<String, String> memberWithGroupMap = new HashMap<>();
		for (MemberWithGroup memberWithGroup : memberWithGroupList) {
			memberWithGroupMap.put(memberWithGroup.getId(), memberWithGroup.getNickname());
		}
		
		List<Post> boardPostList = boardService.selectAllPostInBoard(boardNo, limit, offset);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		log.debug("boardPostList = {}", boardPostList);
		
		List<PostReplyCount> replyCount = boardService.selectReplyCount();
		model.addAttribute("replyCount", replyCount);
		log.debug("replyCount = {}", replyCount);
		
		model.addAttribute("boardPostList", boardPostList);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("memberWithGroupMap", memberWithGroupMap);
		model.addAttribute("title", "# " + board.getBoardName());
	
	
		return "gw/board/board";
	}
	
	
	@GetMapping("/boardSearch.do")
	public String boardSearch(@RequestParam(defaultValue = "1") int cPage, int boardNo, int groupNo, Model model,
			HttpServletRequest request, Authentication auth) throws ParseException {
		groupwareHeaderSet(groupNo, model, auth);
		
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		
		Map<String, Object> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("searchKeyword", searchKeyword);
		param.put("boardNo", boardNo);
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = boardService.selectSearchBoardTotalCnt(param);
		log.debug("totalContent = {}",totalContent);
		String url = request.getRequestURI();
//		url += "?boardNo=" + boardNo + "&groupNo=" + groupNo;
		url += "?boardNo=" + boardNo + "&groupNo=" +groupNo + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword;
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);

		List<PostWithNickname> boardPostList = boardService.searchBoardList(param, limit, offset);
		log.debug("boardPostList = {}", boardPostList);
		model.addAttribute("boardPostList", boardPostList);
		
		// MemberWithGroupList ????????????
		List<MemberWithGroup> memberWithGroupList = boardService.memberWithGroupList(groupNo);
		
		// memberId, nickname map??? ??????
		Map<String, String> memberWithGroupMap = new HashMap<>();
		for (MemberWithGroup memberWithGroup : memberWithGroupList) {
			memberWithGroupMap.put(memberWithGroup.getId(), memberWithGroup.getNickname());
		}
		Board board = boardService.selectBoardByBoardNo(boardNo);
		
		List<PostReplyCount> replyCount = boardService.selectReplyCount();
		model.addAttribute("replyCount", replyCount);
		log.debug("replyCount = {}", replyCount);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("memberWithGroupMap", memberWithGroupMap);
		model.addAttribute("pagebar", pagebar);
		model.addAttribute("title", "# " + board.getBoardName());

		return "gw/board/board";
	}

	@GetMapping("/notice.do")
	public String notice(@RequestParam(defaultValue = "1") int cPage, int boardNo, int groupNo, Model model,
			HttpServletRequest request, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);

		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = boardService.selectPostInBoardTotalCount(boardNo);
		model.addAttribute("totalContent", totalContent);
		String url = request.getRequestURI();
		url += "?boardNo=" + boardNo + "&groupNo=" + groupNo;
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
		
		List<PostReplyCount> replyCount = boardService.selectReplyCount();
		model.addAttribute("replyCount", replyCount);
		log.debug("replyCount = {}", replyCount);

		List<Post> noticePostList = boardService.selectAllPostInBoard(boardNo, limit, offset);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		log.debug("noticePostList = {}", noticePostList);
		model.addAttribute("noticePostList", noticePostList);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("title", "# " + board.getBoardName());

		return "gw/board/notice";
	}
	
	@GetMapping("/noticeSearch.do")
	public String noticeSearch(@RequestParam(defaultValue = "1") int cPage, int boardNo, int groupNo, Model model,
			HttpServletRequest request, Authentication auth) throws ParseException {
		groupwareHeaderSet(groupNo, model, auth);
		
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		
		Map<String, Object> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("searchKeyword", searchKeyword);
		param.put("boardNo", boardNo);
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = boardService.selectSearchBoardTotalCnt(param);
		log.debug("totalContent = {}",totalContent);
		String url = request.getRequestURI();
//		url += "?boardNo=" + boardNo + "&groupNo=" + groupNo;
		url += "?boardNo=" + boardNo + "&groupNo=" +groupNo + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword;
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		
		List<PostWithNickname> noticePostList = boardService.searchBoardList(param, limit, offset);
		log.debug("noticePostList = {}", noticePostList);
		model.addAttribute("noticePostList", noticePostList);
		
		List<PostReplyCount> replyCount = boardService.selectReplyCount();
		model.addAttribute("replyCount", replyCount);
		log.debug("replyCount = {}", replyCount);
		
		Board board = boardService.selectBoardByBoardNo(boardNo);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("pagebar", pagebar);
		model.addAttribute("title", "# " + board.getBoardName());
		
		return "gw/board/notice";
	}


	@GetMapping("/noticeEnroll.do")
	public void noticeEnroll(@RequestParam int boardNo, @RequestParam int groupNo, Model model, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("title", "# " + board.getBoardName() + " ??????");
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
			 
			 // 1.?????????????????? ??????
			 File dest = new File(saveDirectory, renamedFilename);
			 log.debug("dest = {}", dest);
			 upFile.transferTo(dest);
			 
			 // 2.DB??? attachment ????????? ??????
			 Attachment attach = new Attachment();
			 attach.setRenamedFilename(renamedFilename);
			 attach.setOriginalFilename(originalFilename);
			 attach.setGroupNo(groupNo);
			 attach.setMemberId(memberId);
			 
			 int attachNo = boardService.insertAttach(attach);
			 
			 int result = boardService.insertPostFile(post);
		 } else {
			 // ????????????
			 int result = boardService.insertPost(post);
		 } 
		 
		 } catch (Exception e) {
			log.error(e.getMessage(), e); // ?????? throw e; //spring container?????? ??????.
			 	
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
		model.addAttribute("title", "# " + board.getBoardName() + " - ?????????");

	} 
	
	@PostMapping("/anonymousEnroll.dto")
	public String anonymousEnroll(Post post, int boardNo, int groupNo, @RequestParam(value = "upFile", required = false) MultipartFile upFile, 
			RedirectAttributes redirectAttr, Authentication authentication) {

		String memberId = post.getMemberId();
		log.debug("memberId = {}", post.getMemberId());
		Board board = boardService.selectBoardByBoardNo(boardNo);

		
		int result = boardService.insertPostInAnonymous(post);	
		return "redirect:/gw/board/anonymous.do?boardNo=" + boardNo + "&groupNo=" + groupNo;
	}
	

	@GetMapping("/postModify.do")
	public void postModify(@RequestParam int postNo, Model model, Authentication auth) {
		Post post = boardService.selectOnePostInBoard(postNo);
		int boardNo = post.getBoardNo();
		Board board = boardService.selectBoardByBoardNo(boardNo);
		int groupNo = board.getGroupNo();
		Attachment attach = boardService.selectOneAttachInBoard(post.getAttachNo());
		groupwareHeaderSet(groupNo, model, auth);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("post", post);
		model.addAttribute("board", board);
		model.addAttribute("attach", attach);
		model.addAttribute("title", "# " + board.getBoardName());
		
	}
	
	@PostMapping("/postModify.dto")
	public String postModify(Post post, int exAttachNo, int boardNo, int groupNo,
			@RequestParam(value = "upFile", required = false) MultipartFile upFile, RedirectAttributes redirectAttr,
			Authentication authentication) {
		log.debug("******post = {} " , post);
		String memberId = post.getMemberId();
		log.debug("memberId = {}", post.getMemberId());
		Board board = boardService.selectBoardByBoardNo(boardNo);
		
		try {
			String saveDirectory = application.getRealPath("/resources/upFile/fileboard");
			log.debug("saveDirectory = {}", saveDirectory);
			Attachment exAttachment = mainService.selectOneAttach(exAttachNo);
			
			if (upFile != null && !upFile.isEmpty() && upFile.getSize() != 0) {
				log.debug("upFile = {}", upFile);
				log.debug("upFile.name = {}", upFile.getOriginalFilename());
				log.debug("upFile.size = {}", upFile.getSize());
				
				String originalFilename = upFile.getOriginalFilename();
				String renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);
				
				// 1.?????????????????? ??????
				File dest = new File(saveDirectory, renamedFilename);
				log.debug("dest = {}", dest);
				upFile.transferTo(dest);
				
				// 2.DB??? attachment ????????? ??????
				Attachment attach = new Attachment();
				attach.setRenamedFilename(renamedFilename);
				attach.setOriginalFilename(originalFilename);
				attach.setGroupNo(groupNo);
				attach.setMemberId(memberId);
				
				int result = boardService.insertAttach(attach);
				
				if(result > 0 && post != null && exAttachNo != 0) {
					String exFilename = exAttachment.getRenamedFilename();
					File delFile = new File(saveDirectory, exFilename);
					boolean delBool = delFile.delete();
					
					if(delBool == true) {
						boardService.deleteAttachInBoard(exAttachNo);
					}
				}
				
				result = boardService.updatePostFile(post);
			} else {
				// ????????????
				int result = boardService.updatePost(post);
			}
			
		} catch (Exception e) {
			log.error(e.getMessage(), e); // ?????? throw e; //spring container?????? ??????.
			
		}
		
			return "redirect:/gw/board/boardDetail.do?postNo=" + post.getPostNo();
	}
	
	
	@PostMapping("/checkPassword.do")
	public String checkPassword(@RequestParam int postNo, int postPassword, RedirectAttributes redirectAttr) {
		Post post = boardService.selectOnePostInBoard(postNo);
		Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		
		if(post.getPostPassword() != postPassword){
		
			redirectAttr.addFlashAttribute("msg","??????????????? ???????????? ????????????.");
			return "redirect:/gw/board/anonymousDetail.do?postNo="+ postNo;
		}else{
			
			return "redirect:/gw/board/anonymousPostModify.do?postNo=" + post.getPostNo();
		
		}			
			
	}
	
	@GetMapping("/anonymousPostModify.do")
	public void anonymousPostModify(@RequestParam int postNo, Model model, Authentication auth) {
		Post post = boardService.selectOnePostInBoard(postNo);
		int boardNo = post.getBoardNo();
		Board board = boardService.selectBoardByBoardNo(boardNo);
		int groupNo = board.getGroupNo();
		groupwareHeaderSet(groupNo, model, auth);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("post", post);
		model.addAttribute("board", board);
		model.addAttribute("title", "# " + board.getBoardName()); 

	} 
	
	@PostMapping("/anonymousPostModify.dto")
	public String anonymousPostModify(RedirectAttributes redirectAttr, int postNo, Post post) {
	
		Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		
			
	    int result = boardService.updatePost(post);
		log.debug("********** result = {} ", result);
		
			redirectAttr.addFlashAttribute("msg", result > 0 ? "???????????? ?????????????????????." : "??????");
			 
			return "redirect:/gw/board/anonymousDetail.do?postNo=" + post.getPostNo();
			
		}
	

	@GetMapping("/boardEnroll.do")
	public void boardEnroll(@RequestParam int boardNo, @RequestParam int groupNo, Model model, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("title", "# " + board.getBoardName() + " - ?????????");

	}

	@PostMapping("/boardEnroll.dto")
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

				// 1.?????????????????? ??????
				File dest = new File(saveDirectory, renamedFilename);
				log.debug("dest = {}", dest);
				upFile.transferTo(dest);

				// 2.DB??? attachment ????????? ??????
				Attachment attach = new Attachment();
				attach.setRenamedFilename(renamedFilename);
				attach.setOriginalFilename(originalFilename);
				attach.setGroupNo(groupNo);
				attach.setMemberId(memberId);

				int attachNo = boardService.insertAttach(attach);
				
				int result = boardService.insertPostFile(post);
			} else {
				// ????????????
				int result = boardService.insertPost(post);
			}

		} catch (Exception e) {
			log.error(e.getMessage(), e); // ?????? throw e; //spring container?????? ??????.

		}

		if (board.getBoardType() == 'N') {
			return "redirect:/gw/board/notice.do?boardNo=" + boardNo + "&groupNo=" + groupNo;
		} else {
			return "redirect:/gw/board/board.do?boardNo=" + boardNo + "&groupNo=" + groupNo;
		}
	}

	@GetMapping("/boardDetail.do")
	public String boardDetail(@RequestParam("postNo") int postNo, Model model, HttpServletRequest request, HttpServletResponse response, Authentication auth) {
		
		Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	        	log.debug("Cookie = {}", cookie);
	        	log.debug("Cookie = {}", cookie.getName());
	            if (cookie.getName().equals("noticeView")) {
	                oldCookie = cookie;
	                log.debug("Cookie = {}", oldCookie.getValue());
	            }
	        }
	    }
	    log.debug("oldCookie = {}", oldCookie);
	    int result = 0;
	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + Integer.toString(postNo) + "]")) {
	            result = boardService.postViewCountUp(postNo);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + Integer.toString(postNo) + "]");
	            oldCookie.setPath("/cosmos");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	result = boardService.postViewCountUp(postNo);
	        Cookie newCookie = new Cookie("noticeView","[" + Integer.toString(postNo) + "]");
	        newCookie.setPath("/cosmos");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
		
		Post post = boardService.selectOnePostInBoard(postNo);
		Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		int groupNo = board.getGroupNo();
		groupwareHeaderSet(groupNo, model, auth);
		Attachment attach = mainService.selectOneAttach(post.getAttachNo());
		
		// MemberWithGroupList ????????????
		List<MemberWithGroup> memberWithGroupList = boardService.memberWithGroupList(groupNo);
		
		// memberId, nickname map??? ??????
		Map<String, String> memberWithGroupMap = new HashMap<>();
		for (MemberWithGroup memberWithGroup : memberWithGroupList) {
			memberWithGroupMap.put(memberWithGroup.getId(), memberWithGroup.getNickname());
		}
		
		List<Reply> replyList = boardService.selectReplyListByPostNo(postNo);
		List<Attachment> attachmentList = boardService.selectProfileAttachmentList();
		
		model.addAttribute("post", post);
		model.addAttribute("attach", attach);
		model.addAttribute("title", "# " + board.getBoardName());
		model.addAttribute("memberWithGroupMap", memberWithGroupMap);
		model.addAttribute("replyList", replyList);
		model.addAttribute("attachmentList", attachmentList);

		return "gw/board/boardDetail";
	}
	
	@PostMapping("postReplyEnroll.do")
	public String postReplyEnroll(Reply reply, int postNo, int replyLevel, int replyRef, String content, String replyPw, RedirectAttributes redirectAttr, Authentication authentication, HttpServletRequest request) {
		Member member = (Member)authentication.getPrincipal();
		reply.setMemberId(member.getId());
		reply.setPostNo(postNo);
		reply.setReplyLevel(replyLevel);
		reply.setReplyRef(replyRef);
		
		try {
			int result = boardService.insertPostReply(reply);

		} catch (Exception e) {
			log.error(e.getMessage(), e); // 
		 	redirectAttr.addFlashAttribute("msg", "?????? ?????? ??????");
		}

		return "redirect:/gw/board/boardDetail.do?postNo=" + postNo;
	}
	
	@PostMapping("anonymousReplyEnroll.do")
	public String anonymousReplyEnroll(Reply reply, int postNo, RedirectAttributes redirectAttr, Authentication authentication, HttpServletRequest request) {
		
		Member member = (Member)authentication.getPrincipal();
		log.debug("********************** reply = {}", reply);
		reply.setMemberId(member.getId());
		log.debug("********************** reply = {}", reply);
		
		try {
			int result = boardService.insertAnonymousReply(reply);
			String msg = result > 0 ? "?????? ?????? ??????!" : "?????? ?????? ??????!";
			redirectAttr.addFlashAttribute("msg", msg);
			
		} catch (Exception e) {
			log.error(e.getMessage(), e); // 
			redirectAttr.addFlashAttribute("msg", "?????? ?????? ??????");
		}

		return "redirect:/gw/board/anonymousDetail.do?postNo=" + postNo;
	}
	
	@PostMapping("deleteUpdateReply.do")
	public String deleteUpdateReply(Reply reply, String type, int postNo, RedirectAttributes redirectAttr) {
		try {
			log.debug(type);
			if(type.equals("update")) {
				int result = boardService.updatePostReply(reply);
				String msg = result > 0 ? "?????? ?????? ??????!" : "?????? ?????? ??????!";
				redirectAttr.addFlashAttribute("msg", msg);
			} else {
				int result = boardService.deletePostReply(reply);
				String msg = result > 0 ? "?????? ?????? ??????!" : "?????? ?????? ??????!";
				redirectAttr.addFlashAttribute("msg", msg);
			}
			
		} catch(Exception e) {
			log.error(e.getMessage(), e); // 
		 	redirectAttr.addFlashAttribute("msg", "??????");
		}
		Post post = boardService.selectOnePostInBoard(postNo);
		Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		if(board.getBoardType() == 'A') {
			return "redirect:/gw/board/anonymousDetail.do?postNo=" + postNo;
		} else {
			return "redirect:/gw/board/boardDetail.do?postNo=" + postNo;
		}
	}
	
	@PostMapping("deleteUpdateAnonymousReply.do")
	public String deleteUpdateAnonymousReply(Reply reply, String type, String replyPw, int replyNo, int postNo, RedirectAttributes redirectAttr) {
		try {
			log.debug("*************reply = {}", reply);
			log.debug("*************replyPw = {}", replyPw);
			
			Reply selectedReply = boardService.selectOneReply(replyNo);
			log.debug("*************selectedReply = {}", selectedReply);
			
			if(!selectedReply.getReplyPw().equals(replyPw)){
				redirectAttr.addFlashAttribute("msg","??????????????? ???????????? ????????????.");
				return "redirect:/gw/board/anonymousDetail.do?postNo="+ postNo;
			}else{
				log.debug(type);
				if(type.equals("update")) {
					int result = boardService.updatePostReply(reply);
					String msg = result > 0 ? "?????? ?????? ??????!" : "?????? ?????? ??????!";
					redirectAttr.addFlashAttribute("msg", msg);
				} else {
					int result = boardService.deletePostReply(reply);
					String msg = result > 0 ? "?????? ?????? ??????!" : "?????? ?????? ??????!";
					redirectAttr.addFlashAttribute("msg", msg);
				}
			}
			
		} catch(Exception e) {
			log.error(e.getMessage(), e); // 
			redirectAttr.addFlashAttribute("msg", "??????");
		}

		return "redirect:/gw/board/anonymousDetail.do?postNo=" + postNo;
	}
	
	@GetMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam int postNo, Model model, HttpServletRequest request, HttpServletResponse response, Authentication auth) {
		Post post = boardService.selectOnePostInBoard(postNo);
		Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		int groupNo = board.getGroupNo();
		groupwareHeaderSet(groupNo, model, auth);
		Attachment attach = mainService.selectOneAttach(post.getAttachNo());
		
		// MemberWithGroupList ????????????
		List<MemberWithGroup> memberWithGroupList = boardService.memberWithGroupList(groupNo);

		// memberId, nickname map??? ??????
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
	public String anonymousDetail(@RequestParam int postNo, Model model, HttpServletRequest request, HttpServletResponse response, Authentication auth) {
		
		Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	        	log.debug("Cookie = {}", cookie);
	        	log.debug("Cookie = {}", cookie.getName());
	            if (cookie.getName().equals("noticeView")) {
	                oldCookie = cookie;
	                log.debug("Cookie = {}", oldCookie.getValue());
	            }
	        }
	    }
	    log.debug("oldCookie = {}", oldCookie);
	    int result = 0;
	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + Integer.toString(postNo) + "]")) {
	            result = boardService.postViewCountUp(postNo);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + Integer.toString(postNo) + "]");
	            oldCookie.setPath("/cosmos");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	result = boardService.postViewCountUp(postNo);
	        Cookie newCookie = new Cookie("noticeView","[" + Integer.toString(postNo) + "]");
	        newCookie.setPath("/cosmos");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
		
		Post post = boardService.selectOnePostInBoard(postNo);
		Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		int groupNo = board.getGroupNo();
		groupwareHeaderSet(groupNo, model, auth);

		List<Reply> replyList = boardService.selectReplyListByPostNo(postNo);
		
		model.addAttribute("post", post);
		model.addAttribute("title", "# " + board.getBoardName());
		model.addAttribute("replyList", replyList);
		
		return "gw/board/anonymousDetail";
	
	}

	@PostMapping("/deletePostAnonymous.do")
	public String deletePostAnonymous(@RequestParam int postNo, int postPassword, RedirectAttributes redirectAttr) {
		    	
		Post post = boardService.selectOnePostInBoard(postNo);
		Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		
		if(post.getPostPassword() != postPassword){
		
			redirectAttr.addFlashAttribute("msg","??????????????? ???????????? ????????????.");
			return "redirect:/gw/board/anonymousDetail.do?postNo="+ postNo;
		}else{
			
			int result  = boardService.deletePostInBoard(postNo);
			log.debug("********** result = {} ", result);
			redirectAttr.addFlashAttribute("msg", result > 0 ? "???????????? ?????????????????????." : "??????");
			
			
			return "redirect:/gw/board/anonymous.do?boardNo=" + post.getBoardNo() + "&groupNo=" + board.getGroupNo();
		}
	}
		 
	

	@GetMapping("/deletePostBoard.do")
	public String deletePostBoard(@RequestParam int postNo, RedirectAttributes redirectAttr) {
		    	
		 Post post = boardService.selectOnePostInBoard(postNo);
		 Board board = boardService.selectBoardByBoardNo(post.getBoardNo());
		 Attachment attachment = mainService.selectOneAttach(post.getAttachNo());
		 
		 try {
			 	if(post != null && post.getAttachNo() != 0) {
			 		String saveDirectory = application.getRealPath("/resources/upFile/fileboard");
			 		String filename = attachment.getRenamedFilename();
			 		File delFile = new File(saveDirectory, filename);
			 		boolean delBool = delFile.delete();
			 		if(delBool == true) {
			 			boardService.deleteAttachInBoard(post.getAttachNo());
			 		}
			 	}
				
				int result  = boardService.deletePostInBoard(postNo);
				log.debug("********** result = {} ", result);
				redirectAttr.addFlashAttribute("msg", result > 0 ? "???????????? ?????????????????????." : "??????");

			} catch (Exception e) {
				log.error(e.getMessage(), e); // ??????
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
		int totalContent = boardService.selectPostInBoardTotalCount(boardNo);
		model.addAttribute("totalContent", totalContent);
		String url = request.getRequestURI();
		url += "?boardNo=" + boardNo + "&groupNo=" + groupNo;
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);

		List<Post> anonymousPostList = boardService.selectAllPostInBoard(boardNo, limit, offset);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		log.debug("anonymousPostList = {}", anonymousPostList);
		
		List<PostReplyCount> replyCount = boardService.selectReplyCount();
		model.addAttribute("replyCount", replyCount);
		log.debug("replyCount = {}", replyCount);
		
		model.addAttribute("anonymousPostList", anonymousPostList);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("title", "# " + board.getBoardName());

		return "gw/board/anonymous";
	}
	
	@GetMapping("/anonymousSearch.do")
	public String anonymousSearch(@RequestParam(defaultValue = "1") int cPage, int boardNo, int groupNo, Model model,
			HttpServletRequest request, Authentication auth) throws ParseException {
		groupwareHeaderSet(groupNo, model, auth);
		
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		
		Map<String, Object> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("searchKeyword", searchKeyword);
		param.put("boardNo", boardNo);
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = boardService.selectSearchBoardTotalCnt(param);
		log.debug("totalContent = {}",totalContent);
		String url = request.getRequestURI();
//		url += "?boardNo=" + boardNo + "&groupNo=" + groupNo;
		url += "?boardNo=" + boardNo + "&groupNo=" +groupNo + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword;
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		
		List<PostWithNickname> anonymousPostList = boardService.searchBoardList(param, limit, offset);
		log.debug("anonymousPostList = {}", anonymousPostList);
		model.addAttribute("anonymousPostList", anonymousPostList);
		
		Board board = boardService.selectBoardByBoardNo(boardNo);
		
		List<PostReplyCount> replyCount = boardService.selectReplyCount();
		model.addAttribute("replyCount", replyCount);
		log.debug("replyCount = {}", replyCount);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("pagebar", pagebar);
		model.addAttribute("title", "# " + board.getBoardName());
		
		return "gw/board/anonymous";
	}

	
	@PostMapping("/createBoardRoom.do")
	public String createBoardRoom(Board board, RedirectAttributes redirectAtt, HttpServletRequest request) {
		
		try {
			int result = boardService.createBoardRoom(board);
			String msg = result > 0 ? "????????? ["+board.getBoardName()+"]??? ?????????????????????." : "??????";
			redirectAtt.addFlashAttribute("msg", msg);
			//log.debug("*****************msg = {}", msg);
		} catch (Exception e) {
			log.error(e.getMessage(), e); // 
			redirectAtt.addFlashAttribute("msg", "??????");
		}

		return "redirect:/gw/gw.do?groupNo=" + board.getGroupNo();
	}
	
	
	@PostMapping("/updateBoardRoom.do")
	public String updateBoardRoom(@ModelAttribute Board board, RedirectAttributes redirectAtt, HttpSession session) {
		String location = "/";
		try {
			log.debug("board = {}", board);
			
			int result = boardService.updateBoardRoom(board);
			redirectAtt.addFlashAttribute("msg", result > 0 ? "???????????? ?????????????????????." : "??????");
			
			String redirect = (String) session.getAttribute("redirect");
			log.debug("redirect = {}", redirect);
			if(redirect != null) {
				location = redirect;
				session.removeAttribute("redirect");
			}
		} catch(Exception e) {
			log.error("????????? ?????? ??????!", e);
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
			redirectAtt.addFlashAttribute("msg", result > 0 ? "???????????? ?????????????????????." : "??????");
			
			String redirect = (String) session.getAttribute("redirect");
			log.debug("redirect = {}", redirect);
			if(redirect != null) {
				location = redirect;
				session.removeAttribute("redirect");
			}
		} catch(Exception e) {
			log.error("????????? ?????? ??????!", e);
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
		
		Map<String,Object> param = new HashMap<>();
        param.put("memberId", loginMember.getId());
        param.put("groupNo", groupNo);
	    String expend = "";
	    try {
	    	expend = gwService.selectMemberExpendCheck(loginMember.getId());
		} catch (Exception e) {
			
		}
 	    if(expend==null) {
			int result = gwService.insertDefaultExpendCheck(loginMember.getId());
			if(result > 0) {
				expend = gwService.selectMemberExpendCheck(loginMember.getId());
			}
	    }
	    model.addAttribute("expend", expend);
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
