package com.kh.cosmos.groupware.admin.model.vo;

import java.io.Serializable;

import com.kh.cosmos.groupware.admin.model.service.GwAdminService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class idList implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
}
