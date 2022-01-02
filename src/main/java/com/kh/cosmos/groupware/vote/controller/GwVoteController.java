package com.kh.cosmos.groupware.vote.controller;

import java.beans.PropertyEditor;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.groupware.vote.model.service.VoteService;
import com.kh.cosmos.groupware.vote.model.vo.Vote;
import com.kh.cosmos.groupware.vote.model.vo.VoteInfo;
import com.kh.cosmos.groupware.vote.model.vo.VoteOption;
import com.kh.cosmos.groupware.vote.model.vo.VoteQuestion;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/vote")
public class GwVoteController {

	@Autowired
	private VoteService voteService;
	@Autowired
	private GroupwareService gwService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 형식객체, 빈값허용여부("" -> null)
		PropertyEditor editor = new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, editor);
	}
	
	
	@GetMapping("/vote.do")
	public void vote(int groupNo, Model model, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		model.addAttribute("title", "투표");
		int voteNo = voteService.selectGroupNewVoteNOByGroupNo(groupNo);
		List<VoteInfo> presentVoteInfo = voteService.selectVoteInfoByVoteNo(voteNo);
		List<VoteOption> presentVoteOption = voteService.selectVoteOptionByVoteNo(voteNo);
		
		List<VoteInfo> groupVoteInfoList = voteService.selectVoteInfoByGroupNo(groupNo);
		
		model.addAttribute("presentVoteInfo",presentVoteInfo);
		model.addAttribute("presentVoteOption",presentVoteOption);
		model.addAttribute("groupVoteInfoList",groupVoteInfoList);
	}
	
	
	@PostMapping("/createVote.do")
	public String createVote(int groupNo, Vote vote, VoteQuestion voteQuestion, String voteQuestionOption, Authentication auth) {
		log.debug("vote = {}", vote);
		vote.setMemberId(((Member)auth.getPrincipal()).getId());
		// vote 인서트
		int result = voteService.insertVote(vote);
		
		// voteQuestion 인서트
		voteQuestion.setVoteNo(vote.getVoteNo());
		if(voteQuestion.getVoteQuestionType()==null) {
			voteQuestion.setVoteQuestionType("radio");
		}
		
		result = voteService.insertVoteQuestion(voteQuestion);
		
		//voteOption 인서트
		  String[] questionOptionArr = voteQuestionOption.split(","); List<String>
		  questionOptionList = Arrays.asList(questionOptionArr); 
		  for(String option :questionOptionList) {
			  VoteOption voteOption = new VoteOption();
			  voteOption.setVoteNo(vote.getVoteNo());
			  voteOption.setVoteQuestionNo(1);
			  voteOption.setVoteOption(option);
			  result = voteService.insertVoteOption(voteOption);
		  
		  }
		 
		
		
		return "redirect:/gw/vote/vote.do?groupNo="+groupNo;
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
