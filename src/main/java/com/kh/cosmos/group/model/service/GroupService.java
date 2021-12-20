package com.kh.cosmos.group.model.service;

import com.kh.cosmos.common.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;

public interface GroupService {

	int insertGroup(Group group);

	int insertAttach(Attachment attach);
	
	
}
