package com.kh.cosmos.groupware.app.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.groupware.app.model.vo.TDL;

@Repository
public class AppDaoImpl implements AppDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<TDL> selectAlltdlListByParam(Map<String, Object> param, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("app.selectAlltdlListById",param,rowBounds);
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

	@Override
	public List<TDL> selectTDLBysort(Map<String, Object> param) {
		return session.selectList("app.selectTDLBysort",param);
	}

	@Override
	public int selectTDLTotalCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("app.selectTDLTotalCount",param);
	}

	@Override
	public int selectTDLBysortTotalCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("app.selectTDLBysortTotalCount",param);
	}
	
	
}
