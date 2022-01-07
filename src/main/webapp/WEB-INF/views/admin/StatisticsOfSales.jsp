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
	             	<th>총 매출</th>
	             	<th style="border-right: solid #4E6175 1px">프리미엄 모임 수</th>
	             	<th>이번 달 매출</th>
	             	<th>전월 매출</th>
             	</tr>
             	</thead>
             	<tbody>
             	<tr>
             		<td style="border-right: solid #4E6175 1px">
	             		<fmt:formatNumber type="currency" value="${totalSales}"/>
             		</td>
             		<td style="border-right: solid #4E6175 1px">${countOfPremiumGroup.count}개</td>
             		<td style="border-right: solid #4E6175 1px">
	             		<fmt:formatNumber type="currency" value="${salesOfThisMonth}"/>
	             		
	             		<c:if test="${(salesOfThisMonth - salesOfLastMonth) < 0 }">
	             		<span style="color: #FECABF">
		             		(<fmt:formatNumber value="${salesOfThisMonth - salesOfLastMonth}"/>)  
	             		</span>
	             		</c:if>
	             		
	             		<c:if test="${(salesOfThisMonth - salesOfLastMonth) >= 0 }">
	             		<span style="color: #33C073">
		             		(<fmt:formatNumber value="${salesOfThisMonth - salesOfLastMonth}"/>) 
	             		</span>	             		
	             		</c:if>
	             		
             		</td>
             		<td>
             			<fmt:formatNumber type="currency" value="${salesOfLastMonth}"/>
             		</td>
             	</tr>
             	</tbody>
             </table>
             
             <div class="row tm-content-row">
					<table class="table text-center">
		             	<thead>
		             	<tr>
			             	<th colspan="3">월별 매출</th>
		             	</tr>
		             	</thead>
		             	<tbody>
		             	<c:forEach items="${monthDataList }" var="monthData" varStatus="status">
		             		<tr>
		             			<td style="border-right: solid #4E6175 1px">${status.count }</td>
		             			<td style="border-right: solid #4E6175 1px">${fn:substring(monthData,1,8)}</td>
		             			<td style="border-right: solid #4E6175 1px">
		             				<fmt:parseNumber var="i" type="number" value="${fn:substring(monthData,9,10)}" />
		             				<fmt:formatNumber type="currency">${i*10000}</fmt:formatNumber>  
		             			</td>
		             		</tr>
		             	</c:forEach>					
		             	</tbody>
		             </table>

             </div>

            </div>
            


          </div>
          
        </div>

      </div>


<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>