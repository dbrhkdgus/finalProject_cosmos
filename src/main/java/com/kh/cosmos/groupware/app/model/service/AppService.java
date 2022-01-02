package com.kh.cosmos.groupware.app.model.service;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.groupware.app.model.vo.TDL;

public interface AppService {

	List<TDL> selectAlltdlListByParam(Map<String, Object> param);

	int insertTdlByGroup(TDL tdl);

	int updateTDL(Map<String, Object> param);

	List<TDL> selectTDLBysort(Map<String, Object> param);

}
