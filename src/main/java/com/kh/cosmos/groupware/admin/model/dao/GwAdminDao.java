package com.kh.cosmos.groupware.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.group.model.vo.ApplocationGroup;

public interface GwAdminDao {

	List<ApplocationGroup> selectAllAcceptGroupMemberList(int groupNo);

	List<ApplocationGroup> selectAllWaitingGroupMemberList(int groupNo);

	int updategroupAccept(Map<String, String> idList);

}
