<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/ad_header.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>

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
</style>

      <div class="container mt-5">
        <div class="col-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <h2 class="tm-block-title">그룹 통계</h2>

            <div class="form-check mb-3">
              <input class="form-check-input" type="radio" name="flexRadioDefault" id="boardCount" onclick="viewDateForm()" checked>
              <label class="form-check-label mr-5 statisticsOf" for="flexRadioDefault1">게시글 수</label>
              
              <input class="form-check-input" type="radio" name="flexRadioDefault" id="premiumGroupCount" onclick="viewDateForm()">
              <label class="form-check-label mr-5 statisticsOf" for="flexRadioDefault1">프리미엄 모임 수</label>

              <input class="form-check-input" type="radio" name="flexRadioDefault" id="reviewCount" onclick="viewDateForm()">
              <label class="form-check-label mr-5 statisticsOf" for="flexRadioDefault1">리뷰 수</label>
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
          </form>
            </div>
            
            <!--비동기로 차트가 바뀌어야 함. include로 상황에 맞춰서  -->
            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script type="text/javascript">
              google.charts.load('current', {'packages':['corechart']});
              google.charts.setOnLoadCallback(drawChart);
        
              function drawChart() {
        
                var data = google.visualization.arrayToDataTable([
                  ['Task', 'Hours per Day'],
                  ['개성공단',     11],
                  ['KHIS',      2],
                  ['ITFF',  2],
                  ['코드네임200', 2],
                  ['펫다온',    7]
                ]);
        
                var options = {
                  title: '주간 게시글 수'
                };
        
                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        
                chart.draw(data, options);
              }
            </script>
          
          <div id="piechart" style="width: 100%; height: 500px;"></div>
          <!--  -->
          </div>
          
        </div>

      </div>

<script>
  $(blackListBtn).click((e)=>{
    alert('블랙리스트 등록시, \n\n- 해당 해당 사용자는 사이트 로그인 불가 상태가 됩니다. \n\n그래도 등록하시겠습니까?')
  })
  //게시글 수 선택시 기간 설정
  function viewDateForm(){
    if($(boardCount).prop("checked"))
      document.getElementById("dateForm").setAttribute("style", "display: block");
    else if($(premiumGroupCount).prop("checked"))
      document.getElementById("dateForm").setAttribute("style", "display: none");
    else
      document.getElementById("dateForm").setAttribute("style", "display: none");
  }


</script>

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>