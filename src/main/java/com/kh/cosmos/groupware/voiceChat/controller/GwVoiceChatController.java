package com.kh.cosmos.groupware.voiceChat.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
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
	public String zoomConnecting() {
		
		return "gw/voiceChat/voiceChat";
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
