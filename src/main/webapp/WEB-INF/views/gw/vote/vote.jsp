<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="투표" name="title"/>
</jsp:include>

 <div class="groupware-vote-outter">
  	<div class="present-vote-box" style="background: Beige;">
  		<div class="present-vote" style="background: FloralWhite">
  			<div class="present-vote-title mb-4">
  				<h3 class="vote-title">멤버 추방 투표</h2>
  				<h6 class="vote-sub-title"></h5>
  			</div>
  			<div class="vote-question-box">
  				<div class="vote-question">
	  				<p class="vote-question-title text-secondary">그룹의 민폐 김동현님을 추방합시다!</p>
	  				<input type="radio" name="question1-radio"/> 찬성
	  				<input type="radio" name="question1-radio"/> 반대
  				</div>
  				
  			</div>
  		</div>
  		<div class="present-vote-control-box">
  		<button class="vote-controll-btn">투표 생성하기</button>
  		<button class="vote-controll-btn">투표 제출하기</button>
  		<button class="vote-controll-btn">투표 수정하기</button>
  		</div>
  	</div>
  	<div class="old-vote-box">
  		<div class="vote-in-progress" style="background: Beige">
  			<div class="vote-in-progress-title">
  				<p class="ml-3 mt-2">진행중인 다른 투표</p>
  			</div>
  			<div class="vote-in-progress-table">
  				<table>
  					<thead>
  						<tr>
  							<th>제목</th>
  							<th colspan="3">마감일</th>
  							<th>투표율</th>
  						</tr>
  					</thead>
  					<tbody>
  						<tr>
  							<td>정모장소 투표</td>
  							<td>2022-01-03 까지</td>
  							<td>67%</td>
  						</tr>
  					</tbody>
  				</table>
  			</div>
  		</div>
  		<div class="vote-closed-box" style="background: Beige">
  			<div class="vote-closed-title">
  				<p class="ml-3 mt-2">마감된 투표</p>
  			</div>
  			<div class="vote closed-table">
  			<table>
  					<thead>
  						<tr>
  							<th>제목</th>
  							<th colspan="3">종료일</th>
  							<th>투표율</th>
  						</tr>
  					</thead>
  					<tbody>
  						<tr>
  							<td>반장 투표</td>
  							<td>2022-01-01</td>
  							<td>95%</td>
  						</tr>
  					</tbody>
  				</table>
  			</div>
  		</div>
  	</div>
</div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

