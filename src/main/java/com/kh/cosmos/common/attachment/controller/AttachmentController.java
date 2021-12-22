package com.kh.cosmos.common.attachment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.cosmos.common.attachment.model.service.AttachmentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AttachmentController {
	@Autowired
	private AttachmentService attachService;
}
