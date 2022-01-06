package com.kh.cosmos.groupware.chat.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.chat.model.service.ChatService;
import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.chat.model.vo.ChatUser;
import com.kh.cosmos.groupware.chat.model.vo.DM;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.main.model.service.MainService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/chat")
public class GwChatController {
	@Autowired
	private ChatService chatService;
	@Autowired
	private GroupwareService gwService;
	@Autowired
	ServletContext application;
	@Autowired
	private MainService mainService;
	
	@GetMapping("/chatRoom.do")
	public String chatRoom(int groupNo, int chatRoomNo, Model model, Authentication auth, RedirectAttributes redirectAtt) {
		// 채팅방 참여 인원만 입장가능
		// 채팅방이 전체 채팅방인 경우(chatRoomOpenType == all), 채팅방에 입장한 사람들은 
		// 기존 chat_user 테이블에 인서트
		// 채팅방이 전체 채팅방이 아닌 경우는 리턴처리.
		Member loginMember = (Member) auth.getPrincipal(); 
		ChatRoom chatRoom = chatService.selectChatRoomByChatRoomNo(chatRoomNo);
		List<ChatUser> chatUserList = chatService.selectChatUserList(chatRoomNo);
		List<String> chatUserIdList = chatService.selectChatUserIdList(chatRoomNo);
		int chatAdminNo = (int)chatUserList.get(0).getChatAdminNo();
		
		if(!chatRoom.getChatRoomOpenType().equals("all")) {
				
			if(!chatUserIdList.contains(loginMember.getId())){
				redirectAtt.addAttribute("msg", "채팅방 입장 권한이 없습니다.");
				return "redirect:/gw/gw.do?groupNo="+groupNo;
				
			}
			// 채팅방이 전체 채팅방인 경우, 입장 인원에 대해 chatUser테이블에 인서트
		}else if(chatRoom.getChatRoomOpenType().equals("all")) { 
			if(!chatUserIdList.contains(loginMember.getId())){
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("chatAdminNo", chatAdminNo);
				param.put("chatRoomNo", chatRoomNo);
				param.put("memberId", loginMember.getId());
				
				int result = chatService.insertChatUserByParamWithAdminNo(param);
				
			}
		}
		
		
		groupwareHeaderSet(groupNo, model, auth);
		
		List<ChatMessage> messageList = chatService.selectAllMessageFromChatRoomNo(chatRoomNo);
//		for(ChatMessage chat : messageList) {
//			log.debug("type = {}",chat.getChatMessageTypeNo());
//		}
		model.addAttribute("chatUserList",chatUserList);
		model.addAttribute("messageList",messageList);
		model.addAttribute("title", "#"+chatRoom.getChatRoomName());
		model.addAttribute("chatRoomNo",chatRoomNo);
		
		return "gw/chat/chatRoom";
	}
	
	@GetMapping("/dm.do")
	public void dm() {}
	
	@PostMapping("/createChatRoom.do")
	public String createChatRoom(ChatRoom chatRoom, String chatRoomOpenType,int groupNo,HttpServletRequest request, RedirectAttributes redirectAtt, Authentication auth) {
		log.debug("chatRoom = {}", chatRoom);
		log.debug("chatRoomOpenType = {}", chatRoomOpenType);
		
		Member loginMember = (Member) auth.getPrincipal(); 
		List<Member> myGroupMemberList = gwService.selectAllGroupMembers(groupNo);
		

		
		//채팅방 개설
		int result = chatService.createChatRoom(chatRoom);
		
		//관리자 설정 (채팅방 개설자와 그룹장이 최초 채팅방 관리 권한을 가짐.)
		String groupMasterId = chatService.selectGroupMasterId(groupNo);
		String adminIds = groupMasterId;
		if(!groupMasterId.equals(loginMember.getId())) {
			adminIds += ", " + loginMember.getId();
		}
		
		Map<String, Object> param1 = new HashMap<String, Object>();
		param1.put("chatRoomNo", chatRoom.getChatRoomNo());
		param1.put("memberId", adminIds);
		result = chatService.insertChatAdminByParam(param1);
		
		
		// 전체채팅방 개설의 경우, 그룹원 모두를 채팅방의 참여자로 설정한다.
		if(chatRoomOpenType.equals("all")) {
			for(Member m : myGroupMemberList) {
				Map<String, Object> param = new HashMap<>();
				param.put("chatRoomNo", chatRoom.getChatRoomNo());
				param.put("memberId", m.getId());
				
				result = chatService.insertChatUserByParam(param);
							
							
			}
		// 전체채팅방이 아닌 경우, 선택된 그룹원만 채팅방의 참여자로 설정한다.
		}else {
			String[] selectedMemberId = request.getParameterValues("memberId");
			List<String> selectedMemberIdList = Arrays.asList(selectedMemberId);
			
			for(String id : selectedMemberIdList) {
				Map<String, Object> param = new HashMap<>();
				param.put("chatRoomNo", chatRoom.getChatRoomNo());
				param.put("memberId",id);
								
				result = chatService.insertChatUserByParam(param);
			}
		}

		
		redirectAtt.addAttribute("groupNo", chatRoom.getGroupNo());
		return "redirect:/gw/gw.do";
	}
	@ResponseBody
	@GetMapping("/selectMember.do")
	public List<Map<String,String>> selectMember(int groupNo){
		log.debug("groupNo = {}", groupNo);
		List<Map<String,String>> resultList = new ArrayList<>();
		
		List<Member> memberList = gwService.selectAllGroupMembers(groupNo);
		for(Member m : memberList) {
			Map<String, String> map = new HashMap<>();
			String profileRenamedFilename = gwService.selectMemberProfileRenamedFilename(m.getId());
			map.put("profileRenamedFilename", profileRenamedFilename);
			map.put("nickname", m.getNickname());
			map.put("memberId", m.getId());
			resultList.add(map);
		}
		
		
		return resultList;
	}
	
