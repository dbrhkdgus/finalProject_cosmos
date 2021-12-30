<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember" />
</sec:authorize>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/full_calendar/main.css" />
<script
	src='${pageContext.request.contextPath}/resources/css/full_calendar/main.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/js/moment.min.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/css/full_calendar/locales/ko.js'></script>


<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.modal-body {
	padding-left: 46px;
}
#detailDeleteBtn{
	margin: auto;
}
#p_detailStart, #p_detailEnd{
	text-align: right;
	margin-bottom: 1px;
	color: gray;
	font-style: italic;
	font-size: 10px;
	margin-right: 10px;
}
#detail-modal-header,#detail-modal-footer{
	border: 0 none;
}
#detail-modal-body{
	padding: 16px;
}
</style>

<div class="main-container">
	${scheduleList}
	<div id='calendar'></div>
</div>
<input type="hidden" id="_groupNo" value="${groupNo}" />


<!-- modal 추가 -->
<div class="modal" id="calendarModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h6 class="modal-title" id="exampleModalLabel">일정을 입력하세요</h6>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form name="insertSchedule"
					action="${pageContext.request.contextPath}/gw/calendar/insertSchedule.do">
					<div class="form-group">
						<div class="float-right">
							<input type="radio" name="category" id="privateCategory"
								value="P" /><label for="privateCategory">개인 일정</label>&nbsp
							&nbsp <input type="radio" name="category" id="groupCategory"
								value="G" checked /><label for="groupCategory">모임 일정</label>
						</div>
						<br /> <label for="taskId" class="col-form-label">일정 제목</label> <input
							type="text" class="form-control col-11" id="title" name="title">
						<label for="taskId" class="col-form-label  ">시작 날짜&nbsp
							&nbsp <input type="checkbox" name="allDay" id="allDay" value="T" />
							<label for="allDay" style="margin: 0px;"><span
								style="font-size: 10px">하루종일</span></label>
						</label>
						<div class="">
							<input type="date" class="form-control col-6 d-inline"
								id="start_date" name="start_date"> <input type="time"
								class="form-control col-5 d-inline" id="start_time"
								name="start_time" value="00:00">
						</div>
						<label for="taskId" class="col-form-label  ">종료 날짜</label><br />
						<div class="">
							<input type="date" class="form-control col-6 d-inline"
								id="end_date" name="end_date"> <input type="time"
								class="form-control col-5 d-inline" id="end_time"
								name="end_time" value="00:00">
						</div>
						<br /> <label for="taskId" class="col-form-label">일정 내용</label>
						<textarea class="form-control col-11" id="content" name="content"></textarea>

					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" id="addCalendar">추가</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>

			</div>
			<!-- 접속자 아이디 전달 -->
			<input type="hidden" name="loginMember" value="${loginMember.id}" id="memberId" /> 
			<input type="hidden" name="groupNo"	value="${groupNo}" id="groupNo" />
			</form>

		</div>
	</div>
</div>

<!-- 상세 일정 모달 -->
<div class="modal fade" id="detailSchedule" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm modal-dialog-centered"
		role="document">
		<div class="modal-content" style="background-color: #fff8bc;">
			<div class="modal-header" id="detail-modal-header">
				<h5 class="modal-title" id="detailTitle">제목입니다</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div>
				<p id="p_detailStart">- 시작일시: <span id="detailStart"></span></p>	
				<p id="p_detailEnd">- 종료일시: <span id="detailEnd"></span></p>	
			</div>
			<div class="modal-body" id="detail-modal-body">
				<br />
				<p id="detailContent"></p>
			</div>
			<form name="deleteForm" action="${pageContext.request.contextPath}/gw/calendar/deleteSchedule">
				<input id="detail-modal-shceduleNo" type="hidden" name="scheduleNo" value=""/>
				<input type="hidden" name="groupNo"	value="${groupNo}" />
			</form>
			<div class="modal-footer" id="detail-modal-footer">
				<button id="detailDeleteBtn" type="button" class="btn btn-secondary">삭제</button>
			</div>
		</div>
	</div>
</div>

<script>
var loginMember = `${loginMember.id}`;

//하루종일 옵션을 선택하면 시간을 선택할 수 없다
$("#allDay").change((e)=>{
    if($("#allDay").is(":checked")){
		$("#start_time").prop('readonly', true);
		$("#end_time").prop('readonly', true);
		$("#allDay").val('T');
    }else{
		$("#start_time").prop('readonly', false);
		$("#end_time").prop('readonly', false);
		$("#allDay").val('F');
    }
})


