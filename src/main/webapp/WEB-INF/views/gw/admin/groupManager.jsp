<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
   <div class="workspace-box">

      <div class="study-admin-box">
        <div class="amount-of-study-activity">
          <h4>스터디 활동량</h4>
          <canvas class="chart-size" id="activityChart" width="900" height="500"></canvas>
        </div>
        

        <div class="goal-fulfillment-rate">
          <h4>목표 달성률</h4>
          <canvas id="goalChart" width="900" height="500"></canvas>
        </div>
      
      </div>
    </div>
 <!-- 통계 script -->
  <script>
    var context = document.getElementById('activityChart');
    var chart1 = new Chart(context, {
      type: 'line',
      data: {
        labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월', '12월'],
        datasets: [{ 
            data: [4000,3000,1000,1500,2000,2500,3000,3500,4000,4500,5000,5200],
            label: "신규글",
            borderColor: 'rgb(255, 99, 132)',
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderWidth:1,
            fill: false
          }, { 
            data: [500,1000,1500,1000,1500,2000,947,1402,3700,5267,8000,6000],
            label: "채팅량",
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
        labels: ['강구진', '김은희', '백지영', '유광현', '유지우', '이윤희', '이진표'],
        datasets: [{
          axis: 'y',
          label: '12월 목표달성률',
          data: [10, 20, 30, 40, 50, 60, 70],
          fill: false,
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(201, 203, 207, 0.2)'
          ],
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
