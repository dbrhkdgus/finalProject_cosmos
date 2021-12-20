package com.kh.cosmos.group.model.service;

import com.kh.cosmos.common.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.GroupInfo;
import com.kh.cosmos.group.model.vo.GroupInfoConnect;

public interface GroupService {

	int insertGroup(Group group);

	int insertAttach(Attachment attach);

	int insertGroupInfoConnect(GroupInfoConnect groupInfoConnect);

	int insertGroupInfo(GroupInfo gi);
	
	
}
