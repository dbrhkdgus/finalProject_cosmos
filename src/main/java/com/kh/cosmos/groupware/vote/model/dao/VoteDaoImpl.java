package com.kh.cosmos.groupware.vote.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.groupware.vote.model.vo.Vote;
import com.kh.cosmos.groupware.vote.model.vo.VoteInfo;
import com.kh.cosmos.groupware.vote.model.vo.VoteOption;
import com.kh.cosmos.groupware.vote.model.vo.VoteQuestion;

@Repository
public class VoteDaoImpl implements VoteDao {
	@Autowired
	private SqlSession session;

	@Override
	public int insertVote(Vote vote) {
		// TODO Auto-generated method stub
		return session.insert("vote.insertVote", vote);
	}

	@Override
	public int insertVoteQuestion(VoteQuestion voteQuestion) {
		// TODO Auto-generated method stub
		return session.insert("vote.insertVoteQuestion", voteQuestion);
	}

	@Override
	public int insertVoteOption(VoteOption voteOption) {
		// TODO Auto-generated method stub
		return session.insert("vote.insertVoteOption", voteOption);
	}

	@Override
	public int selectGroupNewVoteNOByGroupNo(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectOne("vote.selectGroupNewVoteNOByGroupNo", groupNo);
	}

	@Override
	public List<VoteInfo> selectVoteInfoByVoteNo(int voteNo) {
		// TODO Auto-generated method stub
		return session.selectList("vote.selectVoteInfoByVoteNo",voteNo);
	}

	@Override
	public List<VoteOption> selectVoteOptionByVoteNo(int voteNo) {
		// TODO Auto-generated method stub
		return session.selectList("vote.selectVoteOptionByVoteNo", voteNo);
	}
	
	
}
