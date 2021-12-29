package com.kh.cosmos.kakao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/kakao")
public class KakaoController {
	
	@Autowired
	private KakaoPay kakaopay;
	
	@GetMapping("/kakaoPay.do")
	public String kakaoPayOpen() {
		return "/group/KakaoPay";
	}
	
//	@GetMapping("/kakaoPay.do")
//    public void kakaoPayGet() {}
	
	@PostMapping("/kakaoPay.do")
    public String kakaoPay() {
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
    
    @GetMapping("/kakaoPaySuccess.do")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
    }
	
}
