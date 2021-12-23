package com.kh.cosmos.member.model.vo;

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
public class Member implements Serializable, UserDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String memberName;
	private String nickname;
	private String password;
	private String memberEmail;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")	
	private Date birthday;
	
	private String phone;
	private String memberGender;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date memberEnrollDate;
	private String memberJob;
	private String memberAchieve;
	private int attachNo;
	private boolean enabled;//회원 활성화 여부

	
	/**
	 * 회원권한리스트
	 * SimpleGrantedAuthority
	 *  - GrantedAuthority의 구현클래스로 문자열로 된 권한정보를 생성자의 인자로 받는다.
	 */
	private List<SimpleGrantedAuthority> authorities;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}
	@Override
	public String getUsername() {
		return id;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}


}
