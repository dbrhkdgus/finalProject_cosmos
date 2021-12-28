<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/full_calendar/main.css" />
<script src='${pageContext.request.contextPath}/resources/css/full_calendar/main.js'></script>

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
                    <div class="form-group">
                    <div class="float-right">
                    	<input type="radio" name="category" id="privateCategory"value="P"/><label for="privateCategory">개인 일정</label>&nbsp &nbsp 
                    	<input type="radio" name="category" id="groupCategory" value="G"/><label for="groupCategory">모임 일정</label>
                    </div>
                    <br />
                        <label for="taskId" class="col-form-label">일정 제목</label>
                        <input type="text" class="form-control col-11" id="calendar_title" name="calendar_title">
	                        <label for="taskId" class="col-form-label  ">시작 날짜&nbsp &nbsp 
                       		<input type="checkbox" class="" name="allDay"  id="allDay"/>
                        	<label for="allDay" style="margin: 0px;"><span style="font-size: 10px">하루종일</span></label>
	                        </label>
                        <div class="">
	                        <input type="date" class="form-control col-6 d-inline" id="calendar_start_date" name="calendar_start_date">
	                        <input type="time" class="form-control col-5 d-inline" id="calendar_start_time" name="calendar_start_time">	                        
                        </div>
	                        <label for="taskId" class="col-form-label  ">종료 날짜</label><br />
                        <div class="">
	                        <input type="date" class="form-control col-6 d-inline" id="calendar_end_date" name="calendar_end_date">
	                        <input type="time" class="form-control col-5 d-inline" id="calendar_end_time" name="calendar_end_time">
						</div>
						<br />
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <textarea class="form-control col-11" id="calendar_content" name="calendar_content"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
        </div>
    </div>






<script>
$(allDay).change((e)=>{
	if($(allDay).is(":checked")){
		alert("체크");
		$(calendar_start_time).attr("disabled", true);
		$(calendar_end_time).attr("disabled", true);
	}else{
		alert("체크해제");
		$(calendar_start_time).attr("disabled", false);
		$(calendar_end_time).attr("disabled", false);
	}
})

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

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
                            	var title = $("#calendar_title").val();
                                var start_date = $("#calendar_start_date").val();
                                var end_date = $("#calendar_end_date").val();
                                var start_time = $("#calendar_start_time").val()
                                var end_time = $("#calendar_end_time").val()
                                var content = $("#calendar_content").val();
                                var allDay = $("#allDay").val();
                                var category = $("category").val();
                                
                                //내용 입력 여부 확인
                                if(content == null || content == ""){
                                    alert("내용을 입력하세요.");
                                }else if(start_date == "" || end_date ==""){
                                    alert("날짜를 입력하세요.");
                                }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                    alert("종료일이 시작일보다 먼저입니다.");
                                }else{ // 정상적인 입력 시
                                    var obj = {
                                        "title" : title,
                                        "content" : content,
                                        "start_date" : start_date,
                                        "start_time" : start_time,
                                        "end_date" : end_date,
                                        "end_time" : end_time,
                                        "allDay" : allDay,
                                        "category" : category
                                    }//전송할 객체 생성
                        			$.ajax({
                        				url: `${pageContext.request.contextPath}/gw/calendar/selectScheduleList.do`,
                        				data: obj,
                        				dataType: "json",
                        				success: function(data){
                        					console.log(data);
                        				},
                        				error: console.log
                        			})

                                    console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                                }
                            });
                        }
                    }//end addEventButton
                },//end customButtons


    /* 버튼관련 종료 */
    initialDate: '2020-09-12',
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events
    events: [
      {
        title: 'All Day',
        start: '2020-09-01T16:00:00',
        allDay: 'true'
      },
      {
        title: 'Long Event',
        start: '2020-09-07',
        end: '2020-09-10'
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2020-09-09T16:00:00',
        end: '2020-09-12T16:00:00'
        
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2020-09-16T16:00:00'
      },
      {
    	title : "초록색 배경 & 주황색 테두리",
    	backgroundColor : "#008000",
    	borderColor : "#FF4500",
        start: '2020-09-11',
        end: '2020-09-13'
      },
      {
        title: 'Meeting',
        start: '2020-09-12T10:30:00',
        end: '2020-09-12T12:30:00'
      },
      {
        title: 'Lunch',
        start: '2020-09-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2020-09-12T14:30:00'
      },
      {
        title: 'Happy Hour',
        start: '2020-09-12T17:30:00'
      },
      {
        title: 'Dinner',
        start: '2020-09-12T20:00:00'
      },
      {
        title: 'Birthday Party',
        start: '2020-09-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2020-09-28'
      }
    ]
  });

  calendar.render();
});

</script>

<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

