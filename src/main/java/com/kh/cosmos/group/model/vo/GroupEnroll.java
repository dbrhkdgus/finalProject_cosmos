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
public class GroupEnroll extends Group implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String[] cateCheckBox;

	public GroupEnroll(int groupNo, int categoryNo, String groupName, Date groupEnrollDate, char groupCharge,
			char groupClose, int groupPool, char groupPrivate, int groupLikeCount, String groupLocation,
			String[] cateCheckBox) {
		super(groupNo, categoryNo, groupName, groupEnrollDate, groupCharge, groupClose, groupPool, groupPrivate,
				groupLikeCount, groupLocation);
		this.cateCheckBox = cateCheckBox;
	}
	
	
	

	
	
	
	
	
	
	
}
