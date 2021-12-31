package com.kh.cosmos.groupware.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.group.model.vo.ApplocationGroup;

public interface GwAdminService {

	List<ApplocationGroup> selectAllAcceptGroupMemberList(int groupNo);

	List<ApplocationGroup> selectAllWaitingGroupMemberList(int groupNo);

	int updategroupAccept(Map<String, String> idList);

}
