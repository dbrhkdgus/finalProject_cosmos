package com.kh.cosmos.member.controller;

import java.beans.PropertyEditor;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.attachment.model.service.AttachmentService;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.service.GroupService;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.CategoryOne;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.MemberInterestGroup;
import com.kh.cosmos.member.model.service.MemberService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes({ "loginMember" }) // session??? ????????? model data ??????

public class MemberController {

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// ????????????, ??????????????????("" -> null)
		PropertyEditor editor = new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, editor);
	}

	@Autowired
	private MemberService memberService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private AttachmentService attachService;
	@Autowired
	ServletContext application;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@GetMapping("/memberLogin.do")
	public void memberLogin() {}

	@PostMapping("/memberLogin.do")
	public void memberLoginPost() {}

	@GetMapping("/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		if (!sessionStatus.isComplete())
			sessionStatus.setComplete();
		return "redirect:/";
	}

	@GetMapping("/memberEnroll.do")
	public String memberEnroll() {

		return "member/memberEnroll";
	}

	@PostMapping("/memberEnroll.do")
	public String memberEnroll(Member member, RedirectAttributes redirectAttr,
			@RequestParam(value = "upFile", required = false) MultipartFile upFile, HttpServletRequest request)
			throws Exception {
		log.debug("member = {}", member);
		String email = (request.getParameter("emailId")) + "@" + (request.getParameter("email-server"));
		member.setMemberEmail(email);

		log.debug("profile_img = {}", request.getParameter("profile_img"));
		String profileImg = request.getParameter("profile_img");
		
		try {
			// 0.???????????? ????????? ??????
			log.info("{}", passwordEncoder);
			String rawPassword = member.getPassword();
			String encryptedPassword = passwordEncoder.encode(rawPassword);
			member.setPassword(encryptedPassword);
			log.info("{} -> {}", rawPassword, encryptedPassword);

			// 1.????????????
			int result = memberService.insertMember(member);
			result = memberService.insertUserAuthority(member.getId());

			Attachment attach = new Attachment();
			if (profileImg != null) {

				attach.setRenamedFilename(profileImg);
				attach.setOriginalFilename(profileImg);
				attach.setMemberId(member.getId());
			}

			else if (!upFile.isEmpty() && upFile.getSize() != 0) {
				log.debug("upFile = {}", upFile);
				log.debug("upFile.name = {}", upFile.getOriginalFilename());
				log.debug("upFile.size = {}", upFile.getSize());

				String originalFilename = upFile.getOriginalFilename();
				String renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);

				// 1.?????????????????? ??????
				String saveDirectory = application.getRealPath("/resources/upFile/profile");
				File dest = new File(saveDirectory, renamedFilename);
				log.debug("dest = {}", dest);
				upFile.transferTo(dest);

				// 2.DB??? attachment ????????? ??????

				attach.setRenamedFilename(renamedFilename);
				attach.setOriginalFilename(originalFilename);
				attach.setMemberId(member.getId());

			}else {
				attach.setRenamedFilename("defaultProfile.png");
				attach.setOriginalFilename("defaultProfile.png");
				attach.setMemberId(member.getId());
			}
			result = memberService.insertAttach(attach);
			// 2.??????????????? & ????????????????????????
			redirectAttr.addFlashAttribute("msg", "???????????? ??????!");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return "redirect:/";
	}

	@GetMapping("/memberAPIEnroll.do")
	public String memberAPIEnroll() {
		return "member/memberAPIEnroll";
	}

	@PostMapping("/memberLoginKakaoMoreInfo.do")
	public String memberLoginKakao(HttpServletRequest request, Model model, HttpSession session, Authentication auth,
			RedirectAttributes redirectAttr) {

		Member kakaoMember = memberService.selectOneMember("a" + request.getParameter("kakaoId"));
		log.debug("kakaoMember = {}", kakaoMember);
		if (kakaoMember == null) {
			kakaoMember = new Member();
			kakaoMember.setId(request.getParameter("kakaoId"));
			kakaoMember.setMemberName(request.getParameter("memberName"));
			kakaoMember.setMemberGender(request.getParameter("gender"));

			model.addAttribute("kakaoMember", kakaoMember);
			model.addAttribute("_birthDay", request.getParameter("_birthDay"));
			model.addAttribute("profile_img", request.getParameter("profile_img"));

			// log.debug("loginMember = {}",kakaoMember);

			return "member/memberLoginKakaoMoreInfo";
		} else {
			// ????????? ???????????? ????????? ???????????????
			kakaoMember.setPassword("1234");

			if ("http://localhost:9090/cosmos/member/memberAPIEnroll.do".equals(request.getHeader("referer"))) {
				redirectAttr.addFlashAttribute("msg", "?????? ????????? ????????? ??????????????????.");
			}
			List<SimpleGrantedAuthority> authority = new ArrayList<SimpleGrantedAuthority>();
			List<String> memberAuthorityList = memberService.selectMemberAuthority(kakaoMember.getId());
			for(String auth2 : memberAuthorityList) {
				SimpleGrantedAuthority auth3 = new SimpleGrantedAuthority(auth2);
				authority.add(auth3);
			}
			
			kakaoMember.setAuthorities(authority);
			kakaoMember.setPassword(passwordEncoder.encode(kakaoMember.getPassword()));
			Authentication kakaoAuthentication = new UsernamePasswordAuthenticationToken(kakaoMember,
					kakaoMember.getPassword(), kakaoMember.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(kakaoAuthentication);
			
			return "redirect:/";
		}
	}

	@GetMapping("/memberGroupList.do")
	public String memberGroupList(Model model, Authentication auth, RedirectAttributes redirectAttr,
			HttpServletRequest request) {

		Member member = (Member) auth.getPrincipal();
		String userId = member.getId();
		String type = request.getParameter("type");

		model.addAttribute("type", type);

		List<ApplocationGroup> myGroupList = memberService.selectMyGroupList(userId);
		model.addAttribute("myGroupList", myGroupList);
		
		List<ApplocationGroup> myNotJoinedGroupList = memberService.selectmyNotJoinedGroupList(userId);
		model.addAttribute("myNotJoinedGroupList", myNotJoinedGroupList);
		
		List<ApplocationGroup> myNotAllowedGroupList = memberService.selectmyNotAllowedGroupList(userId);
		model.addAttribute("myNotAllowedGroupList", myNotAllowedGroupList);
		List<MemberInterestGroup> myInterestedGroupList = memberService.selectmyInterestedGroupList(userId);
		model.addAttribute("myInterestedGroupList", myInterestedGroupList);
		   

		List<Group> groupList = groupService.selectAllMyGroupList();
		model.addAttribute("groupList", groupList);

		List<Attachment> attachList = attachService.selectGroupAttachmentList();
		model.addAttribute("attachList", attachList);

		List<CategoryOne> caOneList = groupService.groupgroupContOne();
		model.addAttribute("caOneList", caOneList);

		return "member/memberGroupList";
	}

	@PostMapping("/delete.do")
	public Map<String,Object> delete(int groupNo, Authentication auth) {
		log.debug("groupNo={}",groupNo);
		Map<String,Object> map = new HashMap<String, Object>();
		Map<String,Object> param = new HashMap<String, Object>();
		int likeCnt = groupService.selectCountGroupLike(groupNo);
		log.debug("likeCnt={}",likeCnt);
		likeCnt -= 1;
		log.debug("likeCnt={}",likeCnt);
		/*
		 * int result = groupService.delete
		 */
		param.put("newCount", likeCnt);
		param.put("groupNo", groupNo);
		int result = groupService.updateGroupLikeCount(param);
		
		
		Member loginMember = (Member) auth.getPrincipal();
		param.put("memberId",loginMember.getId());
		result = groupService.deleteInterestGroupByParam(param);
		
		
		map.put("msg", result > 0 ? "?????????????????? ?????????????????????" : "??????");
		
		
		return map;
	}

	@GetMapping("/memberUpdate.do")
	public void memberUpdate(Authentication auth, Model model) {
		Member member = (Member) auth.getPrincipal();
		Attachment profile = memberService.selectMemberProfile(member.getId());
		model.addAttribute("profile", profile);
	}

	@PostMapping("/memberUpdate.do")
	public String memberUpdatePost(@RequestParam(value = "upFile", required = false) MultipartFile upFile,
			Member updateMember, Authentication oldAuthentication, HttpServletRequest request) throws Exception {
		log.debug("updateMember={}", updateMember);
		String email = (request.getParameter("emailId")) + "@" + (request.getParameter("email-server"));
		updateMember.setMemberEmail(email);
		
		log.debug("upfile = {}", upFile);
		
		String upfileOriginalFilename = "";
		try {
			 upfileOriginalFilename = upFile.getOriginalFilename();
		} catch (Exception e1) {
			
		}
		
		
		log.debug("member = {}", updateMember);
		if (!updateMember.getPassword().equals("")) {
			updateMember.setPassword(passwordEncoder.encode(updateMember.getPassword()));
		}

		Attachment oldProfile = memberService.selectMemberProfile(updateMember.getId());
		int result = 0;

		  try {
			  
			  if(oldProfile != null && ! upfileOriginalFilename.equals("")) {
				  
				  String originalFilename = upFile.getOriginalFilename(); String
				  renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);
				  
				  
				  // 1.?????????????????? ?????? String saveDirectory =
				  String saveDirectory = application.getRealPath("/resources/upFile/profile"); 
				  File dest = new  File(saveDirectory, renamedFilename);
				  log.debug("dest = {}", dest);
				  upFile.transferTo(dest);
				  
				  // 2.DB??? attachment ????????? ??????
				  
				  oldProfile.setRenamedFilename(renamedFilename);
				  oldProfile.setOriginalFilename(originalFilename);
			  }else if(upfileOriginalFilename.equals("")){
				 
				  
			  }else {
				  Attachment defaultProfile = new Attachment();
				  defaultProfile.setMemberId(updateMember.getId());
				  defaultProfile.setRenamedFilename("defaultProfile.png");
				  defaultProfile.setOriginalFilename(application.getRealPath("defaultProfile.png"));
				  result = memberService.insertAttach(defaultProfile);
			  }
			  result = memberService.updateAttach(oldProfile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			throw e;
		}
		 
		 

		Member principal = (Member) oldAuthentication.getPrincipal();
		principal.setMemberName(updateMember.getMemberName());
		principal.setNickname(updateMember.getNickname());
		principal.setBirthday(updateMember.getBirthday());
		principal.setMemberEmail(updateMember.getMemberEmail());
		principal.setPhone(updateMember.getPhone());
		principal.setMemberJob(updateMember.getMemberJob());
		principal.setPassword(updateMember.getPassword());
		principal.setMemberGender(updateMember.getMemberGender());
		principal.setAuthorities((List<SimpleGrantedAuthority>) oldAuthentication.getAuthorities());
		
		log.debug("member = {}", updateMember);
		result = memberService.updateMember(updateMember);

		Authentication newAuthentication = new UsernamePasswordAuthenticationToken(principal,
				oldAuthentication.getCredentials(), principal.getAuthorities());

		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		
		Map<String, Object> map = new HashMap<>();
		map.put("msg", "???????????? ?????? ??????!");

		return "redirect:/member/memberUpdate.do";
	}

	@PostMapping("/pwdCheck.do")
	@ResponseBody
	public ResponseEntity<?> pwdCheck(@RequestBody Member member) {
		log.debug("{}", member);
		Member loginMember = memberService.selectOneMember(member.getId());

		HttpHeaders header = new HttpHeaders();
		header.add("cosmos", "pwdCheck");

		if (passwordEncoder.matches(member.getPassword(), loginMember.getPassword())) {
			return new ResponseEntity<Boolean>(true, header, HttpStatus.OK);
		} else {
			return new ResponseEntity<Boolean>(false, header, HttpStatus.OK);
		}
	}

	@PostMapping("/profileCheck.do")
	@ResponseBody
	public ResponseEntity<?> profileCheck(@RequestBody String id) {
		log.debug("{}", id);
		String[] ids = id.split("=");
		log.debug("ids = {}", ids[1]);

		Attachment profile = memberService.selectMemberProfile(ids[1]);
		HttpHeaders header = new HttpHeaders();
		header.add("cosmos", "profileCheck");
		if (profile != null) {

			String renamedFilename = profile.getRenamedFilename();

			return new ResponseEntity<String>(renamedFilename, header, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("https://cdn-icons-png.flaticon.com/512/64/64572.png", header,
					HttpStatus.OK);
		}

	}
	
	
	@GetMapping("/checkIdDuplicate1.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate2(@RequestParam String id, Model model) {
		log.debug("id = {}", id);
		Map<String, Object> map = new HashMap<>();
		
		Member member = memberService.selectOneMember(id);
		map.put("available", member == null);
		return map;
	}
	@GetMapping("/setDefaultImg.do")
	@ResponseBody
	public Map<String, Object> setDefaultImg(@RequestParam String id, Model model){
		int result = memberService.updateMemberProfileAsDefault(id);
		Map<String, Object> map = new HashMap<>();
		String msg = result > 0 ? "??????????????? ?????? ??????" : "?????? ????????? ?????? ??????";
		map.put("msg", msg);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/deleteMember.do")
	
	public int deleteMember(String id, RedirectAttributes redirectAttr) {
		int result = memberService.deleteMember(id);
		if(result>0) {
			SecurityContextHolder.clearContext();
		}
		else {
			
		}

		return result;
	}
	
	@ResponseBody
	@PostMapping("/groupWithdrawal.do")
	public int groupWithdrawal(int groupNo, Authentication auth) {
		Member loginMember = (Member) auth.getPrincipal();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberId", loginMember.getId());
		param.put("groupNo", groupNo);
		
		// ?????? ????????????????????? ?????????
		int result = memberService.deleteMemberFromApplocationGroup(param);
		if(result > 0) {
			// ????????? ???????????? ???????????? ?????????
			List<Integer> chatRoomNoList = memberService.selectChatRoomNoList(groupNo);
			for(int chatRoomNo : chatRoomNoList) {
				param.put("chatRoomNo", chatRoomNo);
				
				try {
					result = memberService.deleteMemberFromChatuser(param);
				} catch (Exception e) {

				}
			}
		}
		// ?????? ????????????
		if(result > 0) {
			result = memberService.deleteMemberAuthorityAboutGroup(param);
		}
		
		// ?????? ?????????
		try {
			auth.getAuthorities().remove("ROLE_"+groupNo+"MEMBER");
		} catch (Exception e) {

		}
		try {
			auth.getAuthorities().remove("ROLE_"+groupNo+"MANAGER");
		} catch (Exception e) {

		}
		Authentication newAuthentication = new UsernamePasswordAuthenticationToken(loginMember,
				auth.getCredentials(), auth.getAuthorities());

		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		
		return groupNo;
	}
	
}
