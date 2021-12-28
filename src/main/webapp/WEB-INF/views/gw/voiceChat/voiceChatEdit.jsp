<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>
	
<div class="workspace-box">
  <div class="voiceChatEdit-container text-center" style="width: 60%;margin: 0 auto;">
    <div class="voiceChatEdit-title">
      <h1>화상 채널 관리</h1>
	      <div class="voiceChatEdit-body">
			<table class="table">
			    <thead>
			      <tr>
			        <th colspan="2">채널 이름</th>
			        <th>생성member</th>
			        <th>삭제</th>
			      </tr>
			    </thead>
					<c:forEach var="room" items="${roomList}">
					<tbody>
				      <tr>
				        <td colspan="2">${room.roomName}</td>
				        <td>${room.roomAdmin}</td>
				        <c:if test="${loginMember.id eq room.roomAdmin}">
				        	<td><button class="btn btn-deleteVoiceChatRoom" onclick="deleteRoom(${room.roomNo});">삭제</button></td>
				        </c:if>
				        <c:if test="${loginMember.id ne room.roomAdmin}">
				        	<td></td>
				        </c:if>
				        
				      </tr>
				    </tbody>
				</c:forEach>
			</table>
		</div>
    </div>
  </div>
</div>


<script>
function deleteRoom(roomNo){
	$.ajax({
		url: `${pageContext.request.contextPath}/gw/voiceChat/deleteVoiceChatRoom.do`,
		data: {'roomNo' : roomNo},
		type: "GET",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType: "text",
		success(data){
			console.log(data);
			alert(data);
			location.reload();
		},
		error(xhr,textStatus,err){
			console.log(xhr,textStatus,err);
		}
	});
};
</script>




<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>