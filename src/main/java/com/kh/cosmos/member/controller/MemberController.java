package com.kh.cosmos.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.member.model.service.MemberService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes({"loginMember"}) // session에 저장될 model data 지정

public class MemberController {
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
	
	@GetMapping("/memberAPIEnroll.do")
	public String memberAPIEnroll() {
		return "member/memberAPIEnroll";
	}
	
	
}
