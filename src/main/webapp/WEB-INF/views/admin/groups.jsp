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
  .disabled{
    
  }
  .form-control.validate[disabled]{
    background-color: #4E657A;
  }

  
  .tableTitle{
 	width: 15%;
 	background-color: #486177;
  }
  .tableContent{
  	background-color: ;
  }
  #div_groupInfo{
  	
  }
  #table_groupInfo{
  	background-color: #4E657A;
    border-collapse: collapse;  	
	color: white;
	width: 80%;
	height: 20vh;
	font-size: 0.8vw;
  }
  #table_groupInfo tr{
  	border: solid 1px #435C70;
  }
  #table_list{
  	font-size: 70%;
  }

</style>

<div class="container mt-5">
        <div class="col-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <h2 class="tm-block-title">모임 목록</h2>
            <p class="text-white">검색 카테고리</p>
            <div>
              <form name="searchForm" action="${pageContext.request.contextPath}/admin/searchGroups">
              	<table class="table mb-3 table-striped ">
              		<thread>
              			<tr>
              				<th style="border-right: solid 1px #3e464f" class="col-1.5 text-center">검색어</th>
              				<td class="d-flex">
              					<select name="searchType" id="" class="mr-2">
					                <option value="groupName">모임명</option>
					                <option value="groupNo">모임 번호</option>  
					            </select>
					        <input name="searchKeyword" id="searchKeyword" type="text"
					        	<c:if test="${not empty searchKeyword}">value="${searchKeyword}"</c:if>
					        >
					        </td>
					        
              			</tr>
              			<tr>
              				<th style="border-right: solid 1px #465b70"  class="text-center">등록 기간</th>
              				<td class="d-flex">
              					<input class="dateSize" type="date" name="searchRegDateStart" id="searchRegDateStart" 
              						<c:if test="${not empty searchRegDateStart}">value="${searchRegDateStart}"</c:if>
              					/>&nbsp~&nbsp
              					
	         					<input class="dateSize" type="date" name="searchRegDateEnd" id="searchRegDateEnd" 
              						<c:if test="${not empty searchRegDateEnd}">value="${searchRegDateEnd}"</c:if>	         					
	         					/>
              				</td>
              			</tr>
 
              			<tr>
	              			<th style="border-right: solid 1px #3e464f" class="text-center">카테고리</th>
	              				<td>
	              					<select name="categoryNo" id="categoryNo">
		              					<option value="">전체</option>
		              					<c:forEach items="${CategoryOneList }" var="category">
		              					<option value="${category.category1No}">${category.category1Name}</option>
		              					</c:forEach>

	              					</select>              				
	              				</td>
	              			</tr>
              			<tr>
              			<tr>
              				<th style="border-right: solid 1px #465b70" class="text-center" >모집 	여부</th>
              				<td>
					         	 <label for="allGroup"><span class="text-white genderText">전체</span></label>
					        	 <input type="radio" name="groupClose" id="allGroup" value="" class="mr-5"
					         	 	<c:if test="${empty groupClose or groupClose==''}">checked</c:if>					        	 
					        	 />
					         	 <label for="openGroup"><span class="text-white genderText">모집 중</span></label>
					        	 <input type="radio" name="groupClose" id="openGroup" value="N" class="mr-5"
					         	 	<c:if test="${groupClose eq 'N'}">checked</c:if>
					        	 />
					         	 <label for="closeGroup"><span class="text-white genderText">모집 마감</span></label>
					        	 <input type="radio" name="groupClose" id="closeGroup" value="Y"
					         	 	<c:if test="${groupClose eq 'Y'}">checked</c:if>					        	 
					        	 />              					
              				</td>
              			</tr>

              			
              		</thread>
              	</table>
              

	         
	             <button id="searchBtn" class="btn btn-primary col rounded mt-3 mb-5" type="submit"><span class="font-weight-bold">검 색</span></button>
              </form>
            </div>
            <!-- 회원목록 테이블 -->
            <div class="row tm-content-row">
              <table id="table_list" class="table mb-3 text-center">
                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">그룹명</th>
                    <th scope="col">생성일</th>
                    <th scope="col">프리미엄</th>
                    <th scope="col">모집여부</th>
                    <th scope="col">정원</th>
                    <th scope="col">비밀여부</th>
                    <th scope="col">좋아요 수</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${allGroupList}" var="group">
                <tr class="selectOne">
                	<td>${group.groupNo}</td>
                	<td>${group.groupName }</td>
                	<td><fmt:formatDate value="${group.groupEnrollDate }" pattern="yy-MM-dd"/> </td>
                	<td>
	                	<c:if test="${fn:contains(group.groupCharge,'F')}">.</c:if>
	                	<c:if test="${fn:contains(group.groupCharge,'T')}">O</c:if>
                	</td>
                	<td>
                		<c:if test="${fn:contains(group.groupClose,'N')}">O</c:if>
                		<c:if test="${fn:contains(group.groupClose,'Y')}">.</c:if>                	
                	</td>
                	<td>${group.groupPool }명</td>
                	<td>

                	</td>
                	<td>${group.groupLikeCount }</td>
                </tr>
                
                </c:forEach>
                 
                </tbody>
              </table>
              <div style="margin: auto">
			${pagebar }
              </div>
            </div>
          </div>
          
        </div>
  
        <!-- row -->
        <div class="row tm-content-row" >
        	<div class="col-11 tm-bg-primary-dark tm-block tm-block-h-auto" style="margin: auto" >
        	
            <div>
              <h2 class="tm-block-title">그룹 대표 사진</h2>
              <div class="text-center col-10" style="margin: auto;">
                <img
                	id="groupBanner"
                  src="${pageContext.request.contextPath}/resources/upFile/group/group-banner-default.png"
                  alt="Avatar"
                  class="col-5 mb-4"
                />
                <a href="#" class="tm-avatar-delete-link">
                  <i class="far fa-trash-alt tm-product-delete-icon"></i>
                </a>
              </div>
              
            </div>
		        <div id="div_groupInfo" class="col-12 text-center">
			        <table id="table_groupInfo" style="margin: auto;">
			        <tbody>
			        <tr>
			        	<th class="tableTitle">모임번호</th>
			        	<td id="table_groupNo" class="tableContent tableContent1"></td>
			        	<th class="tableTitle">모임명</th>
			        	<td id="table_groupName" class="tableContent" colspan="5"></td>
			        </tr>
			        <tr>
			        	<th class="tableTitle">상위 카테고리</th>
			        	<td id="table_category1" class="tableContent tableContent1"></td>
			        	<th class="tableTitle">하위 카테고리</th>
			        	<td id="table_category2" class="tableContent" colspan="5"></td>
			        </tr>
			        <tr>
			        	<th class="tableTitle">생성일</th>
			        	<td id="table_enrollDate" class="tableContent tableContent1"></td>
			        	<th class="tableTitle">프리미엄</th>
			        	<td id="table_charge" class="tableContent"></td>
			        	
			        	<th class="tableTitle">비밀여부</th>
			        	<td id="table_private" class="tableContent"></td>
			        </tr>
			        <tr>
						<th class="tableTitle">모집여부</th>
			        	<td id="table_close" class="tableContent tableContent1"></td>
			        	<th class="tableTitle">정원</th>
			        	<td id="table_pool" class="tableContent"></td>        
			        	<th class="tableTitle">좋아요 수</th>
			        	<td id="table_likeCount" class="tableContent"></td>
			        </tr>
			        <tr>
			        	<th class="tableTitle">모임장</th>
			        	<td id="table_leader" class="tableContent tableContent1"></td>
			        	<th class="tableTitle">참여자</th>
			        	<td id="table_member" class="tableContent" colspan="3"></td>
			        </tr>
			        </tbody>
			        </table>
		        </div>
		        </div>
		        
          </div>
         
        
      </div>
