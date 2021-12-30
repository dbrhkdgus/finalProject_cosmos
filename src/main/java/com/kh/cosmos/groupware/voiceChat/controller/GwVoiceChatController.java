package com.kh.cosmos.groupware.voiceChat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.chat.model.service.ChatService;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.model.vo.Room;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/voiceChat")
public class GwVoiceChatController {
	
	@Autowired
	private ChatService chatService;
	@Autowired
	private GroupwareService gwService;
	
	@GetMapping("/zoomConnecting.do")
	public String zoomConnecting(@RequestParam(value="roomNo", defaultValue="0") int roomNo, @RequestParam(value="display_name", defaultValue="null") String display_name, Model model, Authentication auth) {
		if(display_name.equals("null")) {	
		Map<String,Object> param = new HashMap<>();
		log.debug("roomNo = {}",roomNo);
		param.put("roomNo", roomNo);
		Room roomInfo = gwService.selectRoomInfoByGroupNoAndRoomNo(param);
		log.debug("roomInfo = {}",roomInfo);
		model.addAttribute("roomInfo",roomInfo);

		return "gw/voiceChat/voiceChat";
		}else {
			
			return "/gw/voiceChat/meeting";
		}
	}
	@GetMapping("/meeting.do")
	public String zoomConnecting() {
		return "/gw/voiceChat/meeting";
	}
	@GetMapping("/close.do")
	public String close() {
		return "/gw/voiceChat/Close";
	}
	
	@GetMapping("/voiceChatEdit.do")
	public String voiceChatEdit(@RequestParam(value="groupNo", defaultValue="0") int groupNo, Model model, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		log.debug("groupNo = {}",groupNo);
		List<Room> roomList = gwService.selectAllZoomRoomList(groupNo);
		model.addAttribute(roomList);
		return "/gw/voiceChat/voiceChatEdit";
	}
	
	@PostMapping("/roomEnroll.do")
	public String voiceChatAdd(Room room, Model model, RedirectAttributes redirectAtt, Authentication auth) {
		log.debug("room = {}",room);
		int result = gwService.insertVoiceChatRoom(room);
		
		redirectAtt.addAttribute("groupNo", room.getGroupNo());
		return "redirect:/gw/gw.do";
	}
	
	@ResponseBody
	@GetMapping(value = "/deleteVoiceChatRoom.do", produces = "application/text; charset=utf8")
	public String deleteVoiceChatRoom(@RequestParam int roomNo, Model model, Authentication auth) {
		log.debug("groupNo = {}",roomNo);
		int result = gwService.deleteVoiceChatRoom(roomNo);
		String msg = result >= 0 ? "삭제 성공" : "삭제 실패";
		return msg;
	}
	
	@ResponseBody
	@GetMapping("/selectAllZoomRoomList.do")
	public Map<String,Room> selectAllRoomList(int groupNo) {
		Map<String,Room> map = new HashMap<>();
		log.debug("groupNo = {}",groupNo);
		List<Room> roomList = gwService.selectAllZoomRoomList(groupNo);
		log.debug("roomList = {}",roomList);
		int num = 0;
		for(Room room : roomList) {
			num++;
			map.put(Integer.toString(num), room);
		}
		
		return map;
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
    }
}
