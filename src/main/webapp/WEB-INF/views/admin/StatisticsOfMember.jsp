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
       <div class="col-12">
       		<canvas id="myChart"></canvas>
       </div>       
    </div>

        
      
      </div>
    </div>
<!-- 통계 script -->
<script>

//날짜 변환 함수
function leftPad(value) { if (value >= 10) { return value; } return `0${value}`; } 

function toStringByFormatting(source, delimiter = '-') { 
	const year = source.getFullYear(); 
	const month = leftPad(source.getMonth() + 1); 
	const day = leftPad(source.getDate()); 
	return [year, month, day].join(delimiter); 
} 
	
	




//시간 데이터로 사용할 이번 달과 오늘 일자 담을 변수.
var now = new Date();
var year = now.getFullYear(); 
var month = now.getMonth()+1;
var date = now.getDate();

var firstDate = new Date(year,month-1,1);
var lastDate = new Date(year,month,0);
var lastMonth = new Date(year, month-1,0);
var nextMonth = new Date(year, month+1,0);


console.log('올해는 '+year+'년입니다.');
console.log('이번 달은 '+month+'월입니다.');
console.log('오늘은 '+date+'일입니다.');
console.log('오늘은 '+year+'년 '+ month +'월입니다.');

console.log('firstDate: '+'이번 달은 '+firstDate+'일부터 시작합니다');
console.log('firstDate.getDate()'+'이번 달은 '+firstDate.getDate()+'일부터 시작합니다');
console.log('이번 달은 '+lastDate+'일까지 있습니다');
console.log('이번 달은 '+lastDate.getDate()+'일까지 있습니다');
console.log('지난 달은 '+lastMonth.getDate()+'일까지 있습니다');
console.log('다음 달은 '+nextMonth.getDate()+'일까지 있습니다');

var _firstDate = new Date(+firstDate + 3240 * 10000).toISOString().split("T")[0];
var _lastDate = new Date(+lastDate + 3240 * 10000).toISOString().split("T")[0];

var oneMonth = [];
for(i=1; i<=lastDate.getDate(); i++){
	oneMonth.push(month+'/'+i);
}

var monthData = [];

$.ajax({
	url: `${pageContext.request.contextPath}/admin/EnrollMemberByMonth`,
	data:{
		firstDate: _firstDate,
		lastDate: _lastDate
	},
	success(res){
		console.log("---------------------여기는 월간 데이터---------------------")
		console.log(res);
		console.log(res.EnrollMemberByDateList.length);
		console.log(typeof(res.EnrollMemberByDateList.length));
		console.log(res.EnrollMemberByDateList[0].cnt);
		console.log(typeof(res.EnrollMemberByDateList[0].cnt));
		
		for(i=0; i<res.EnrollMemberByDateList.length; i++){
			monthData.push(res.EnrollMemberByDateList[i].cnt);
		}
		console.log('monthData: '+ monthData);
		console.log(typeof(monthData));
	},
	error: console.log
	
})

//월별 가입자수 불러오기
var ctx = document.getElementById('myChart').getContext('2d');



var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: oneMonth,
        datasets: [{
            label: month+'월 가입자 수',
            data: monthData,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)'
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
});//월별 가입자수 불러오기 end

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
	});
	
	
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