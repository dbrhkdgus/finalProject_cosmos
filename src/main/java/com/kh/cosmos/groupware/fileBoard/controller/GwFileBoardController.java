package com.kh.cosmos.groupware.fileBoard.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
import com.kh.cosmos.groupware.board.model.vo.PostWithCategory;
import com.kh.cosmos.groupware.board.model.vo.PostWithNickname;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.fileBoard.model.service.FileBoardService;
import com.kh.cosmos.groupware.fileBoard.vo.FileEnroll;
import com.kh.cosmos.groupware.fileBoard.vo.IdNickName;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/fileBoard")
public class GwFileBoardController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	private GroupwareService gwService ;
	
	@Autowired
	private FileBoardService fileBoardService;

	@Autowired
	private AttachmentService attachmentService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	ResourceLoader resourceLoader;
	
//	@GetMapping("/fileBoard.do")
//    public String fileBoard(@RequestParam(defaultValue = "1") int cPage,Model model,
//    		@RequestParam int groupNo, HttpServletRequest request,
//    		@RequestParam int boardNo, Authentication authentication) {
//    	groupwareHeaderSet(groupNo, model, authentication);
////    	log.debug("cPage = {}", cPage);
////		log.debug("boardNo = {}", boardNo);
//		int limit = 10;
//		int offset = (cPage - 1) * limit;
//		int totalContent = fileBoardService.selectPostInFileBoardTotalCount(boardNo);
//		model.addAttribute("totalContent", totalContent);
//		String url = request.getRequestURI();
//		url += "?boardNo=" + boardNo + "&groupNo=" + groupNo;
//		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
//		model.addAttribute("pagebar", pagebar);
//		
//		
//		
//		List<IdNickName> idnicknameList = new ArrayList<IdNickName>();
//		idnicknameList = fileBoardService.selectIdNickName();
//		log.debug("idnicknameList = {}",idnicknameList);
//		model.addAttribute("idnicknameList",idnicknameList);
//		
//		
//		Map<String, Object> param = new HashMap<String, Object>();
//		
//		List<PostWithCategory> fileBoardList = new ArrayList<PostWithCategory>();
//		String searchType = request.getParameter("searchType");
//		String searchKeyword = request.getParameter("searchKeyword");
//		param.put("searchType", searchType);
//		param.put("searchKeyword", searchKeyword);
//				
//		fileBoardList = fileBoardService.selectAllFileBoardListByParam(param,limit,offset);		
//		model.addAttribute("fileBoardList",fileBoardList);
//		
//		boolean isListempty = false;
//		if(fileBoardList.isEmpty()) {
//			isListempty = true;
//		}
//		
//		log.debug("isListempty ={}" ,isListempty );
//		model.addAttribute("isListempty",isListempty);
//			
//		
//		model.addAttribute("groupNo", groupNo);
//        model.addAttribute("boardNo", boardNo);
//        model.addAttribute("title", "???????????????");
//        
//        
//        List<PostWithCategory> fileboardPostList = fileBoardService.selectAllPostInfileBoard(boardNo);
////		log.debug("boardPostList = {}", fileboardPostList);
//	        model.addAttribute("fileboardPostList", fileboardPostList);
//	        
//	        
//	    List<Attachment> attach = fileBoardService.selectAttachmentList();
////	    log.debug("attach = {}", attach);
//	        model.addAttribute("attach",attach);
//	    return "gw/fileBoard/fileBoard";
//	}
	
    @GetMapping("/fileBoard.do")
    public String fileBoard(@RequestParam(defaultValue = "1") int cPage,Model model,
    		@RequestParam int groupNo, HttpServletRequest request,
    		@RequestParam int boardNo, Authentication authentication) {
    	groupwareHeaderSet(groupNo, model, authentication);
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = fileBoardService.selectPostInFileBoardTotalCount(boardNo);
		String url = request.getRequestURI();
		url += "?boardNo=" + boardNo + "&groupNo=" + groupNo;
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		model.addAttribute("pagebar", pagebar);
		
		List<IdNickName> idnicknameList = new ArrayList<IdNickName>();
		idnicknameList = fileBoardService.selectIdNickName();
		log.debug("idnicknameList = {}",idnicknameList);
		model.addAttribute("idnicknameList",idnicknameList);
		
		List<PostWithCategory> fileBoardList = fileBoardService.selectAllPostInfileBoard(boardNo, limit, offset);
		model.addAttribute("fileBoardList",fileBoardList);
		Board board = boardService.selectBoardByBoardNo(boardNo);
		log.debug("board = {}",board);
		model.addAttribute("groupNo", groupNo);
        model.addAttribute("boardNo", boardNo);
        model.addAttribute("title", "# " + board.getBoardName());
	        
	    List<Attachment> attach = fileBoardService.selectAttachmentList();
//	    log.debug("attach = {}", attach);
	    model.addAttribute("attach",attach);
	    return "gw/fileBoard/fileBoard";
	}
    
    @GetMapping("/fileBoardSearch.do")
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
		int totalContent = fileBoardService.selectSearchFileBoardTotalCnt(param);
		log.debug("totalContent = {}",totalContent);
		String url = request.getRequestURI();
