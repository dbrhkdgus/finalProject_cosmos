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
public class GroupFail extends Group implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private GroupInfoConnect groupInfoConnect;
	private Attachment attachment;
	private List<GroupInfo> groupInfo;
	
	public GroupFail(int groupNo, int categoryNo, String groupName, Date groupEnrollDate, char groupCharge, char groupClose,
			int groupPool, char groupPrivate, int groupLikeCount, String groupLocation,
			GroupInfoConnect groupInfoConnect, Attachment attachment, List<GroupInfo> groupInfo) {
		super(groupNo, categoryNo, groupName, groupEnrollDate, groupCharge, groupClose, groupPool, groupPrivate,
				groupLikeCount, groupLocation);
		this.groupInfoConnect = groupInfoConnect;
		this.attachment = attachment;
		this.groupInfo = groupInfo;
	}
	
	
	
	
	
	
	
}
