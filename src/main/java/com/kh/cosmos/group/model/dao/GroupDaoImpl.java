package com.kh.cosmos.group.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.GroupInfo;
import com.kh.cosmos.group.model.vo.GroupInfoConnect;

@Repository
public class GroupDaoImpl implements GroupDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insertGroup(Group group) {
		return session.insert("group.insertGroup", group);
	}

	@Override
	public int insertAttach(Attachment attach) {
		return session.insert("group.insertAttach", attach);
	}

	@Override
	public int insertGroupInfoConnect(GroupInfoConnect groupInfoConnect) {
		return session.insert("group.insertGroupInfoConnect", groupInfoConnect);
	}

	@Override
	public int insertGroupInfo(GroupInfo gi) {
		return session.insert("group.insertGroupInfo", gi);
	}
}
