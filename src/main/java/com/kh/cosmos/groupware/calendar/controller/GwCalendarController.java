package com.kh.cosmos.groupware.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.kh.cosmos.groupware.calendar.model.service.GwCalendarService;
import com.kh.cosmos.groupware.calendar.model.vo.Schedule;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/calendar")
public class GwCalendarController {
	
	@Autowired
	private GroupwareService gwService; 
	
	@Autowired
	private GwCalendarService gwCalendarService;
	
	

		
	@GetMapping("/calendar.do")
	public String calendar(int groupNo, Model model, Authentication authentication){
		groupwareHeaderSet(groupNo, model, authentication);
		log.debug("groupNOOOOOOOOOOOOOOOOOOOOO = {}", groupNo);
		model.addAttribute("groupNo", groupNo);

		return "gw/calendar/calendar";
	}
	
	@GetMapping("/selectList.do")
	@ResponseBody
	public Map<String, Object>list(int groupNo, Authentication authentication, Model model) {
		groupwareHeaderSet(groupNo, model, authentication);		
		System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", gwCalendarService.selectScheduleList(groupNo));
		return map;
	}

	@GetMapping("/insertSchedule.do")
	public String insertSchedule(int groupNo, Authentication authentication, @RequestParam Map<String, Object> obj, Model model, RedirectAttributes redirectAttr){
		groupwareHeaderSet(groupNo, model, authentication);		

		
		log.debug("obj = {}", obj);
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		//날짜와 시간을 합쳐준다.
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
		
		String _start_date = obj.get("start_date")+"";
		String _start_time = obj.get("start_time")+"";

		String _end_date = obj.get("end_date")+"";
		String _end_time = obj.get("end_time")+"";
		
		String start_date = _start_date +" "+_start_time+":00";
		String end_date = _end_date + " " + _end_time+":00";
		//합쳐진 값을 새롭게 obj에 넣어준다.
		obj.put("start_date", start_date);
		obj.put("end_date", end_date);
		
		//allDay가 빈값일 때는 여기서 F값을 넣어준다.
		if(obj.get("allDay")== null) {
			obj.put("allDay", "F");
		}

		//업무로직
		int result = gwCalendarService.insertSchedule(obj);
		log.debug("result = {}", result);
		String msg = result > 0? "일정이 추가되었습니다." : "일정 추가에 실패하였습니다.";
		model.addAttribute("msg", msg);
		
		redirectAttr.addAttribute("msg", msg);
		
		return  "redirect:/gw/calendar/calendar.do?groupNo="+groupNo;
	}
	
	@GetMapping("/deleteSchedule")
	public String deleteSchedule(@RequestParam Map<String, String> param, int groupNo, Model model, Authentication authentication, RedirectAttributes redirectAttr) {
		
		int result = gwCalendarService.deleteSchedule(param);
		log.debug("result = {}", result);
		String msg = result > 0 ? "일정이 삭제되었습니다." : "일정 삭제에 실패하였습니다.";
		redirectAttr.addAttribute("msg", msg);
		log.debug("msg = {}", msg);
		
		log.debug("param = " + param);
		return  "redirect:/gw/calendar/calendar.do?groupNo="+groupNo;
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
