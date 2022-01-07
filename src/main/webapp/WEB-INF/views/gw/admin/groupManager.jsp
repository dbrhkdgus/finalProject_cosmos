<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MANAGER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">

<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>

 <div class="workspace-box">
  
      <div class="study-admin-box">
        <div class="amount-of-study-activity">
          <h4>To do List 6 Month</h4>
          <canvas class="chart-size" id="activityChart" width="900" height="500"></canvas>
        </div>
        

        <div class="goal-fulfillment-rate">
          <h4>To do List 1 Month</h4>
          <canvas id="goalChart" width="900" height="500"></canvas>
        </div>
      
      </div>
    </div>
    
 <!-- 통계 script !!-->
<script>  
	    var memberId ="";   		
		var memberIdList = new Array();
		var nickList = new Array(); //닉네임
		var nickTdlList = new Array(); //닉네임당 체크한 tdl
		var nameCount = 0;
		var monthList = new Array();  //달 수 
		var monthCountList= new Array();// 달마다 count
		var avgMonthCountList= new Array();// 달마다 count
	
		
		<c:forEach items="${checkedToDoList}" var="checkedToDoList">
			<c:forEach items="${chartIdNickNameList}" var="chartIdNickNameList">
				<c:if test="${checkedToDoList.memberId eq chartIdNickNameList.id}">	
					nickList.push("${chartIdNickNameList.nickName}");
					nickTdlList.push("${checkedToDoList.count}");
				</c:if>
			</c:forEach>
		</c:forEach>
		
		<c:forEach items="${tdlHalfYearTotalltList}" var="tdlHalfYearTotalltList">
			monthList.push("${tdlHalfYearTotalltList.Month} ");
			monthCountList.push("${tdlHalfYearTotalltList.totalAvg}");
		</c:forEach>
		
		
		
		
		
		<c:forEach items="${totalTdlAvgltList}" var="avgList">
			avgMonthCountList.push(${avgList.avg});
		</c:forEach>
		
		
		var colors = [ 'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(201, 203, 207, 0.2)'];
		
		
		
		
		var bgColors = [];
		for (var i = 0; i < nickList.length; i++) {
		  bgColors.push(colors[i % colors.length]);  
		}
	
		
</script> 
  <script>
    var context = document.getElementById('activityChart');
    var chart1 = new Chart(context, {
      type: 'line',
      data: {
        labels: monthList,
        datasets: [{ 
            data: monthCountList,
            label: "전체 TDL",
            borderColor: 'rgb(255, 99, 132)',
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderWidth:1,
            fill: false
          }, { 
            data:avgMonthCountList,
            label: "월별 달성한 평균 TDL",
            borderColor: 'rgb(54, 162, 235)',
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderWidth:1,
            fill: false
          }, 
          
        ]
      },
      options: {
        responsive: false,
        title: {
          display: true,
          text: '월별 스터디 활동량'
        }
      }
    });
    
   
    
    
    var ctx = document.getElementById('goalChart');
    var chart2 = new Chart(ctx, {
      type: 'horizontalBar',
      data: {
        indexAxis: 'y',
        labels: nickList,
        datasets: [{
          axis: 'y',
          label: '12월 목표달성률',
          data: nickTdlList,
          fill: false,
          backgroundColor:bgColors,

          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(255, 159, 64, 1)',
            'rgba(255, 205, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(201, 203, 207, 1)'
          ],

          borderWidth: 1
        }]
      },
      options: {
        responsive: false, 
        scales: {
          xAxes: [{
            ticks: {
              max: 30,
              beginAtZero: true
            }
          }]
        },
      }
    });
  </script>
<script>
window.addEventListener("load", function(){
	$("#dropdownAdmin").removeClass("collapsed");
	$("#account-collapse").addClass("show");
	});
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
</sec:authorize>