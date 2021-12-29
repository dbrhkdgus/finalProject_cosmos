<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/full_calendar/main.css" />
<script src='${pageContext.request.contextPath}/resources/css/full_calendar/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/moment.min.js'></script>


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
  .modal-body{
  	padding-left: 46px;
  }

</style>

<div class="main-container">
  <div id='calendar'></div>
</div>

<!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel">일정을 입력하세요</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                <form name="insertSchedule" action="${pageContext.request.contextPath}/gw/calendar/insertSchedule.do">
                    <div class="form-group">
                    <div class="float-right">
                    	<input type="radio" name="category" id="privateCategory"value="P" /><label for="privateCategory">개인 일정</label>&nbsp &nbsp 
                    	<input type="radio" name="category" id="groupCategory" value="G" checked/><label for="groupCategory">모임 일정</label>
                    </div>
                    <br />
                        <label for="taskId" class="col-form-label">일정 제목</label>
                        <input type="text" class="form-control col-11" id="title" name="title">
	                        <label for="taskId" class="col-form-label  ">시작 날짜&nbsp &nbsp 
                       		<input type="checkbox" name="allDay"  id="allDay" value="T"/>
                        	<label for="allDay" style="margin: 0px;"><span style="font-size: 10px">하루종일</span></label>
	                        </label>
                        <div class="">
	                        <input type="date" class="form-control col-6 d-inline" id="start_date" name="start_date">
	                        <input type="time" class="form-control col-5 d-inline" id="start_time" name="start_time" value="00:00">
                        </div>
	                        <label for="taskId" class="col-form-label  ">종료 날짜</label><br />
                        <div class="">
	                        <input type="date" class="form-control col-6 d-inline" id="end_date" name="end_date">
	                        <input type="time" class="form-control col-5 d-inline" id="end_time" name="end_time" value="00:00">
						</div>
						<br />
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <textarea class="form-control col-11" id="content" name="content"></textarea>
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
                <!-- 접속자 아이디 전달 -->
				<input type="hidden" name="loginMember" value="${loginMember.id}" id="memberId" />
				<input type="hidden" name="groupNo" value="" id="groupNo"/>
                </form>
    
            </div>
        </div>
    </div>

<script>
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



//일정 추가

//URL 속 groupNo 활용하기
function get_query(){ 
	var url = document.location.href; 
	var qs = url.substring(url.indexOf('?') + 1).split('&'); 
	for(var i = 0, result = {}; i < qs.length; i++){ 
		qs[i] = qs[i].split('='); 
		result[qs[i][0]] = decodeURIComponent(qs[i][1]); 
	} 
	return result;
}
var result = get_query();
console.log(result.groupNo);
$(groupNo).val(result.groupNo);


/* $(allDay).change((e)=>{
	if($(allDay).is(":checked")){
		alert("체크");
		$(calendar_start_time).attr("disabled", true);
		$(calendar_end_time).attr("disabled", true);
	}else{
		alert("체크해제");
		$(calendar_start_time).attr("disabled", false);
		$(calendar_end_time).attr("disabled", false);
	}
}) */

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
  var start_date = document.getElementById('start_date').value;
  var end_date = document.getElementById('end_date').value;
  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prevYear,prev,next,nextYear today',
      center: 'title',
      right: 'dayGridMonth,dayGridWeek,dayGridDay'
    },
    footerToolbar: {
    	right: 'addEventButton'
    },
    /* 버튼관련 */
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


    /* 버튼관련 종료 */
    /* initialDate: '2021-12-12', */
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events
    events: [
      {
        title: 'All Day',
        start: '2021-12-01T16:00:00',
        allDay: 'true'
      },
      {
        title: 'Long Event',
        start: '2021-12-07',
        end: '2021-12-10'
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2021-12-09T16:00:00',
        end: '2021-12-12T16:00:00'
        
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2021-12-16T16:00:00'
      },
      {
    	title : "초록색 배경 & 주황색 테두리",
    	backgroundColor : "#008000",
    	borderColor : "#FF4500",
        start: '2021-12-11',
        end: '2021-12-13'
      },
      {
        title: 'Meeting',
        start: '2021-12-12T10:30:00',
        end: '2021-12-12T12:30:00'
      },
      {
        title: 'Lunch',
        start: '2021-12-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2021-12-12T14:30:00'
      },
      {
        title: 'Happy Hour',
        start: '2021-12-12T17:30:00'
      },
      {
        title: 'Dinner',
        start: '2021-12-12T20:00:00'
      },
      {
        title: 'Birthday Party',
        start: '2021-12-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2021-12-28'
      },
      {
          title: 'naver.com',
          start: '2021-12-29 08:00'
        }
    ]
  });

  calendar.render();
});

</script>

<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

