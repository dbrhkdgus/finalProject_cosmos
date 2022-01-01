package com.kh.cosmos.groupware.app.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.groupware.app.model.vo.TDL;

@Repository
public class AppDaoImpl implements AppDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<TDL> selectAlltdlListByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("app.selectAlltdlListById",param);
	}

	@Override
	public int insertTdlByGroup(TDL tdl) {
		// TODO Auto-generated method stub
		return session.insert("app.insertTdlByGroup", tdl);
	}

	@Override
	public int updateTDL(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("app.updateTDL",param);
	}
	
	
}
