package com.kh.cosmos.group.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.cosmos.member.model.vo.MemberWithGroup;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NotApprovedGroup extends Group implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String hostId;
	private char role;
	private String renamedFilename;
	private String imgFlag;
	private String category1Name;

	public NotApprovedGroup(int groupNo, int categoryNo, String groupName, Date groupEnrollDate, char groupCharge,
			char groupClose, int groupPool, char groupPrivate, int groupLikeCount, String groupLocation, String hostId,
			char role, String renamedFilename, String imgFlag, String category1Name) {
		super(groupNo, categoryNo, groupName, groupEnrollDate, groupCharge, groupClose, groupPool, groupPrivate,
				groupLikeCount, groupLocation);
		this.hostId = hostId;
		this.role = role;
		this.renamedFilename = renamedFilename;
		this.imgFlag = imgFlag;
		this.category1Name = category1Name;
	}
	
	

}
