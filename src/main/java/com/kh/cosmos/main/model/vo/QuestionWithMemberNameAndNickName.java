package com.kh.cosmos.main.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.cosmos.member.model.vo.MemberWithGroup;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper=true)
public class QuestionWithMemberNameAndNickName extends Question implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberName;
	private String nickname;
	public QuestionWithMemberNameAndNickName(int queNo, String memberId, String memberName, boolean status,
			String queTitle, String queContent, Date regDate, int attachNo, String queCategory, String memberName2,
			String nickname) {
		super(queNo, memberId, memberName, status, queTitle, queContent, regDate, attachNo, queCategory);
		memberName = memberName2;
		this.nickname = nickname;
	}
	
	
	
}
