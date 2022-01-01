package com.kh.cosmos.groupware.vote.model.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VoteDaoImpl implements VoteDao {
	@Autowired
	private SqlSession session;
}
