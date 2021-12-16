package com.kh.cosmos.groupware.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/admin")
public class GwAdminController {
	@GetMapping("/memberManager.do")
	public void memberManager() {}
}
