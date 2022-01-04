<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/full_calendar/main.css" />
<script
	src='${pageContext.request.contextPath}/resources/css/full_calendar/main.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/js/moment.min.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/css/full_calendar/locales/ko.js'></script>

<div class="gw_main_workspace-box">

		<div class="groupware-main-title">
			<h2>${myGroup.groupName}</h2>
			<c:forEach var="attach" items="${groupBannerAttachList }">
				<c:if test="${myGroup.groupNo == attach.groupNo }">
					<%-- <img src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}" alt="" /> --%>
					<img class="groupware-main-banner" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}" alt="" />
				</c:if>
			</c:forEach>
		</div>

		<div class="groupware-main-contents">
			<div class="groupware-main-notice" >
				<h3>공지사항</h3>
				<ul>
					<c:forEach var="notice" items="${noticePostList}">
						<li><a href="${pageContext.request.contextPath }/gw/board/boardDetail.do?postNo=${notice.postNo}">${notice.postTitle }</a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- 메인페이지 달력-->
			<div class="groupware-main-calendar">
					<div id='calendar'></div>
			</div>
		</div>
	
</div>
<script>
//캘린더 관련 시작
/* let groupNo = ${myGroup.groupNo};
document.addEventListener('DOMContentLoaded', function() {
	
	
  var calendarEl = document.getElementById('calendar');
  

  
  var calendar = new FullCalendar.Calendar(calendarEl, {
	height: '240%', */



    /* initialDate: '2021-12-12', */
   /*  navLinks: true, // can click day/week names to navigate views
    editable: true,
    locale: 'ko',
    dayMaxEvents: true // allow "more" link when too many events
    ,	events: [
    	//DB에서 데이터 가져오기
		  $.ajax({
				type: "get",
				url: `${pageContext.request.contextPath}/gw/calendar/selectList.do`,
				dataType: "json",
				data:{
					groupNo : groupNo
				},
				success: function(data){
					console.log("data: "+data);
					console.log("data.list: "+data.list);
					result = data.list;
					console.log("data.list.length: "+data.list.length);
					

					for(i=0; i < result.length; i++){

						console.log("result[i] = "+result[i]);
						console.log("result[i]['endDate'] = ", result[i]['endDate']);
						console.log(new Date(result[i]['endDate']));
						let date = new Date(result[i]['endDate']);
						 */
						/* fullcalendar는 종일 일정 기간에서 마지막 기간은 포함하지 않는다. 따라서 종일일정일 경우, +1일을 한다. */
						/* if(result[i]['allDay']== 'T'){
							date.setDate(date.getDate()+1);
						}
						
						
						console.log("테스트출력: "+result[i]['memberId']);
						console.log("테스트출력: "+$("#memberId").val());
						let _writer = result[i]['memberId'];
						let _loginMember = $("#memberId").val();
						console.log("--------------------------------------")
						console.log(typeof(_writer));
						console.log(typeof(_loginMember));
						console.log(_writer==_loginMember);
						console.log("--------------------------------------")
						
						
						if(result[i]['category'] == 'G'){
							changeColor = input_groupColor;
						}else{
							changeColor = result[i]['privateColor'];
						}
						console.log("컬러: "+changeColor);
						
						calendar.addEvent({
							title: result[i]['title'],
							start: result[i]['startDate'],
							end: date,
							allDay : result[i]['allDay']== 'T'? true : false,
							color: result[i]['category'] = changeColor,
							content: result[i]['content'],
							writer: result[i]['memberId'],
							scheduleNo: result[i]['scheduleNo'],
							groupColor: result[i]['groupColor'],
							privateColor: result[i]['privateColor']
						})
					}
				},

				error: console.log
			})
	
		],//event Drag & Drop
 		eventDrop: function(event, delta, newResource) {
 			console.log("+++++++++++++++++++++++++++++++++++++++++++++++++")
			console.log(event.event);
			console.log("delta = "+event.delta);
			console.log("newResource = "+event.newResource);


	    },

  });

  calendar.render();
}); */
</script>

</sec:authorize>


<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

