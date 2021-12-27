<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<div class="groupware-main-outter">

		<div class="groupware-main-title">
			<h2>${myGroup.groupName}</h2>
			<c:forEach var="attach" items="${groupBannerAttachList }">
				<c:if test="${myGroup.groupNo == attach.groupNo }">
					<%-- <img src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}" alt="" /> --%>
					<img class="groupware-main-banner" src="${pageContext.request.contextPath }/resources/upFile/group/20211220_172447483_398.jpg" alt="" />
				</c:if>
			</c:forEach>
		</div>

		<div class="groupware-main-contents">
			<div class="groupware-main-notice" >
				<h3>공지사항</h3>
				<ul>
					<li>공지사항</li>
					<li>공지사항</li>
					<li>공지사항</li>
				</ul>
			</div>
			<!-- 메인페이지 달력-->
			<div class="groupware-main-calendar">
				<h3>Calendar</h3>
				<img src="${pageContext.request.contextPath }/resources/images/calendar.PNG" class="calendar-img" alt="">
			</div>
		</div>
	
</div>





<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

