package com.kh.cosmos.groupware.vote.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.groupware.vote.model.dao.VoteDao;
import com.kh.cosmos.groupware.vote.model.vo.Vote;
import com.kh.cosmos.groupware.vote.model.vo.VoteAnswer;
import com.kh.cosmos.groupware.vote.model.vo.VoteInfo;
import com.kh.cosmos.groupware.vote.model.vo.VoteOption;
import com.kh.cosmos.groupware.vote.model.vo.VoteQuestion;

@Service
public class VoteServiceImpl implements VoteService {
	@Autowired
	private VoteDao voteDao;

	@Override
	public int insertVote(Vote vote) {
		// TODO Auto-generated method stub
		return voteDao.insertVote(vote);
	}

	@Override
	public int insertVoteQuestion(VoteQuestion voteQuestion) {
		// TODO Auto-generated method stub
		return voteDao.insertVoteQuestion(voteQuestion);
	}

	@Override
	public int insertVoteOption(VoteOption voteOption) {
		// TODO Auto-generated method stub
		return voteDao.insertVoteOption(voteOption);
	}

	@Override
	public int selectGroupNewVoteNOByGroupNo(int groupNo) {
		// TODO Auto-generated method stub
		return voteDao.selectGroupNewVoteNOByGroupNo(groupNo);
	}

	@Override
	public List<VoteInfo> selectVoteInfoListByVoteNo(int voteNo) {
		// TODO Auto-generated method stub
		return voteDao.selectVoteInfoListByVoteNo(voteNo);
	}

	@Override
	public List<VoteOption> selectVoteOptionByVoteNo(int voteNo) {
		// TODO Auto-generated method stub
		return voteDao.selectVoteOptionByVoteNo(voteNo);
	}

	@Override
	public List<VoteInfo> selectVoteInfoByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return voteDao.selectVoteInfoByParam(param);
	}
	

	@Override
	public VoteInfo selectVoteInfoByVoteNo(int voteNo) {
		// TODO Auto-generated method stub
		return voteDao.selectVoteInfoByVoteNo(voteNo);
	}

	@Override
	public int insertVoteAnswer(VoteAnswer voteAnswer) {
		// TODO Auto-generated method stub
		return voteDao.insertVoteAnswer(voteAnswer);
	}

	@Override
	public int selectVoteAnswer(VoteAnswer voteAnswer) {
		// TODO Auto-generated method stub
		return voteDao.selectVoteAnswer(voteAnswer);
	}

	@Override
	public int selectAnswerdMemberCnt(int voteNo) {
		// TODO Auto-generated method stub
		return voteDao.selectAnswerdMemberCnt(voteNo);
	}

	@Override
	public List<VoteAnswer> selectVoteAnswerByVoteNo(int voteNo) {
		// TODO Auto-generated method stub
		return voteDao.selectVoteAnswerByVoteNo(voteNo);
	}

	@Override
	public List<String> selectVoteOptionStringList(int voteNo) {
		// TODO Auto-generated method stub
		return voteDao.selectVoteOptionStringList(voteNo);
	}
	
	
}