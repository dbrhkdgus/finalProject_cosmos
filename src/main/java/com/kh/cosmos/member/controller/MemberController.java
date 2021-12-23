package com.kh.cosmos.member.controller;

import java.beans.PropertyEditor;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.attachment.model.service.AttachmentService;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.service.GroupService;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.CategoryOne;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.member.model.service.MemberService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes({"loginMember"}) // session에 저장될 model data 지정

public class MemberController {
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 형식객체, 빈값허용여부("" -> null)
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
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/memberLogin.do")
	public String memberLogin() {
		return "member/memberLogin";
	}
	@PostMapping("/memberLogin.do")
	public void memberLoginPost(@RequestParam String id ,@RequestParam String password) {}

	
	@GetMapping("/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		
		return "redirect:/";
	}
	
	
	@GetMapping("/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
	}

	@PostMapping("/memberEnroll.do")
	public String memberEnroll(Member member, RedirectAttributes redirectAttr, HttpServletRequest request) {
		log.debug("member = {}", member);
		String email = (request.getParameter("emailId")) + "@" + (request.getParameter("email-server"));
		member.setMemberEmail(email);
		
		try {
			// 0.비밀번호 암호화 처리
			log.info("{}", passwordEncoder);
			String rawPassword = member.getPassword();
			String encryptedPassword = passwordEncoder.encode(rawPassword);
			member.setPassword(encryptedPassword);
			log.info("{} -> {}", rawPassword, encryptedPassword);
			
			// 1.업무로직
			int result = memberService.insertMember(member);
			result = memberService.insertUserAuthority(member.getId());
			// 2.리다이렉트 & 사용자피드백전달
			redirectAttr.addFlashAttribute("msg", "회원가입 성공!");
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
	public String memberLoginKakao(HttpServletRequest request, Model model,HttpSession session, Authentication auth, RedirectAttributes redirectAttr) {
		Member kakaoMember = memberService.selectOneMember(request.getParameter("kakaoId"));
		log.debug("kakaoMember = {}", kakaoMember);
		if(kakaoMember == null) {
			kakaoMember = new Member();
			kakaoMember.setId(request.getParameter("kakaoId"));
			kakaoMember.setMemberName(request.getParameter("memberName"));
			kakaoMember.setMemberGender(request.getParameter("gender"));
			
			model.addAttribute("kakaoMember",kakaoMember);
			model.addAttribute("_birthDay",request.getParameter("_birthDay"));
			model.addAttribute("profile_img",request.getParameter("profile_img"));
			
	//		log.debug("loginMember = {}",kakaoMember);
			
			return "member/memberLoginKakaoMoreInfo";
		} else {
			// 권한을 부여하여 홈으로 가게만들기
			kakaoMember.setPassword("1234");
			
			if("http://localhost:9090/cosmos/member/memberAPIEnroll.do".equals(request.getHeader("referer"))) {
				redirectAttr.addFlashAttribute("msg","이미 가입된 카카오 아이디입니다.");
			}
			kakaoMember.setPassword(passwordEncoder.encode(kakaoMember.getPassword()));
			Authentication kakaoAuthentication = new UsernamePasswordAuthenticationToken(kakaoMember, kakaoMember.getPassword(), kakaoMember.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(kakaoAuthentication);
			return "redirect:/";
		}	
	}
	

	@GetMapping("/memberGroupList.do")
	public String memberGroupList(Model model, Authentication auth, RedirectAttributes redirectAttr) {
		
		Member member = (Member)auth.getPrincipal();
		String userId = member.getId();
		
		List<ApplocationGroup> myGroupList = memberService.selectMyGroupList(userId);
		model.addAttribute("myGroupList", myGroupList);
		
		List<Group> groupList = groupService.selectAllMyGroupList();
		model.addAttribute("groupList", groupList);
		
		List<Attachment> attachList = attachService.selectGroupAttachmentList();
		model.addAttribute("attachList",attachList);
		
		List<CategoryOne> caOneList = groupService.groupgroupContOne();
		model.addAttribute("caOneList", caOneList);
		
		return "member/memberGroupList";
	}
	

//	@PostMapping("memberEnroll.do")
//	public String memberEnrollPost(Member member, RedirectAttributes redirectAttr, HttpServletRequest request) {
//		String email = (request.getParameter("emailId")) + "@" + (request.getParameter("email-server"));
//		member.setMemberEmail(email);
//		log.debug("member.birthday = {}", member.getBirthday());
//		try {
//			int result = memberService.insertMember(member);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			redirectAttr.addFlashAttribute("msg", "회원가입 실패");
//		}
//		
//		return "redirect:/";
//	}
	
	@GetMapping("/memberUpdate.do")
	public void memberUpdate() {}
	
	@PostMapping("/memberUpdate.do")
	public ResponseEntity<?> memberUpdatePost(@RequestBody Member updateMember, Authentication oldAuthentication, HttpServletRequest request) {
		
		if(!updateMember.getPassword().equals("")) {
			updateMember.setPassword(passwordEncoder.encode(updateMember.getPassword()));			
		}
		
		
		Member principal = (Member)oldAuthentication.getPrincipal();
		principal.setMemberName(updateMember.getMemberName()); 
		principal.setNickname(updateMember.getNickname()); 
		principal.setBirthday(updateMember.getBirthday());
		principal.setMemberEmail(updateMember.getMemberEmail());
		principal.setPhone(updateMember.getPhone());
		principal.setMemberJob(updateMember.getMemberJob());
		principal.setPassword(updateMember.getPassword());
		

		int result = memberService.updateMember(updateMember);
		
		Authentication newAuthentication = new UsernamePasswordAuthenticationToken(principal, oldAuthentication.getCredentials(), updateMember.getAuthorities());
		
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		Map<String, Object> map = new HashMap<>();
		map.put("msg", "회원정보 수정 성공!");
		
		return ResponseEntity.ok(null);
	}
	@PostMapping("/pwdCheck.do")
	@ResponseBody
	public ResponseEntity<?> pwdCheck(@RequestBody Member member){
		log.debug("{}",member);
		Member loginMember = memberService.selectOneMember(member.getId());
		
		HttpHeaders header = new HttpHeaders();
		header.add("cosmos", "pwdCheck");
		
		if(passwordEncoder.matches(member.getPassword(), loginMember.getPassword())) {
			return new ResponseEntity<Boolean>(true, header, HttpStatus.OK);
		}else {
			return new ResponseEntity<Boolean>(false, header, HttpStatus.OK);
		}
	}
}
