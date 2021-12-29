package com.kh.cosmos.groupware.fileBoard.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
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
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostWithCategory;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.fileBoard.model.service.FileBoardService;
import com.kh.cosmos.groupware.fileBoard.vo.FileEnroll;
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
	ResourceLoader resourceLoader;
	

	
    @GetMapping("/fileBoard.do")
    public String fileBoard(@RequestParam(defaultValue = "1") int cPage,Model model,@RequestParam int groupNo,@RequestParam int boardNo,Authentication authentication) {
    	groupwareHeaderSet(groupNo, model, authentication);
//    	log.debug("cPage = {}", cPage);
//		log.debug("boardNo = {}", boardNo);
		int limit = 10;
		int offset = (cPage - 1) * limit;
    	model.addAttribute("groupNo", groupNo);
        model.addAttribute("boardNo", boardNo);
        model.addAttribute("title", "파일게시판");
        
        List<PostWithCategory> fileboardPostList = fileBoardService.selectAllPostInfileBoard(boardNo);
//		log.debug("boardPostList = {}", fileboardPostList);
	        model.addAttribute("fileboardPostList", fileboardPostList);
	        
	        
	    List<Attachment> attach = fileBoardService.selectAttachmentList();
	    log.debug("attach = {}", attach);
	        model.addAttribute("attach",attach);
	        return "gw/fileBoard/fileBoard";
	    }
    
    @GetMapping("/fileEnroll.do")
    public void fileEnroll(@RequestParam int groupNo,@RequestParam int boardNo, Model model ) {
    	
    	model.addAttribute("boardNo", boardNo);
    	model.addAttribute("groupNo", groupNo);

        
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

			// 1.서버컴퓨터에 저장
			File dest = new File(saveDirectory, renamedFilename);
//		log.debug("dest = {}", dest);
				upFile.transferTo(dest);
				// 2.DB에 attachment 레코드 등록
				
		
			attach.setRenamedFilename(renamedFilename);
			attach.setOriginalFilename(originalFilename);
			attach.setGroupNo(groupNo);
			attach.setMemberId(member.getId());
			
//			int result = gwFileService.insertGroup(fileEnroll);
			
			log.debug("attach ={} ",attach);
			int attachNo =0;
			 attachNo = fileBoardService.insertFileAttach(attach);
			
			 Post post= new Post();    	
			 
			 
			 post.setMemberId(member.getId());
			 post.setBoardNo(boardNo);
			 post.setPostTitle(fileEnroll.getFileTitle());
			 post.setBoardCategoryNo(fileEnroll.getFileCategoryNo());
			 log.debug("post = {} " , post);
			 
			 Board board = new Board();
			 board.setBoardNo(boardNo);
			 board.setGroupNo(groupNo);
			 board.setBoardType('F');
			 
			 
			 
			 int filePostResult = fileBoardService.insertFilePost(post);
			 
			 log.debug("filePostResult = {} " , filePostResult);
			 
			 
			
			

			
//			log.debug("attachNo ={} ",attachNo);
			
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
			// 1.업무로직 : db attachment행 조회
			Attachment attach = fileBoardService.selectOneAttachment(attachNo);
			log.debug("attach = {}", attach);
			
			// 2.다운로드할 파일 경로 가져오기
			String saveDirectory = application.getRealPath("/resources/upFile/fileboard");
			File downFile = new File(saveDirectory, attach.getRenamedFilename());
			
			// 3.Resource객체 생성
//			Resource resource = new FileSystemResource(downFile);
			Resource resource = resourceLoader.getResource("file:" + downFile);
			log.debug("file:{}", downFile);
			
			// 4.헤더값 설정
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
    
    
    @GetMapping("/deletefilePost.do")
    public String deletefilePost(@RequestParam int postNo,@RequestParam int boardNo,@RequestParam int groupNo,
    		@RequestParam int attachNo,
    		RedirectAttributes redirectAttr) {
    	
    	String msg ="";
    	
    	try {
			int postDelete  = fileBoardService.deleteFilePost(postNo);
			int attachDelete  = fileBoardService.deleteOneAttach(attachNo);
			
			msg = postDelete + attachDelete > 1 ? "글삭제 성공!" : "글삭제 실패!";
		} catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅
		}
    	redirectAttr.addFlashAttribute("msg", msg);
    	
   	return  "redirect:/gw/fileBoard/fileBoard.do?boardNo="+boardNo+"&groupNo="+groupNo;
    }
}
