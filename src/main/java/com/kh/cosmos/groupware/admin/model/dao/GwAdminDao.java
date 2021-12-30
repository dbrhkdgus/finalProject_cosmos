package com.kh.cosmos.groupware.admin.model.dao;

import java.util.List;

import com.kh.cosmos.group.model.vo.ApplocationGroup;

public interface GwAdminDao {

	List<ApplocationGroup> selectAllAcceptGroupMemberList(int groupNo);

	List<ApplocationGroup> selectAllWaitingGroupMemberList(int groupNo);

}
