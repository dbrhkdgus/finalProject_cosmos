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
    
 <!-- 통계 script -->
<script>  
	    var memberId ="";   		
		var memberIdList = new Array();
		var list = new Array();
		<c:forEach items="${acceptApplocationGroupList}" var="item1">
			<c:forEach items="${chartIdNickNameList}" var="item2">
				<c:if test="${item1.memberId eq item2.id}">	
					list.push("${item2.nickName}");
				</c:if>			
			</c:forEach>
		</c:forEach>
		for(var i=0; i < list.length; i++){
				list[i]
		}
		list.push("엑스트라1");
		list.push("엑스트라2");
		
		
		var colors = [ 'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(201, 203, 207, 0.2)'];
		
		var bgColors = [];
		for (var i = 0; i < list.length; i++) {
		  bgColors.push(colors[i % colors.length]);  
		}
		
</script> 
  <script>
    var context = document.getElementById('activityChart');
    var chart1 = new Chart(context, {
      type: 'line',
      data: {
        labels: ['1월','2월','3월','4월','5월','6월'],
        datasets: [{ 
            data: [0,10,20,30,40,50],
            label: "전체 TDL",
            borderColor: 'rgb(255, 99, 132)',
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderWidth:1,
            fill: false
          }, { 
            data: [50,40,30,20,10,0],
            label: "달성 TDL",
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
        labels: list,
        datasets: [{
          axis: 'y',
          label: '12월 목표달성률',
          data: [10, 20, 30, 40, 50, 60, 70 ,80,70,60],
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
              max: 100,
              beginAtZero: true
            }
          }]
        },
      }
    });
  </script>

<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>