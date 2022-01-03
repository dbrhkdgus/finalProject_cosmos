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

<style>
.fa-chevron-left, .fa-chevron-right{
	cursor: pointer;
}
</style>

   <div class="container mt-5">
    <div class="row tm-content-row">
       <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
           <div class="tm-bg-primary-dark tm-block">
               <h2 class="tm-block-title">
                   주간 가입자 수
                        
               </h2>
               <canvas class="chart-size col-12" id="activityChart" ></canvas>
           </div>
       </div>
       <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
           <div class="tm-bg-primary-dark tm-block">
               <h2 class="tm-block-title">
                   성별 분포
                     
               </h2>
	          <canvas id="pie-chart" class="col-12"></canvas>
           </div>
       </div>
       
       
       </div>       
       <!-- 월간 가입자수 -->
       <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col" >
           <div id="div_monthData" style="background-color: #435C70; padding: 40px;">
               <h2 class="tm-block-title">
                   월간 가입자 수
               </h2>
	           <div>
		           <i class="fas fa-chevron-left float-left" style="color:white;"></i>
		           <i class="fas fa-chevron-right float-right" style="color:white;"></i>
	           </div>
               <canvas id="myChart"></canvas>
           </div>
       </div>
    </div>

        
      
<script>
//시간 데이터로 사용할 이번 달과 오늘 일자 담을 변수.
var now = new Date();
var year = now.getFullYear(); 
var month = now.getMonth()+1;
var date = now.getDate();

var firstDate = new Date(year,month-1,1);
var lastDate = new Date(year,month,0);
var lastMonth = new Date(year, month-1,0);
var nextMonth = new Date(year, month+1,0);

//31일치 날짜와 가입자수 담는 배열
var oneMonth = [];

let config;
//월별 가입자수 불러오는 영역 
var ctx = document.getElementById('myChart').getContext('2d');
let barChart;
let presentMonth;

/* console.log('올해는 '+year+'년입니다.');
console.log('이번 달은 '+month+'월입니다.');
console.log('오늘은 '+date+'일입니다.');
console.log('오늘은 '+year+'년 '+ month +'월입니다.');

console.log('firstDate: '+'이번 달은 '+firstDate+'일부터 시작합니다');
console.log('firstDate.getDate()'+'이번 달은 '+firstDate.getDate()+'일부터 시작합니다');
console.log('이번 달은 '+lastDate+'일까지 있습니다');
console.log('이번 달은 '+lastDate.getDate()+'일까지 있습니다');
console.log('지난 달은 '+lastMonth.getDate()+'일까지 있습니다');
console.log('다음 달은 '+nextMonth.getDate()+'일까지 있습니다'); */