	@ResponseBody
	@GetMapping("/selectMemberExceptSelected.do")
	public List<Map<String,String>> selectMemberExceptSelected(int groupNo, int chatRoomNo){
		log.debug("groupNo = {}", groupNo);
		log.debug("chtRoomNo = {}", chatRoomNo);
		
		List<Map<String,String>> resultList = new ArrayList<>();
		List<Member> selectedMemberList = chatService.selectAllChatUsers(chatRoomNo);
		List<String> selectedMemberIdList = new ArrayList<String>();
		for(Member m : selectedMemberList) {
			selectedMemberIdList.add(m.getId());
		}
		
		List<Member> memberList = gwService.selectAllGroupMembers(groupNo);
		for(Member m : memberList) {
			if(!selectedMemberIdList.contains(m.getId())) {
				
				Map<String, String> map = new HashMap<>();
				String profileRenamedFilename = gwService.selectMemberProfileRenamedFilename(m.getId());
				map.put("profileRenamedFilename", profileRenamedFilename);
				map.put("nickname", m.getNickname());
				map.put("memberId", m.getId());
				resultList.add(map);
			}
		}
		
		
		return resultList;
	}
	@ResponseBody
	@GetMapping("/selectChatUser.do")
	public List<Map<String,String>> selectChatUser(int chatRoomNo){
		log.debug("chatRoomNo = {}", chatRoomNo);
		List<Map<String,String>> resultList = new ArrayList<>();
		String chatRoomOpenType = chatService.selectChatRoomNoByChatRoomNo(chatRoomNo);
		Map<String, String> map = new HashMap<String, String>();
		map.put("chatRoomOpenType", chatRoomOpenType);
		resultList.add(map);
		
		List<Member> memberList = chatService.selectAllChatUsers(chatRoomNo);
		for(Member m : memberList) {
			Map<String, String> map2 = new HashMap<>();
			String profileRenamedFilename = gwService.selectMemberProfileRenamedFilename(m.getId());
			map2.put("profileRenamedFilename", profileRenamedFilename);
			map2.put("nickname", m.getNickname());
			map2.put("memberId", m.getId());
			resultList.add(map2);
		}
		
		return resultList;
	}
	@ResponseBody
	@GetMapping("/loadDM.do")
	public List<DM> loadDM(String sender, String receiver){
		log.debug("sender = {}", sender);
		log.debug("receiver = {}", receiver);
	
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("sender", sender);
		param.put("receiver", receiver);
		List<DM> dmList = chatService.selectDMListByParam(param);
		
		
		return dmList;
		
	}
	@ResponseBody
	@GetMapping("/indexDMList.do")
	public List<DM> indexDMList(Authentication auth){
		String receiver = ((Member) auth.getPrincipal()).getId();
		List<String> mySenderList = chatService.selectMySenderList(receiver);
		List<DM> dmList = new ArrayList<DM>();
		for(String sender : mySenderList) {
			Map<String, String> param = new HashMap<String, String>();
			param.put("receiver", receiver);
			param.put("sender", sender);
			
			dmList.add(chatService.selectMynewDM(param));
		}
		
		return dmList;
		
	}
	
	@ResponseBody
	@GetMapping("/indexDM.do")
	public List<DM> indexDM(String sender, Authentication auth){
		Member loginMember = (Member) auth.getPrincipal();
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("sender", sender);
		param.put("receiver", loginMember.getId());
		List<DM> dmList = chatService.selectDMListByParam(param);
		
		return dmList;
	}
	@GetMapping("/DMPopup.do")
	public void DMPopup(String sender, Authentication auth, Model model) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("sender", sender);
		param.put("receiver", ((Member)auth.getPrincipal()).getId());
		
