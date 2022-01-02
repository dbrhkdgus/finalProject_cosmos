package com.kh.cosmos.groupware.vote.model.service;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.groupware.vote.model.vo.Vote;
import com.kh.cosmos.groupware.vote.model.vo.VoteAnswer;
import com.kh.cosmos.groupware.vote.model.vo.VoteInfo;
import com.kh.cosmos.groupware.vote.model.vo.VoteOption;
import com.kh.cosmos.groupware.vote.model.vo.VoteQuestion;

public interface VoteService {

	int insertVote(Vote vote);

	int insertVoteQuestion(VoteQuestion voteQuestion);

	int insertVoteOption(VoteOption voteOption);

	int selectGroupNewVoteNOByGroupNo(int groupNo);

	List<VoteInfo> selectVoteInfoListByVoteNo(int voteNo);

	List<VoteOption> selectVoteOptionByVoteNo(int voteNo);

	List<VoteInfo> selectVoteInfoByParam(Map<String, Object> param);

	int insertVoteAnswer(VoteAnswer voteAnswer);

	int selectVoteAnswer(VoteAnswer voteAnswer);

	VoteInfo selectVoteInfoByVoteNo(int voteNo);

}