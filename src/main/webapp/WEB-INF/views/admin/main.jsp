<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/ad_header.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>

<!-- chart.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">어서오세요, <b>[Admin]</b> 관리자님</p>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                        <h2 class="tm-block-title">
                            회원 통계
                            <a href="${pageContext.request.contextPath}/admin/StatisticsOfMember.do">
                                <span id="seeMore" class="tm-text-color-secondary"> > 더 보기</span>
                            </a>                            
                        </h2>
                        <canvas class="chart-size col-12" id="activityChart" ></canvas>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                        <h2 class="tm-block-title">
                            매출(지난달, 지지난달 등)
                            <a href="#">
                                <span id="seeMore" class="tm-text-color-secondary"> > 더 보기</span>
                            </a>                            
                        </h2>
                        <canvas id="barChart"></canvas>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller">
                        <h2 class="tm-block-title">
                            월간 모임 별 최근 게시글 수
                            <a href="${pageContext.request.contextPath}/admin/StatisticsOfGroup.do">
                                <span id="seeMore" class="tm-text-color-secondary"> > 더 보기</span>
                            </a>                            
                        </h2>
                        <div id="pieChartContainer">
                            <canvas id="pieChart" class="chartjs-render-monitor" width="200" height="200"></canvas>
                        </div>                        
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                        <h2 class="tm-block-title">
                            문의사항
                            <a href="${pageContext.request.contextPath}/admin/QnA.do">
                                <span id="seeMore" class="tm-text-color-secondary"> > 더 보기</span>
                            </a>
                        </h2>
                        <div class="tm-notification-items">
                        	<!-- 문의사항 목록 호출 -->
                        	<c:forEach items="${questionList}" var="question">
                            <div class="media tm-notification-item">
                                <div class="tm-gray-circle"><img src="img/notification-01.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                <div class="media-body">
                                    <p class="mb-2"><b>문의번호 ${question.queNo}&nbsp&nbsp</b> 
                                        <a href="#" class="tm-notification-link">[${question.queCategory}]</a></p>
                                    <p class="mb-2">${question.queTitle}</p>
                                    <span class="tm-small tm-text-color-secondary">작성자: ${question.memberId} / 작성일: <fmt:formatDate value="${question.regDate}" pattern="yyyy-MM-dd"/> </span>
                                </div>
                            </div>
                        	</c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">그룹 리스트(생성순으로)</h2>
                        <table class="table text-center">
                            <thead>
                                <tr>
                                    <th scope="col">모임 번호</th>
                                    <th scope="col">카테고리 명</th>
                                    <th scope="col">모임명</th>
                                    <th scope="col">생성일</th>
                                    <th scope="col">프리미엄</th>
                                    <th scope="col">장소</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="group" items="${groupList}">
                                <tr>
                                    <th scope="row"><b>${group.groupNo}</b></th>
                                    <!-- 키값으로 group.categoryNo를 사용해서 카테고리명을 꺼내온다. -->
                                    <td>${categoryOneMap[group.categoryNo]}</td>
                                    <td><b>${group.groupName }</b></td>
                                    <td><b><fmt:formatDate value="${group.groupEnrollDate}" pattern="yyyy-MM-dd"/></b></td>
                                    <td><b>${group.groupCharge }</b></td>
                                    <td>${group.groupLocation}</td>
                                </tr>
                            	</c:forEach>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
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
			        text: '주간 가입자 수',
			        fontColor: "white"
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