//캘린더 관련 시작
document.addEventListener('DOMContentLoaded', function() {
	
	
  var calendarEl = document.getElementById('calendar');
  var start_date = document.getElementById('start_date').value;
  var end_date = document.getElementById('end_date').value;
  var groupNo = $("#_groupNo").val();
  console.log("aaaa"+groupNo);
  

  
  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prevYear,prev,next,nextYear today',
      center: 'title',
      right: 'dayGridMonth,dayGridWeek,dayGridDay'
    },
    footerToolbar: {
    	right: 'addEventButton'
    },
    /* customButtons 버튼관련 */
    customButtons: {
                    addEventButton: { // 추가한 버튼 설정
                        text : "일정 추가",  // 버튼 내용
                        click : function(){ // 버튼 클릭 시 이벤트 추가
                            $("#calendarModal").modal("show"); // modal 나타내기

                            $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시

								var start_date= $("#start_date").val();
								var end_date = $("#end_date").val();
								var start_time = $("#start_time").val();
								var end_time = $("#end_time").val();
								var allDay = $("#allDay").val();
								
                                //내용 입력 여부 확인
                                if($("#title").val() == null || $("#title").val() == ""){
                                    alert("제목을 입력하세요.");                                	
                                }
                                else if($("#content").val() == null || $("#content").val() == ""){
                                    alert("내용을 입력하세요.");
                                }else if($("#start_date").val() == "" || $("#end_date").val() ==""){
                                    alert("날짜를 입력하세요.");
                                }else if(end_date- start_date < 0){ // 시작날짜 종료날짜 올바른지 확인
                                    alert("종료일이 시작일보다 먼저입니다.");
                                }else if(end_date == start_date){ // 시작시간 종료시간 올바른지 확인
                                	if(end_time - start_time < 0){
                                		alert("종료시간이 시작시간보다 먼저입니다.");
                                	}                                
                        			$(insertSchedule).submit();
                                }else{ // 정상적인 입력 시
                                	
                        			$(insertSchedule).submit();
                                }
                            });
                        }
                    }//end addEventButton

                },//end customButtons
	
               

    /* initialDate: '2021-12-12', */
    navLinks: true, // can click day/week names to navigate views
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
						console.log("result[i]['allDay'] = ", result[i]['allDay']);
						calendar.addEvent({
							title: result[i]['title'],
							start: result[i]['startDate'],
							end: result[i]['endDate'],
							allDay : result[i]['allDay']== 'T'? true : false,
							color: result[i]['category'] == 'G'? "blue" : "gray",
							content: result[i]['content'],
							writer: result[i]['memberId'],
							scheduleNo: result[i]['scheduleNo']
						})
					}
				},
				error: console.log
			})
	
		],
		//일정 클릭시 상세 일정이 (포스트잇 모양의) 모달 페이지에 표시된다
		eventClick : function(info){
			//기존 모달 숨기기
			$(".fc-popover").css('display', 'none');
			//상세 페이지 모달 띄우기
			$("#detailSchedule").modal("show");
			
			var eventObj = info.event;
			console.log(eventObj);
			console.log(eventObj.extendedProps.content);
			
			
			
			let date = new Date();
			function dateFormat(date) {
		        let month = date.getMonth() + 1;
		        let day = date.getDate();
		        let hour = date.getHours();
		        let minute = date.getMinutes();
		        let second = date.getSeconds();

		        month = month >= 10 ? month : '0' + month;
		        day = day >= 10 ? day : '0' + day;
		        hour = hour >= 10 ? hour : '0' + hour;
		        minute = minute >= 10 ? minute : '0' + minute;
		        second = second >= 10 ? second : '0' + second;

		        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
			}
			
			/* 시작일시, 종료일시 format 변경하기 위한 과정 */
			
			console.log(typeof(eventObj.start));
			//JSON 객체 String 타입으로 형 변환
			console.log(typeof(JSON.stringify(eventObj.start)));
			//데이트 타입으로 형변환
			var detailStartDateForm = new Date(eventObj.start);
			var detailEndDateForm = new Date(eventObj.end);
			
			//console.log("typeof: "+typeof(detailStartDateForm_direct));
			//console.log(detailStartDateForm.getMonth)
			
			function dateFormat(date) {
		        let month = date.getMonth() + 1;
		        let day = date.getDate();
		        let hour = date.getHours();
		        let minute = date.getMinutes();
		        let second = date.getSeconds();

		        month = month >= 10 ? month : '0' + month;
		        day = day >= 10 ? day : '0' + day;
		        hour = hour >= 10 ? hour : '0' + hour;
		        minute = minute >= 10 ? minute : '0' + minute;

		        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
			}

			//console.log('변환값= '+ dateFormat(detailStartDateForm));
			//console.log('종료일' + document.querySelector("#detailEnd").innerText);
			
			//detail modal 값 채우기
			$("#detailTitle").text(eventObj.title);
			$("#detailStart").text(dateFormat(detailStartDateForm));
			$("#detailEnd").text(dateFormat(detailEndDateForm));
			$("#detailContent").text(eventObj.extendedProps.content).css('font-style','italic');
			console.log("--------------------------------")
			console.log(loginMember == eventObj.extendedProps.writer);
			console.log(loginMember);
			console.log(typeof(loginMember));
			console.log(eventObj.extendedProps.writer);
			console.log(typeof(eventObj.extendedProps.writer));
 			if(loginMember != eventObj.extendedProps.writer){
				$("#detailDeleteBtn").css('display', 'none');				
			}else{
				$("#detailDeleteBtn").css('display', 'block');				
			}
 			console.log(eventObj.extendedProps.scheduleNo);
 			console.log(typeof(eventObj.extendedProps.scheduleNo));
 			$("#detail-modal-shceduleNo").val(eventObj.extendedProps.scheduleNo);
		}
  });

  calendar.render();
});
//일정 삭제 
$("#detailDeleteBtn").click((e)=>{
	if(confirm("일정을 삭제하시겠습니까?") == true){
		$(deleteForm).submit();
	}
})

</script>

<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

