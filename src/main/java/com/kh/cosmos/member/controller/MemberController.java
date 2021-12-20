package com.kh.cosmos.member.controller;

import java.beans.PropertyEditor;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.member.model.service.MemberService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

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
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/memberLogin.do")
	public String memberLogin() {
		return "member/memberLogin";
	}
	
	@PostMapping("/memberLogin.do")
	public String memberLoginForm(
			@RequestParam String id, 
			@RequestParam String password, 
			RedirectAttributes redirectAttr, 
			Model model,
			HttpSession session) {
		//model = memberService.memberLoginForm();
		log.debug("id = {}", id);
		log.debug("password = {}", password);
		
		//1. 업무로직 - 사용자 데이터 가져오기
		Member member = memberService.selectOneMember(id);
		log.debug("member = {}", member);
		
		String location = "/";
		// 2.db정보 비교하기(로그인 성공여부 판단)
		if(member != null && password.equals(member.getPassword())) {
			// 로그인 성공 : loginMember객체를 세션에 저장해서 로그인상태유지
			model.addAttribute("loginMember", member);
			log.debug("loginMember = {}", member);
			
			// redirect주소 세션에서 가져오기
			String redirect = (String) session.getAttribute("redirect");
			log.debug("redirect = {}", redirect);
			if(redirect != null) {
				location = redirect;
				session.removeAttribute("redirect");
			}
		}
		else {
			// 로그인 실패
			log.debug("로그인 실패");
			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 다릅니다.");
		}
		return "redirect:" + location;
	}
	
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
	
//	@PostMapping("/memberEnroll.do")
//	public String memberEnroll(Member member, RedirectAttributes redirectAttr) {
//		log.debug("member = {}", member);
//		
//		try {
//			// 0.비밀번호 암호화 처리
//			log.info("{}", passwordEncoder);
//			String rawPassword = member.getPassword();
//			String encryptedPassword = passwordEncoder.encode(rawPassword);
//			member.setPassword(encryptedPassword);
//			log.info("{} -> {}", rawPassword, encryptedPassword);
//			
//			// 1.업무로직
//			int result = memberService.insertMember(member);
//			
//			// 2.리다이렉트 & 사용자피드백전달
//			redirectAttr.addFlashAttribute("msg", "회원가입 성공!");
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw e;
//		}
//		
//		return "redirect:/";
//	}
//	
	@GetMapping("/memberAPIEnroll.do")
	public String memberAPIEnroll() {
		return "member/memberAPIEnroll";
	}
	
	@PostMapping("/memberLoginKakaoMoreInfo.do")
	public String memberLoginKakao(HttpServletRequest request, Model model,HttpSession session) {
		Member kakaoMember = new Member();
		if(memberService.selectOneMember(request.getParameter("memberId")) == null) {
		
		kakaoMember.setMemberId(request.getParameter("memberId"));
		kakaoMember.setMemberName(request.getParameter("memberName"));
		kakaoMember.setMemberGender(request.getParameter("gender"));
		
		model.addAttribute("kakaoMember",kakaoMember);
		model.addAttribute("_birthDay",request.getParameter("_birthDay"));
		model.addAttribute("profile_img",request.getParameter("profile_img"));
		
		
		session.setAttribute("kakaoMemeber", kakaoMember);
//		log.debug("loginMember = {}",kakaoMember);
		
		return "member/memberLoginKakaoMoreInfo";
		} else {
			return "redirect:/";
		}
			
		
	}
	@RequestMapping("/memberLoginKakaoMoreInfo.do")
	public String memberLoginKakao(HttpServletRequest request, Model model,HttpSession session, RedirectAttributes redirectAttr) {
		log.debug("{}","requestMapping");
		Member kakaoMember = new Member();
		if(memberService.selectOneMember(request.getParameter("memberId")) == null) {
		
		kakaoMember.setMemberId(request.getParameter("memberId"));
		kakaoMember.setMemberName(request.getParameter("memberName"));
		kakaoMember.setMemberGender(request.getParameter("gender"));
		
		model.addAttribute("kakaoMember",kakaoMember);
		model.addAttribute("_birthDay",request.getParameter("_birthDay"));
		model.addAttribute("profile_img",request.getParameter("profile_img"));
		
		
		session.setAttribute("kakaoMemeber", kakaoMember);
//		log.debug("loginMember = {}",kakaoMember);
		
		return "member/memberLoginKakaoMoreInfo";
		} else {
			redirectAttr.addFlashAttribute("msg", "이미 가입한 카카오 아이디입니다.");
			//flashMap.put("msg", "이미 가입한 카카오 아이디입니다.");
			return "redirect:/member/memberAPIEnroll.do";
		}
			
		
	}
	
	@PostMapping("/memberAPImoreInfoEnroll.do")
	public String memberAPImoreInfoEnroll(Member member, HttpServletRequest request, Model model) {
		String email = (request.getParameter("emailId")) + "@" + (request.getParameter("email-server"));
		String birthDay = (request.getParameter("birtYear")) + (request.getParameter("birthMonth"))+ (request.getParameter("birthDate")); 
		 
		
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd"); 
			SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd"); // String 타입을 Date 타입으로 변환
			Date formatDate = new Date();
			try {
				formatDate = newDtFormat.parse(birthDay);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		log.debug("formatDate = {}",formatDate);

		
		member.setMemberEmail(email);
		member.setBirthday(formatDate);
		member.setPassword("1234");
		
		log.debug("member = {}", member);
		memberService.insertMember(member);
		
		return "redirect:/";
	}
	

	@GetMapping("/memberGroupList.do")
	public String memberGroupList() {
		
		return "member/memberGroupList";
	}
	
	@PostMapping("memberEnroll.do")
	public String memberEnrollPost(Member member, RedirectAttributes redirectAttr, HttpServletRequest request) {
		String email = (request.getParameter("emailId")) + "@" + (request.getParameter("email-server"));
		member.setMemberEmail(email);
		log.debug("member.birthday = {}", member.getBirthday());
		try {
			int result = memberService.insertMember(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			redirectAttr.addFlashAttribute("msg", "회원가입 실패");
		}
		
		return "redirect:/";
	}
}