//		url += "?boardNo=" + boardNo + "&groupNo=" + groupNo;
		url += "?boardNo=" + boardNo + "&groupNo=" +groupNo + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword;
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);

		List<PostWithNickname> fileBoardList = fileBoardService.selectAllFileBoardListByParam(param,limit,offset);
		log.debug("fileBoardList = {}", fileBoardList);
		model.addAttribute("fileBoardList", fileBoardList);
		
		List<IdNickName> idnicknameList = new ArrayList<IdNickName>();
		idnicknameList = fileBoardService.selectIdNickName();
		log.debug("idnicknameList = {}",idnicknameList);
		model.addAttribute("idnicknameList",idnicknameList);
		
		Board board = boardService.selectBoardByBoardNo(boardNo);
		
		List<Attachment> attach = fileBoardService.selectAttachmentList();
//	    log.debug("attach = {}", attach);
	    model.addAttribute("attach",attach);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("idnicknameList", idnicknameList);
		model.addAttribute("pagebar", pagebar);
		model.addAttribute("title", "# " + board.getBoardName());

		return "gw/fileBoard/fileBoard";
	}
    
    @GetMapping("/fileEnroll.do")
    public void fileEnroll(@RequestParam int groupNo,@RequestParam int boardNo, Model model, Authentication authentication) {
    	groupwareHeaderSet(groupNo, model, authentication);
    	model.addAttribute("boardNo", boardNo);
    	model.addAttribute("groupNo", groupNo);
    	model.addAttribute("currGroupNo", groupNo);
    	
        
    }
    
    @PostMapping("/fileEnroll.do")
    public String fileEnroll(FileEnroll fileEnroll,@RequestParam int groupNo,@RequestParam int boardNo,
    		@RequestParam(value="upFile", required=false) MultipartFile upFile,RedirectAttributes redirectAttr,
    		Authentication authentication)throws IllegalStateException, IOException  {
    	
//   	log.debug("fileEnrolll ={}" ,fileEnroll );
//    	log.debug("boardNo ={}" ,boardNo );
    
    	
    	Member member = (Member)authentication.getPrincipal();
    	
    	Attachment attach = new Attachment();
    
    	try {
			String saveDirectory = application.getRealPath("/resources/upFile/fileboard");
			
			
		log.debug("saveDirectory = {}", saveDirectory);
//		log.debug("upFile.name = {}", upFile.getOriginalFilename());
//		log.debug("upFile.size = {}", upFile.getSize());
//		
			
		
			String originalFilename = upFile.getOriginalFilename();
			String renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);

			// 1.?????????????????? ??????
			File dest = new File(saveDirectory, renamedFilename);
//		log.debug("dest = {}", dest);
				upFile.transferTo(dest);
				// 2.DB??? attachment ????????? ??????
				
		
			attach.setRenamedFilename(renamedFilename);
			attach.setOriginalFilename(originalFilename);
			attach.setGroupNo(groupNo);
			attach.setMemberId(member.getId());
			 int attachNo = 0;
			 attachNo = fileBoardService.insertFileAttach(attach);
			
			 Post post= new Post();    	
			 
			 
			 post.setMemberId(member.getId());
			 post.setBoardNo(boardNo);
			 post.setPostTitle(fileEnroll.getFileTitle());
			 post.setBoardCategoryNo(fileEnroll.getFileCategoryNo());
//			 log.debug("post = {} " , post);
			 
			 Board board = new Board();
			 board.setBoardNo(boardNo);
			 board.setGroupNo(groupNo);
			 board.setBoardType('F');
			 
			 
			 int filePostResult = fileBoardService.insertFilePost(post);
		

			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
   	
        return "redirect:/gw/fileBoard/fileBoard.do?boardNo="+boardNo+"&groupNo="+groupNo;

    }

    
	@GetMapping(
			value = "/fileDown.do",
			produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
		)
		@ResponseBody
		public Resource fileDownload(@RequestParam int attachNo, HttpServletResponse response,Model model) throws UnsupportedEncodingException {
			// 1.???????????? : db attachment??? ??????
			Attachment attach = fileBoardService.selectOneAttachment(attachNo);
			log.debug("attach = {}", attach);
			
			// 2.??????????????? ?????? ?????? ????????????
			String saveDirectory = application.getRealPath("/resources/upFile/fileboard");
			File downFile = new File(saveDirectory, attach.getRenamedFilename());
			
			// 3.Resource?????? ??????
//			Resource resource = new FileSystemResource(downFile);
			Resource resource = resourceLoader.getResource("file:" + downFile);
			log.debug("file:{}", downFile);
			
			// 4.????????? ??????
			String filename = new String(attach.getOriginalFilename().getBytes("utf-8"), "iso-8859-1");
//			response.setContentType("application/octet-stream; charset=utf-8");
			response.addHeader("Content-Disposition", "attachment; filename=" + filename);
			
		
			
			return resource;
		}
    
    
	@GetMapping(
			value = "/resource.do",
			produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
		)
		@ResponseBody
		public Resource resource(HttpServletResponse response) {
			Resource resource = resourceLoader.getResource("https://docs.oracle.com/javase/8/docs/api/java/io/File.html");
			log.debug("resource = {}", resource);
			response.addHeader("Content-Disposition", "attachment; filename=File.html");
			return resource;
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
        List<Board> boardList = gwService.selectAllBoardRoomByGroupNo(groupNo);
        model.addAttribute("boardList", boardList);
        List<ChatRoom> chattingChannelList = gwService.selectAllChatRoomByGroupNo(groupNo);
        Map<String,Object> param = new HashMap<>();
    	param.put("memberId", loginMember.getId());
    	param.put("groupNo", groupNo);
    	
		/*
		 * ApplocationGroup applocationGroup = gwService.selectApplocationGroup(param);
		 * model.addAttribute("role", applocationGroup.getRole());
		 */
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
        model.addAttribute("myGroupList", myGroupList);
    }
    
    
    @GetMapping("/deletefilePost.do")
    public String deletefilePost(@RequestParam int postNo,@RequestParam int boardNo,@RequestParam int groupNo,
    		@RequestParam int attachNo,
    		RedirectAttributes redirectAttr) {
    	
    	String msg ="";
    	
    	try {
			int postDelete  = fileBoardService.deleteFilePost(postNo);
			int attachDelete  = fileBoardService.deleteOneAttach(attachNo);
			
			msg = postDelete + attachDelete > 1 ? "????????? ??????!" : "????????? ??????!";
		} catch (Exception e) {
			log.error(e.getMessage(), e); // ??????
		}
    	redirectAttr.addFlashAttribute("msg", msg);
    	
   	return  "redirect:/gw/fileBoard/fileBoard.do?boardNo="+boardNo+"&groupNo="+groupNo;
    }
}
