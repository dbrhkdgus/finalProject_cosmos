<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/ad_header.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- chart.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>


<style>
  #searchKeyword{
    width: 75%; display: inline;
  }
  .selectBar{
    width: 20%;
  }
  .statisticsOf{
    color: white;
  }
  #chartList{
  	display: flex;
  	list-style-type: none;
  	justify-content: flex-end

  	
  }
  li{
  	margin-right: 0.3vw;
  	color: white;
  }
  a{
  	color: white;
  }
  #firstTap, #secondTap{
  	font-size: 12px;
  	font-weight: bold;
  }
  #firstTap, #secondTap:hover{
  	cursor: pointer;
  }

</style>

      <div class="container mt-5">
        <div class="col-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <h2 class="tm-block-title">모임 통계</h2>

            <div class="form-check mb-3">
             <table class="table text-center mb-4 ">
             	<thead class="">
             	<tr>
	             	<th style="border-right: solid #4E6175 1px">총 모임 수</th>
	             	<th>프리미엄 모임 수</th>
	             	<th>총 게시글 수</th>
	             	<th>이번 달 신규 모임 수</th>
             	</tr>
             	</thead>
             	<tbody>
             	<tr>
             		<td style="border-right: solid #4E6175 1px">${totalCountOfGroup.count }</td>
             		<td style="border-right: solid #4E6175 1px">${countOfPremiumGroup.count }</td>
             		<td style="border-right: solid #4E6175 1px">${countOfPost.count }</td>
             		<td>${countOfNewGroupInThisMonth.count }</td>
             	</tr>
             	</tbody>
             </table>
             
             <div class="row tm-content-row">
             	<div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
					<table class="table text-center">
		             	<thead>
		             	<tr>
			             	<th colspan="3">새 게시글 많은 모임(주간)</th>
		             	</tr>
		             	</thead>
		             	<tbody>
		             	<c:forEach items="${countOfnewPostInThisWeekList }" var="postGroup" varStatus="status">
		             		<tr>
		             			<td style="border-right: solid #4E6175 1px">${status.count }</td>
		             			<td style="border-right: solid #4E6175 1px">${postGroup.column}</td>
		             			<td style="border-right: solid #4E6175 1px">${postGroup.count }개</td>
		             		</tr>
		             	</c:forEach>
		             	<c:if test="${fn:length(countOfnewPostInThisWeekList) < 5}">
		             		<c:forEach var="i" begin="1" end="${5-fn:length(countOfnewPostInThisWeekList)}">
		             			<tr>
			             			<td style="border-right: solid #4E6175 1px">-</td>
			             			<td style="border-right: solid #4E6175 1px">-</td>
			             			<td style="border-right: solid #4E6175 1px">-</td>
		             			</tr>
		             		</c:forEach>
		             	</c:if>						
		             	</tbody>
		             </table>
             	</div>
             	<div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
					<table class="table text-center">
		             	<thead>
		             	<tr>
			             	<th colspan=3>좋아요 수 많은 모임</th>
		             	</tr>
		             	</thead>
		             	<tbody>
		             	<c:forEach items="${countOfGroupLikeList }" var="likeGroup" varStatus="status">
		             	<tr>
		             		<td style="border-right: solid #4E6175 1px">${status.count }</td>
		             		<td style="border-right: solid #4E6175 1px">${likeGroup.column}</td>
		             		<td style="border-right: solid #4E6175 1px">${likeGroup.count}</td>
		             	</tr>
		             	</c:forEach>
		             	<c:if test="${fn:length(countOfGroupLikeList) < 5}">
		             		<c:forEach var="i" begin="1" end="${5-fn:length(countOfGroupLikeList)}">
		             			<tr>
			             			<td>-</td>
			             			<td>-</td>
			             			<td>-</td>
		             			</tr>
		             		</c:forEach>
		             	</c:if>				             	
		             	</tbody>
		             </table>             	
             	</div>
             </div>
             

