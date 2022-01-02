package com.kh.cosmos.groupware.app.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.groupware.app.model.dao.AppDao;
import com.kh.cosmos.groupware.app.model.vo.TDL;

@Service
public class AppServiceImpl implements AppService {
	@Autowired
	private AppDao appDao;

	@Override
	public List<TDL> selectAlltdlListByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return appDao.selectAlltdlListByParam(param);
	}

	@Override
	public int insertTdlByGroup(TDL tdl) {
		// TODO Auto-generated method stub
		return appDao.insertTdlByGroup(tdl);
	}

	@Override
	public int updateTDL(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return appDao.updateTDL(param);
	}
	
}