//전 달 데이터, 다음 달 가입자 수 불러오기
$(".fa-chevron-left, .fa-chevron-right").click((e)=>{
	if(e.target == document.getElementsByClassName('fa-chevron-left')[0]){		
		month = month-1;

		firstDate = new Date(year,month-1,1);
		lastDate = new Date(year,month,0);
		
		_firstDate = new Date(+firstDate + 3240 * 10000).toISOString().split("T")[0];
		_lastDate = new Date(+lastDate + 3240 * 10000).toISOString().split("T")[0];
		
		console.log('1111111111111_lastDate: '+_lastDate);
		
		/* 월간 가입자 수 비동기로 불러오기 */
		$.ajax({
			url: `${pageContext.request.contextPath}/admin/EnrollMemberByMonth`,
			data:{
				firstDate: _firstDate,
				lastDate: _lastDate
			},
			success(res){

				/* 그래프 업데이트 */
				//배열 초기화
				monthData = [];
				let dataset = config.data.datasets[0].data;
				
				//새롭게 가져온 데이터를 배열 변수에 담는다.
				for(i=0; i<res.EnrollMemberByDateList.length; i++){
					console.log(res.EnrollMemberByDateList[i].cnt);
					monthData.push(res.EnrollMemberByDateList[i].cnt);
				}
				//기존 함수의 data에 이전 달의 데이터를 덮어씌운다.
				config.data.datasets[0].data = monthData;
				
				
				/* x축 labels 업데이트 */
				console.log('변환전 firstDte: '+firstDate);
				console.log('변환전 lastDate: '+lastDate);
 
				presentMonth = firstDate.getMonth()+1;
				lastDate = new Date(year, month, 0);
				console.log('2222222222222firstDate: '+firstDate);
				console.log('2222222222222lastDate: '+lastDate);
				
				//기존 담겨있는 라벨을 초기화한 후, 해당 월의 마지막 날을 조건으로 잡음
				oneMonth = [];
				for(i=1; i<=lastDate.getDate(); i++){
					oneMonth.push(presentMonth+'/'+i);
				}
				
				/* label 업데이트 */
				config.data.datasets[0].label = presentMonth+'월 가입자 수';
				config.data.labels = oneMonth;
				
				
				/* 최정적으로 위에서 변경한 값들을 적용하여, 함수를 업데이트한다. */
				barChart.update();
			},
			error: console.log
		})
	}else if(e.target == document.getElementsByClassName('fa-chevron-right')[0]){		
		month = month+1;
		
		console.log('month: '+month);
		
		firstDate = new Date(year,month-1,1);
		lastDate = new Date(year,month,0);
		
		console.log('firstDate: '+firstDate);
		console.log('lastDate: '+lastDate);
		
		_firstDate = new Date(+firstDate + 3240 * 10000).toISOString().split("T")[0];
		_lastDate = new Date(+lastDate + 3240 * 10000).toISOString().split("T")[0];
		
		console.log('_firstDate: '+_firstDate);
		console.log('_lastDate: '+_lastDate);
		/* 월간 가입자 수 비동기로 불러오기 */
		$.ajax({
			url: `${pageContext.request.contextPath}/admin/EnrollMemberByMonth`,
			data:{
				firstDate: _firstDate,
				lastDate: _lastDate
			},
			success(res){

				/* 그래프 업데이트 */
				//배열 초기화
				monthData = [];
				let dataset = config.data.datasets[0].data;
				
				//새롭게 가져온 데이터를 배열 변수에 담는다.
				for(i=0; i<res.EnrollMemberByDateList.length; i++){
					console.log(res.EnrollMemberByDateList[i].cnt);
					monthData.push(res.EnrollMemberByDateList[i].cnt);
				}
				//기존 함수의 data에 이전 달의 데이터를 덮어씌운다.
				config.data.datasets[0].data = monthData;
				console.log('monthData: '+monthData);
				
				/* x축 labels 업데이트 */

				console.log('변환된 firstDate: '+firstDate);
				
				month = firstDate.getMonth()+1;
				lastDate = new Date(year, month, 0);
				
				//기존 담겨있는 라벨을 초기화한 후, 해당 월의 마지막 날을 조건으로 잡음
				oneMonth = [];
				for(i=1; i<=lastDate.getDate(); i++){
					oneMonth.push(month+'/'+i);
				}
				
				/* label 업데이트 */
				config.data.datasets[0].label = month+'월 가입자 수';
				config.data.labels = oneMonth;
				
				
				/* 최정적으로 위에서 변경한 값들을 적용하여, 함수를 업데이트한다. */
				barChart.update();
			},
			error: console.log
		})
	}
})


/* 날짜 변환 함수 */
function leftPad(value) { if (value >= 10) { return value; } return `0${value}`; } 

function toStringByFormatting(source, delimiter = '/') { 
	const year = source.getFullYear(); 
	const month = leftPad(source.getMonth() + 1); 
	const day = leftPad(source.getDate()); 
	return [year, month, day].join(delimiter); 
} 

var _firstDate = new Date(+firstDate + 3240 * 10000).toISOString().split("T")[0];
var _lastDate = new Date(+lastDate + 3240 * 10000).toISOString().split("T")[0];
//해당 월의 마지막 날을 조건으로 잡음
for(i=1; i<=lastDate.getDate(); i++){
	oneMonth.push(month+'/'+i);
}

var monthData = [];

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

