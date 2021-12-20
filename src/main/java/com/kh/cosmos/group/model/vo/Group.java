package com.kh.cosmos.group.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.kh.cosmos.common.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Group extends GroupEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private GroupInfoConnect groupInfoConnect;
	private Attachment attachment;
	private List<GroupInfo> groupInfo;
	
	public Group(int groupNo, int categoryNo, String groupName, Date groupEnrollDate, char groupCharge, char groupClose,
			int groupPool, char groupPrivate, int groupLikeCount, String groupLocation) {
		super(groupNo, categoryNo, groupName, groupEnrollDate, groupCharge, groupClose, groupPool, groupPrivate, groupLikeCount,
				groupLocation);
		// TODO Auto-generated constructor stub
	}
	
	
	
}