<script>
/*클릭한 그룹 정보 불러오기*/
$(".selectOne").click((e)=>{
	
	/* 테이블 내 그룹 데이터 담긴 행을 클릭시, 해당 행 그룹 데이터를 비동기로 호출한다. */
	let groupNo = e.target.parentNode.children[0].innerText;
	
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/groups/selectOneGroup`,
		data:{
			groupNo:groupNo
		},
		dataType: "json",
		success(data){
			console.log(data);
			$("#table_groupNo").text(data.group.groupNo);
			$("#table_groupName").text(data.group.groupName);
			$("#table_category1").text(data.category1Map[data.group.categoryNo]);
			if(data.str_gc2List == "null"){
				$("#table_category2").text(" - ");
			}else{
				$("#table_category2").text(data.str_gc2List);
			}
			
			
 			$("#table_enrollDate").text(data.group.groupEnrollDate);
 			data.group.groupCharge=='F'? $("#table_charge").text('X') : $("#table_charge").text('O');
 			data.group.groupPrivate=='U'? $("#table_private").text('X'):$("#table_private").text('O');
			$("#table_likeCount").text(data.group.groupLikeCount);
			data.group.groupClose=='Y'? $("#table_close").text('O'):$("#table_close").text('X');
			$("#table_pool").text(data.group.groupPool+'명');
			$("#table_leader").text(data.leader.memberId); 
			$("#table_member").text(data.str_memberList);
			
			$("#groupBanner").attr("src", `${pageContext.request.contextPath}/resources/upFile/group/`+data.banner.renamedFilename);
		},
		error: console.log
	})
	
	
	
});
</script>

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>