//자동 실행 함수로 세 종류의 통계를 불러온다.
(()=>{
	//월별 통계 데이터 폼을 정의. 해당 변수를 자동실행함수 밖에 정의해버리면, 함수 실행 전에 config에 정의된 값을 찾아오지 못한다
	config = {
		    type: 'bar',
		    data: {
		        labels: oneMonth,
		        datasets: [{
		            label: month+'월 가입자 수',
		            data: monthData,
		            backgroundColor: [
		                "#ccf6ec", "#ff6654","#009784",
		                "#ccf6ec", "#ff6654", "#009784",
		                "#ccf6ec", "#ff6654", "#009784",
		                "#ccf6ec", "#ff6654", "#009784",
		                "#ccf6ec", "#ff6654","#009784",
		                "#ccf6ec","#ff6654","#009784",
		                "#ccf6ec","#ff6654","#009784",
		                "#ccf6ec","#ff6654","#009784",
		                "#ccf6ec","#ff6654","#009784",
		                "#ccf6ec","#ff6654","#009784"
		            ],
		            borderColor: [
		                "#ccf6ec", "#ff6654","#009784",
		                "#ccf6ec", "#ff6654", "#009784",
		                "#ccf6ec", "#ff6654", "#009784",
		                "#ccf6ec", "#ff6654", "#009784",
		                "#ccf6ec", "#ff6654","#009784",
		                "#ccf6ec","#ff6654","#009784",
		                "#ccf6ec","#ff6654","#009784",
		                "#ccf6ec","#ff6654","#009784",
		                "#ccf6ec","#ff6654","#009784",
		                "#ccf6ec","#ff6654","#009784"
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            xAxes: [{
		                ticks: {
		             		//x축 색상
		             		
			    			fontColor : "white"
		                }
		            }]
		        	,
		            yAxes: [{
		                ticks: {
		                	//y축 색상
		                    beginAtZero: true,
		                    stepSize: 1,
			    			fontColor : "white"
		                }
		            }]
		        },
			    legend: {
			    	  labels: {
			    		  fontColor: "white",
			    		  fontSize: 18
			    	  }
			    },
			    
		    }
		}
	;
	
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/thisWeekEnrollMember.do`,
		dataType: "json",
		success: function(data){
			console.log(data);
			ctx = document.getElementById('myChart').getContext('2d');

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
			

			
			//var _firstDate = new Date(+firstDate + 3240 * 10000).toISOString().split("T")[0];
			//var _lastDate = new Date(+lastDate + 3240 * 10000).toISOString().split("T")[0];
			
			
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
/* 			      title: {
			        display: true,
			        text: '주간 가입자 수'
			      }, */
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
								stepSize : 1, 
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
			  });//chart1 종료
		}
	});
	
	
	/* 월간 가입자 수 비동기로 불러오기 */
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/EnrollMemberByMonth`,
		data:{
			firstDate: _firstDate,
			lastDate: _lastDate
		},
		success(res){
			
			for(i=0; i<res.EnrollMemberByDateList.length; i++){
				monthData.push(res.EnrollMemberByDateList[i].cnt);
			}
		},
		complete: function(){
			barChart = new Chart(ctx, config);//월별 가입자수 불러오기 end
		},
		error: console.log
	})
	
	
	
	/* 남녀 성별 기본 데이터 불러오기 */
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/genderData.do`,
		dataType: "json",
		success: function(data){
			console.log(data);
			console.log(data.genderData.male);
			console.log(data.genderData.female);
			
			new Chart(document.getElementById("pie-chart"), {
			    type: 'pie',
			    data: {
			      labels: ["남", "여"],
			      datasets: [{
			        label: "Population (millions)",
			        backgroundColor: ["blue", "red"],
			        data: [data.genderData.male,data.genderData.female]
			      }]
			    },
			    options: {
/* 			      title: {
			        display: true,
			        text: '회원 성별 비율'
			      }, */
			      legend: {
			    	  labels: {
			    		  fontColor: "white",
			    		  fontSize: 18
			    	  }
			      },
			    }
			});
			
		},
		error: console.log
	});
	

})()

  
</script>  

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>