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
            <h2 class="tm-block-title">회원 통계</h2>
            <div class="form-check mb-3">
              <div>
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="AllMembers">
                <label class="form-check-label mr-5 statisticsOf" for="flexRadioDefault1">총 회원</label>
                
              <input class="form-check-input" type="radio" name="flexRadioDefault" id="NewMembers">
              <label class="form-check-label mr-5 statisticsOf" for="flexRadioDefault1">가입자</label>
              
              <input class="form-check-input" type="radio" name="flexRadioDefault" id="NewMembers">
              <label class="form-check-label mr-5 statisticsOf" for="flexRadioDefault1">모임</label>
              
              <input class="form-check-input" type="radio" name="flexRadioDefault" id="NewMembers">
              <label class="form-check-label mr-5 statisticsOf" for="flexRadioDefault1">생성 모임</label>

              <input class="form-check-input" type="radio" name="flexRadioDefault" id="NewMembers">
              <label class="form-check-label mr-5 statisticsOf" for="flexRadioDefault1">프리미엄 모임</label>
            </div>
            <br>
            성별
            <select class="form-select" aria-label="Default select example">
              <option selected>전체</option>
              <option value="1">남</option>
              <option value="2">여</option>
            </select>



              <br><br>
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
              <button class="btn btn-secondary" style="" type="submit">검색</button>
              </div>
            </div>
            
            <!--비동기로 차트가 바뀌어야 함. include로 상황에 맞춰서  -->
            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script type="text/javascript">
              google.charts.load('current', {'packages':['corechart']});
              google.charts.setOnLoadCallback(drawChart);
        
          
                function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                      ['Year', '회원수'],
                      ['2021.05',  50],
                      ['2021.06',  150],
                      ['2021.07',  90],
                      ['2021.08',  450],
                      ['2021.09',  500],
                      ['2021.10',  800],
                      ['2021.11',  1000]
                    ]);
        
                    var options = {
                      title: '월별 회원 증감수',
                      curveType: 'function',
                      legend: { position: 'bottom'}
                    };
        
                    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
        
                    chart.draw(data, options);
                  }
                </script>
          
          <div id="curve_chart" style="width:100%; height: 500px;"></div>
            <!--  -->
          </div>
          
        </div>
      </div>
      
<script>
  $(blackListBtn).click((e)=>{
    alert('블랙리스트 등록시, \n\n- 해당 해당 사용자는 사이트 로그인 불가 상태가 됩니다. \n\n그래도 등록하시겠습니까?')
  })
</script>  

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>