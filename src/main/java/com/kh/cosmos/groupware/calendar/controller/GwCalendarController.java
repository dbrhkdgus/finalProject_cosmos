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
		Member loginMember = (Member) authentication.getPrincipal();
		model.addAttribute("groupNo", groupNo);
		
		
		Map<String, Object> param = new HashMap<>();
		param.put("groupNo", groupNo);
		param.put("memberId", loginMember.getId());
		
		Schedule schedule = gwCalendarService.selectColor(param);
		//DB를 불러올 때, 먼저 입력해 놓은 그룹일정의 색상/ 별개로 기본 개인일정 색상(회색) 세팅한다.
		if(schedule == null) {
			schedule = gwCalendarService.selectGroupColor(groupNo);
			schedule.setPrivateColor("#C4C4C4");
		}
		log.debug("여기는calendar.do schedule = {}", schedule);
		model.addAttribute("schedule", schedule);
		

		return "gw/calendar/calendar";
	}
	
	@GetMapping("/selectList.do")
	@ResponseBody
	public Map<String, Object>list(int groupNo, Authentication authentication, Model model) {
		groupwareHeaderSet(groupNo, model, authentication);		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", gwCalendarService.selectScheduleList(groupNo));
		return map;
	}

	@GetMapping("/insertSchedule.do")
	public String insertSchedule(int groupNo, Authentication authentication, @RequestParam Map<String, Object> obj, Model model, RedirectAttributes redirectAttr){
		groupwareHeaderSet(groupNo, model, authentication);		
		
		//개인이 설정한 스케줄 색상값이 없다면 기본값이 설정된다.
		if(obj.get("privateColor")==null || obj.get("privateColor")=="") {
			obj.put("privateColor", "#C4C4C4");
		}
		if(obj.get("groupColor")==null || obj.get("groupColor")=="") {
			//그룹 색상을 따로 먼저 선택하지 않았다면, 기존의 그룹 색깔을 유지한다.
			Schedule schedule = gwCalendarService.selectGroupColor(groupNo);
			if(schedule == null) {
				System.out.println("기본색상이 지정되어 있지 않아, 기본값으로 입력됩니다.");
				obj.put("groupColor", "#75b7ff");
			}
			
		}

		
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
		
		redirectAttr.addFlashAttribute("msg", msg);
		
		return  "redirect:/gw/calendar/calendar.do?groupNo="+groupNo;
	}
	
	@GetMapping("/deleteSchedule")
	public String deleteSchedule(@RequestParam Map<String, String> param, int groupNo, Model model, Authentication authentication, RedirectAttributes redirectAttr) {
		
		log.debug("param = {}", param);
		int result = gwCalendarService.deleteSchedule(param);
		log.debug("result = {}", result);
		String msg = result > 0 ? "일정이 삭제되었습니다." : "일정 삭제에 실패하였습니다.";
		redirectAttr.addFlashAttribute("msg", msg);
		log.debug("msg = {}", msg);
		
		log.debug("param = " + param);
		return  "redirect:/gw/calendar/calendar.do?groupNo="+groupNo;
	}
	
	@GetMapping("/changeColor")
	public String changeColor(@RequestParam Map<String,String> param, int groupNo, Model model, Authentication authentication, RedirectAttributes redirectAttr) {

		log.debug("여긴느 changeColor입니다. param = {}", param);
		int result1 = gwCalendarService.changePrivateColor(param);
		int result2 = gwCalendarService.changeGroupColor(param);
		log.debug("result1 = {}", result1);
		log.debug("result2 = {}", result2);

		return "redirect:/gw/calendar/calendar.do?groupNo="+groupNo;
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
