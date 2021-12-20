package com.kh.cosmos.group.model.dao;

import com.kh.cosmos.common.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;

public interface GroupDao {

	int insertGroup(Group group);

	int insertAttach(Attachment attach);

}
