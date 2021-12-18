package com.kh.cosmos.group.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.group.model.vo.Group;

@Repository
public class GroupDaoImpl implements GroupDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insertGroup(Group group) {
		return session.insert("group.insertGroup", group);
	}
}