<!--               <label class="form-check-label mr-5 statisticsOf" for="flexRadioDefault1">리뷰 수</label>
              <br><br>
              <form action="#" name="dateSet" id="dateForm">
                <p class="text-white mt-3">- 기간 설정</p>
                <div class="form-group d-flex">
                  <input
                  id="startDate"
                  name="startDate"
                  type="date"
                  class="form-control validate col-5 mr-4"
                  value="2021-12-15"
                  />
                  <input
                  id="endDate"
                  name="endDate"
                type="date"
                class="form-control validate col-5 mr-3"
                value="2021-12-21"
              />
              <button class="btn btn-secondary" type="submit">검색</button>
            </div>
          </form> -->
            </div>
            
            <!-- 차트가 바뀌어야 함. include로 상황에 맞춰서  -->
          	<ul id="chartList">
          		<li id="firstTap">총 게시글&nbsp&nbsp|</li>
          		<li id="secondTap">카테고리</li>
          	</ul>
          <div id="div_chart">
	      	<canvas id="pie-chart" class="col-12"></canvas>
          </div>
            <div></div>
          <!--  -->
          </div>
          
        </div>

      </div>

<script>
console.log($("#pie-chart").parents("div"));

let labels = [];
let counts = [];
let chart = new Chart(document.getElementById("pie-chart"))
let config = {
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


(()=>{
	let totalCountOfPost_arr = [];
	let labels_arr = [];
	/* 남녀 성별 기본 데이터 불러오기 */
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/totalCountOfPost`,
		dataType: "json",
		success: function(data){
			for(i=0; i<data.length; i++){
				totalCountOfPost_arr.push(data[i].column);
				labels_arr.push(data[i].count);
			}
			console.log('totalCountOfPost_array: '+totalCountOfPost_arr);

		config = {};	
		config = {
			    type: 'pie',
			    data: {
			      labels: [],
			      datasets: [{
			        label: "",
			        backgroundColor: ["#EFC7D6","#BDE4D7", "#CCE2EE","#FACDCA","#F3E3AE","#D8DCEB","#E2D9E7"],
			        data: []
			      }]
			    },
			    options: {
			      title: {
			        display: true,
			        text: '총 게시글 많은 모임 순',
			        fontColor: 'white',
			        fontSize: 13
			      }, 
			      legend: {
			    	  labels: {
			    		  fontColor: "white",
			    		  fontSize: 12
			    	  }
			      }
			    }
			};
			config.data.labels = totalCountOfPost_arr;
			config.data.datasets[0].data = labels_arr;
			
			new Chart(document.getElementById("pie-chart"),config);
			
		},
		error: console.log
	});
})()

//총 게시글 Tab 클릭시
$("#secondTap").click((e)=>{
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/statisticsCategory`,
		dataType: "json",
		success(data){
			console.log(data);
			console.log(data.list[0]["column"]);
			console.log(data.list.length);
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
			
			$("#pie-chart").remove();
			$("#div_chart").append('<canvas id="pie-chart" class="col-12"></canvas>');
			new Chart(document.getElementById("pie-chart"),config);

		},
		error: console.log
	})
})

//총 게시글 Tab 클릭시
$("#firstTap").click((e)=>{
	let totalCountOfPost_arr = [];
	let labels_arr = [];
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/totalCountOfPost`,
		dataType: "json",
		success: function(data){
			for(i=0; i<data.length; i++){
				totalCountOfPost_arr.push(data[i].column);
				labels_arr.push(data[i].count);
			}
			console.log('totalCountOfPost_array: '+totalCountOfPost_arr);


			$("#pie-chart").remove();
			$("#div_chart").append('<canvas id="pie-chart" class="col-12"></canvas>');
			
			config = {
				    type: 'pie',
				    data: {
				      labels: [],
				      datasets: [{
				        label: "",
				        backgroundColor: ["#EFC7D6","#BDE4D7", "#CCE2EE","#FACDCA","#F3E3AE","#D8DCEB","#E2D9E7"],
				        data: []
				      }]
				    },
				    options: {
				      title: {
				        display: true,
				        text: '총 게시글 많은 모임 순',
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
			
			config.data.labels = totalCountOfPost_arr;
			config.data.datasets[0].data = labels_arr;
			
			new Chart(document.getElementById("pie-chart"),config);
			
		},
		error: console.log
	});
})

//
$("#secondTap").click((e)=>{
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/statisticsCategory`,
		dataType: "json",
		success(data){
			console.log(data);
			//기존 차트 제거
			$("#pie-chart").remove();

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
			$('#div_chart').html('<canvas id="pie-chart" class="col-12"></canvas>'); 
			let barctxx = document.getElementById('pie-chart').getContext('2d');
			let newBarChart = new Chart(barctxx,config);
		},
		error: console.log
	})
})
</script>

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>