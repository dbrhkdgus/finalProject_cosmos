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
		
<div class="test-board-outter">
  <div class="test-board-title-container">
    <div class="test-board-title">
      <h1>화상 채널 추가</h1>
	
    </div>
  </div>
</div>


<script>
function AddZoomRoomSubmit(){
	var $roomName = $("[name=roomName]");
	if(/^(.|\n)+$/.test($roomName.val()) == false){
		alert("채팅방 이름을 입력하세요");
		return false;
	}
	var $zoomId = $("[name=zoomId]");
	if(/^(.|\n)+$/.test($zoomId.val()) == false){
		alert("zoomId를 입력하세요");
		return false;
	}
	var $zoomPassword = $("[name=zoomPassword]");
	if(/^(.|\n)+$/.test($zoomPassword.val()) == false){
		alert("zoomPassword를 입력하세요");
		return false;
	}
	return true;
}
</script>




<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>