<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>

<!-- chart.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<jsp:include page="/WEB-INF/views/common/ad_header.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>

   <div class="container mt-5">

      <div class="study-admin-box">
        <div class="amount-of-study-activity">
          <h4 class="text-white">스터디 활동량</h4>
          <canvas class="chart-size" id="activityChart" width="400" height="400"></canvas>
        </div>
        
      
      </div>
    </div>
<!-- 통계 script -->
<script>

/* 페이지 랜딩시 기본으로 불러올 최근 7일간 가입자수 */

/* 7일 데이터 담을 변수 선언 */
var today;
var today1;
var today2;
var today3;
var today4;
var today5;
var today6;
var today7;
var now = new Date();
var month = now.getMonth()+1;
var date = now.getDate();


(()=>{

	
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/thisWeekEnrollMember.do`,
		dataType: "json",
		success: function(data){
			console.log(data);

			today = data.sevenDaysData['today'];
			today1 = data.sevenDaysData['today1'];
			today2 = data.sevenDaysData['today2'];
			today3 = data.sevenDaysData['today3'];
			today4 = data.sevenDaysData['today4'];
			today5 = data.sevenDaysData['today5'];
			today6 = data.sevenDaysData['today6'];
		},
		error: console.log,
		complete: function(){
			/* 데이터를 불러왔다면 그래프에 데이터 담기 */
			  var context = document.getElementById('activityChart');
			  
			  var chart1 = new Chart(context, {
			    type: 'line',
			    data: {
			      labels: [month+'/'+(date-6), month+'/'+(date-5), month+'/'+(date-4), month+'/'+(date-3), month+'/'+(date-2), month+'/'+(date-1), month+'/'+date],
			      datasets: [{ 
			          data: [today6, today5, today4, today3, today2, today1, today],
			          label: "가입자 수",
			          borderColor: 'rgb(255, 99, 132)',
			          backgroundColor: 'rgba(255, 99, 132, 0.2)',
			          borderWidth:1,
			          fill: false
			        }
			        
			      ]
			    },
			    options: {
			      responsive: false,
			      title: {
			        display: true,
			        color: "white",
			        text: '주간 가입자 수'
			      },
			      legend: {
			    	  labels: {
			    		  fontColor: "white",
			    		  fontSize: 18
			    	  }
			      },
			      scales:{
			    	  xAxes: [{
			    		  ticks:{
			    			  /* x축 날짜 색깔 */
			    			  fontColor : "white"
			    		  }
			    	  }],
			    	  yAxes: [{
							ticks: {
								beginAtZero: true,
								/* stepSize : 2, */
								fontColor : "rgba(251, 203, 9, 1)",
								fontSize : 14,
							}
							/* 중간 경계선 설정	    	 
							,gridLines:{
								color: 'rgba(166, 201, 226, 1)',
								lineWidth:3
							} */
						}]
			      }
			    }
			  });
		}
	})
})()
  
</script>  

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>