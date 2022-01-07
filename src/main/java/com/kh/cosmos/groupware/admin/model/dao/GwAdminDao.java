package com.kh.cosmos.groupware.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.groupware.admin.model.vo.TdlMemberCount;
import com.kh.cosmos.groupware.admin.model.vo.TdlMonthlyData;
import com.kh.cosmos.groupware.app.model.vo.TDL;
import com.kh.cosmos.groupware.fileBoard.vo.IdNickName;

public interface GwAdminDao {

	List<ApplocationGroup> selectAllAcceptGroupMemberList(int groupNo);

	List<ApplocationGroup> selectAllWaitingGroupMemberList(int groupNo);

	int updategroupAccept(Map<String, String> idList);

	int updategroupAcceptByList(Map<String, Object> param);

	int selectGwGroupPool(String groupNo);

	int selectGwGroupCount(String groupNo);

	int deletegroupRefuseByList(Map<String, Object> param);

	int deleteGwMember(Map<String, Object> param);

	int updateMemberRole(Map<String, Object> param);

	List<IdNickName> selectChartIdNickNameList();

	List<TdlMemberCount> selectcheckedToDoList(int groupNo);

	int insertMemberAuthority(Map<String, Object> param);

	List<TdlMonthlyData> selectTdlMonthlyDataList(int groupNo);

	List<TdlMonthlyData> selectTdlMonthlyMemberCountList(int groupNo);

	int deleteGroupAuthorities(Map<String, Object> param);

	int updateMemberAuthorities(Map<String, Object> param);



}
