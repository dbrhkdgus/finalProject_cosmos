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
<style>
.profileDiv
{
  position: relative;
  width: 60px;
  height: 60px;
  border-radius: 50%; /*둥그런 원으로 만들기 위함*/
  overflow: hidden;
  
}
.profileDiv img
{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  
}
</style>


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
                    <div class="tm-bg-primary-dark tm-block tm-block-taller">
                        <h2 class="tm-block-title">
                            주간 새 게시글 순
                            <a href="${pageContext.request.contextPath}/admin/StatisticsOfGroup.do">
                                <span id="seeMore" class="tm-text-color-secondary"> > 더 보기</span>
                            </a>                            
                        </h2>
                        <div id="div_categoryChart2">
                            <canvas id="pie-chart2"></canvas>
                        </div>                        
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                        <h2 class="tm-block-title">
                            상위 카테고리별 모임
                            <a href="#">
                                <span id="seeMore" class="tm-text-color-secondary"> > 더 보기</span>
                            </a>                            
                        </h2>
                        <div id="div_categoryChart">
	                        <canvas id="pie-chart" height="200"></canvas>
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
                                <div class="tm-circle profileDiv mr-3">
                                <%-- <img src="${pageContext.request.contextPath}/resources/upFile/profile/defaultProfile.png" alt="" /> --%>
                                	<c:if test="${empty profileImg[question.memberId]}">
                               			<img src="${pageContext.request.contextPath}/resources/upFile/profile/defaultProfile.png" alt="" />
									</c:if>
                                	<c:if test="${not empty profileImg[question.memberId]}">
                                		<c:if test="${fn:contains(profileImg[question.memberId],'http')}">
		                                	<img id="header-profile" src="${profileImg[question.memberId]}" class="rounded-circle">
                                		</c:if>
                                		<c:if test="${! fn:contains(profileImg[question.memberId],'http')}">
		                                	<img id="header-profile" src="${pageContext.request.contextPath}/resources/upFile/profile/${profileImg[question.memberId]}" class="rounded-circle">
                                		</c:if>
                                		<c:if test="${empty profileImg[question.memberId]}">
                                			<img src="${pageContext.request.contextPath}/resources/upFile/profile/defaultProfile.png" alt="" />
                                		</c:if>

                                	</c:if>
                               	</div>
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
                        <h2 class="tm-block-title">그룹 리스트(등록순)</h2>
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
let today;
let today1;
let today2;
let today3;
let today4;
let today5;
let today6;
let today7;
let now = new Date();
let month = now.getMonth()+1;
let date = now.getDate();

(()=>{
	//회원 통계
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
		complete: 
			
			function(){
			/* 데이터를 불러왔다면 그래프에 데이터 담기 */
			var context = document.getElementById('activityChart');
			
			//날짜 변환 함수 (ex: 12/31)
			const formatDate = (date)=>{
			  let formatted_date = (date.getMonth() + 1) + "/" + date.getDate()
			   return formatted_date;
			}
			
			let _sevenDaysToday = new Date();
			let _sevenDaysToday_1 = new Date(_sevenDaysToday);
			let _sevenDaysToday_2 = new Date(_sevenDaysToday);
			let _sevenDaysToday_3 = new Date(_sevenDaysToday);
			let _sevenDaysToday_4 = new Date(_sevenDaysToday);
			let _sevenDaysToday_5 = new Date(_sevenDaysToday);
			let _sevenDaysToday_6 = new Date(_sevenDaysToday);
			
			_sevenDaysToday_1.setDate(_sevenDaysToday.getDate()-1);
			_sevenDaysToday_2.setDate(_sevenDaysToday.getDate()-2);
			_sevenDaysToday_3.setDate(_sevenDaysToday.getDate()-3);
			_sevenDaysToday_4.setDate(_sevenDaysToday.getDate()-4);
			_sevenDaysToday_5.setDate(_sevenDaysToday.getDate()-5);
			_sevenDaysToday_6.setDate(_sevenDaysToday.getDate()-6);
			
			var chart1 = new Chart(context, {
			    type: 'line',
			    data: {
			      labels: [formatDate(_sevenDaysToday_6),formatDate(_sevenDaysToday_5),formatDate(_sevenDaysToday_4),formatDate(_sevenDaysToday_3),formatDate(_sevenDaysToday_2),formatDate(_sevenDaysToday_1),formatDate(_sevenDaysToday)],
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
	
	//상위 카테고리별 모임 순
		$.ajax({
		url: `${pageContext.request.contextPath}/admin/statisticsCategory`,
		dataType: "json",
		success(data){
			console.log(data);
			//기존 차트 제거
			let labels = [];
			let counts = [];
			for(i = 0; i < data.list.length; i++){
				labels.push(data.list[i]["column"]);
				counts.push(data.list[i]["count"]);
			}

			config = {
				    type: 'pie',
				    data: {
				      labels: labels,
				      datasets: [{
				        label: "Population (millions)",
				        backgroundColor: ["#EFC7D6","#BDE4D7", "#CCE2EE","#FACDCA","#F3E3AE","#D8DCEB","#E2D9E7"],
				        data: counts
				      }]
				    },
				    options: {
				      title: {
				        display: true,
				        text: '카테고리 별 모임 수',
				        fontColor: 'white',
				        fontSize: 13
				      }, 
				      legend: {
				    	  labels: {
				    		  fontColor: "white",
				    		  fontSize: 12
				    	  }
				      },
				    }
				};
			let barctxx = document.getElementById('pie-chart').getContext('2d');
			let newBarChart = new Chart(barctxx,config);
		},
		error: console.log
	})
	
	//주간 새 게시글 순
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/countOfnewPostInThisWeekList`,
		dataType: "json",
		success(data){
			console.log(data);
			console.log(data.countOfnewPostInThisWeekList);
			
			
			
			let labels = [];
			let counts = [];
			for(i = 0; i < data.countOfnewPostInThisWeekList.length; i++){
				labels.push(data.countOfnewPostInThisWeekList[i]["column"]);
				counts.push(data.countOfnewPostInThisWeekList[i]["count"]);
			}
			console.log('labels : '+labels);
			console.log('counts : '+counts);

			config = {
				    type: 'pie',
				    data: {
				      labels: labels,
				      datasets: [{
				        label: "Population (millions)",
				        backgroundColor: ["#EFC7D6","#BDE4D7", "#CCE2EE","#FACDCA","#F3E3AE","#D8DCEB","#E2D9E7"],
				        data: counts
				      }]
				    },
				    options: {
				      title: {
				        display: true,
				        text: '주간 새 게시글 순',
				        fontColor: 'white',
				        fontSize: 13
				      }, 
				      legend: {
				    	  labels: {
				    		  fontColor: "white",
				    		  fontSize: 12
				    	  }
				      },
				    }
				};
			let barctxx2 = document.getElementById('pie-chart2').getContext('2d');
			let newBarChart2 = new Chart(barctxx2,config);
		},
		error: console.log
	})
})()

  
</script>  


<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>