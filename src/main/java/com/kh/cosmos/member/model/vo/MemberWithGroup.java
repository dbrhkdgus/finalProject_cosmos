package com.kh.cosmos.member.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper=true)
public class MemberWithGroup extends Member implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int groupNo;
	private String groupName;
	public MemberWithGroup(String id, String memberName, String nickname, String password, String memberEmail,
			Date birthday, String phone, String memberGender, Date memberEnrollDate, String memberJob,
			String memberAchieve, int attchNo, boolean enabled, List<SimpleGrantedAuthority> authorities, int groupNo,
			String groupName) {
		super(id, memberName, nickname, password, memberEmail, birthday, phone, memberGender, memberEnrollDate,
				memberJob, memberAchieve, attchNo, enabled, authorities);
		this.groupNo = groupNo;
		this.groupName = groupName;
	}
	
	
}
