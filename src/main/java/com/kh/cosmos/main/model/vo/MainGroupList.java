package com.kh.cosmos.main.model.vo;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kh.cosmos.common.attachment.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MainGroupList implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int groupNo;
	private int categoryNo;
	private String groupName;
	private Date groupEnrollDate;
	private char groupCharge;
	private char groupClose;
	private int groupPool;
	private char groupPrivate;
	private int groupLikeCount;
	private String groupLocation;
}
