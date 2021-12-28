package com.kh.cosmos.groupware.fileBoard.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.attachment.model.service.AttachmentService;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
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
    public void fileBoard(Model model,@RequestParam int groupNo,@RequestParam int boardNo) {
    	model.addAttribute("groupNo", groupNo);
        model.addAttribute("boardNo", boardNo);
    }
    
    @GetMapping("/fileEnroll.do")
    public void fileEnroll(@RequestParam int groupNo,@RequestParam int boardNo, Model model) {
    	model.addAttribute("boardNo", boardNo);
    	model.addAttribute("groupNo", groupNo);
        
    }
    
    @PostMapping("/fileEnroll.do")
    public String fileEnroll(FileEnroll fileEnroll,@RequestParam int groupNo,@RequestParam int boardNo,
    		@RequestParam(value="upFile", required=false) MultipartFile upFile,
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
			
			log.debug("attachNo ={} ",attachNo);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
			
    	
        return "redirect:/gw/fileBoard/fileBoard.do?boardNo="+boardNo+"&groupNo="+groupNo;
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
