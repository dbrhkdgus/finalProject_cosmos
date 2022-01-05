package com.kh.cosmos.groupware.app.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.groupware.app.model.vo.TDL;

public interface AppDao {

	List<TDL> selectAlltdlListByParam(Map<String, Object> param, int limit, int offset);

	int insertTdlByGroup(TDL tdl);

	int updateTDL(Map<String, Object> param);

	List<TDL> selectTDLBysort(Map<String, Object> param);

	int selectTDLTotalCount(Map<String, Object> param);

	int selectTDLBysortTotalCount(Map<String, Object> param);

}