		List<DM> messageList = chatService.selectDMListByParam(param);
		model.addAttribute("messageList", messageList);
		model.addAttribute("sender", sender);
		
	}
	@GetMapping("/DMPopup2.do")
	public String DMPopup2(String sender, Authentication auth, Model model) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("sender", ((Member)auth.getPrincipal()).getId());
		param.put("receiver", sender);
		
		List<DM> messageList = chatService.selectDMListByParam(param);
		model.addAttribute("messageList", messageList);
		model.addAttribute("sender", sender);
		
		return "gw/chat/DMPopup";
	}
	@ResponseBody
	@GetMapping("/newDMCheck.do")
	public int newDMCheck(Authentication auth) {
		int result = 0;
		Member loginMember = (Member) auth.getPrincipal();
		result = chatService.newDMCheck(loginMember.getId());
		return result;
	}
	
	@ResponseBody
	@PostMapping("/uploadImg.do")
	public String uploadImg(@RequestParam(value="file", required=false) MultipartFile file, Authentication auth) {
		log.debug("file = {}", file);
		String memberId = ((Member) auth.getPrincipal()).getId();
		String saveDirectory = application.getRealPath("/resources/upFile/chatRoom");
		String attachmentRenameFilename = "";
		if(!file.isEmpty() && file.getSize() != 0) {
			 log.debug("upFile = {}", file);
			 log.debug("upFile.name = {}",file.getOriginalFilename());
			 log.debug("upFile.size = {}",file.getSize());
		 
			 String originalFilename = file.getOriginalFilename();
			 String renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);
			 
			 // 1.서버컴퓨터에 저장
			 File dest = new File(saveDirectory, renamedFilename);
			 log.debug("dest = {}", dest);
			 try {
				file.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			 // 2.DB에 attachment 레코드 등록 
			 Attachment attach = new Attachment();
			 attach.setRenamedFilename(renamedFilename);
			 attach.setOriginalFilename(originalFilename);
			 attach.setMemberId(memberId);
			 
			 log.debug("attach = {}",attach);
			 int attachNo = mainService.insertAttach(attach);
			 attachmentRenameFilename = attach.getRenamedFilename();
		 }
		 
		return attachmentRenameFilename;
	}
	
	@ResponseBody
	@GetMapping("/deleteChatRoom.do")
	public int deleteChatRoom(int chatRoomNo) {
		
		int result = chatService.deleteChatRoom(chatRoomNo);
		
		
		
		return result;
	}
	@ResponseBody
	@GetMapping("/deleteChatMessage.do")
	public int deleteChatMessage(int chatMessageNo) {
		int result = chatService.deleteChatMessage(chatMessageNo);
		
		return result;
	}
	@ResponseBody
	@GetMapping("/deleteDmMessage.do")
	public int deleteDmMessage(int dmMessageNo) {

		int result = chatService.deleteDmMessage(dmMessageNo);
		
		return result;
	}
	@ResponseBody
	@PostMapping("/updateChatRoom.do")
	public int updateChatRoom(ChatRoom chatRoom,HttpServletRequest request) {
		
		
		int result = chatService.updateChatRoom(chatRoom);
		
		String[] memberIds = null;
		try {
			memberIds = request.getParameterValues("memberId");
		} catch (Exception e) {

		}
		int chatAdminNo = chatService.selectChatAdminNoBychatRoomNo(chatRoom.getChatRoomNo());
		if(memberIds != null) {
			List<String> selectedMemberIdList = Arrays.asList(memberIds);			
			for(String id : selectedMemberIdList) {
				Map<String, Object> param = new HashMap<>();
				param.put("chatRoomNo", chatRoom.getChatRoomNo());
				param.put("memberId",id);
				param.put("chatAdminNo", chatAdminNo);
								
				result = chatService.insertChatUserByParamWithAdminNo(param);
			}
		}
		
		
		return result;
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
		List<Board> boardList = gwService.selectAllBoardRoomByGroupNo(groupNo);
		model.addAttribute("boardList", boardList);
		model.addAttribute("currGroupNo", groupNo);
		model.addAttribute("myGroup", myGroup);
		model.addAttribute("myGroupMemberList", myGroupMemberList);
		model.addAttribute("chattingChannelList", chattingChannelList);
		model.addAttribute("profile", gwService.selectMemberProfileRenamedFilename(loginMember.getId()));
		model.addAttribute("memberProfileRenamedFilenameList", memberProfileRenamedFilenameList);
		model.addAttribute("groupBannerAttachList", groupBannerAttachList);
		model.addAttribute("myGroupList", myGroupList);
		
		 Map<String,Object> param = new HashMap<>();
	     param.put("memberId", loginMember.getId());
	     param.put("groupNo", groupNo);
	     ApplocationGroup applocationGroup = gwService.selectApplocationGroup(param);
	        
	        
	     model.addAttribute("role", applocationGroup.getRole());
	}
}
