package com.kh.cosmos.groupware.vote.model.dao;

import java.util.List;

import com.kh.cosmos.groupware.vote.model.vo.Vote;
import com.kh.cosmos.groupware.vote.model.vo.VoteInfo;
import com.kh.cosmos.groupware.vote.model.vo.VoteOption;
import com.kh.cosmos.groupware.vote.model.vo.VoteQuestion;

public interface VoteDao {

	int insertVote(Vote vote);

	int insertVoteQuestion(VoteQuestion voteQuestion);

	int insertVoteOption(VoteOption voteOption);

	int selectGroupNewVoteNOByGroupNo(int groupNo);

	List<VoteInfo> selectVoteInfoByVoteNo(int voteNo);

	List<VoteOption> selectVoteOptionByVoteNo(int voteNo);

}
