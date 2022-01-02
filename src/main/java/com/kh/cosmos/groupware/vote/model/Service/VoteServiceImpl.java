package com.kh.cosmos.groupware.vote.model.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.groupware.vote.model.Dao.VoteDao;

@Service
public class VoteServiceImpl implements VoteService {
	@Autowired
	private VoteDao voteDao;
}
