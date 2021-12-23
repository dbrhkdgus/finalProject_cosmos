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
    .genderText{
		font-weight: bold;
		font-size: 120%;
    }
	.form-control:disabled, .form-control[readonly] {
	    background-color: #4E657A;
	}
  </style>

      <div class="container mt-5">
        <div class="col-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <h2 class="tm-block-title">회원 목록</h2>
            <p class="text-white">검색 카테고리</p>
            <div>
              <form name="searchForm" action="${pageContext.request.contextPath}/admin/searchMembers.do">
              	<table class="table mb-3 table-striped ">
              		<thread>
              			<tr>
              				<th class="col-3">검색어</th>
              				<td class="d-flex">
              					<select name="searchType" id="" class="mr-2">
					                <option value="id">아이디</option>
					                <option value="memberName"
					                	<c:if test="${searchType eq 'memberName'}">selected</c:if>>이름
					                </option>     
					                <option value="nickname">닉네임</option>
					            </select>
					        <input name="searchKeyword" id="searchKeyword" type="text"
					        	<c:if test="${not empty searchKeyword}">value="${searchKeyword}"</c:if>
					        >
					        </td>
					        
              			</tr>
              			<tr>
              				<th>가입 기간</th>
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
              				<th>생년 월일</th>
              				<td>
              					<input type="date" name="searchBirthdayStart" id="searchBirthdayStart" 
              						<c:if test="${not empty searchBirthdayStart}">value="${searchBirthdayStart}"</c:if>	         					
              					/>&nbsp~ 
	         					<input type="date" name="searchBirthdayEnd" id="searchBirthdayEnd"
              						<c:if test="${not empty searchBirthdayEnd}">value="${searchBirthdayEnd}"</c:if>	         						         					 
	         					/>
              				</td>              				
              			</tr>
              			<tr>
	              			<th>직업</th>
	              				<td>
	              					<select name="searchJob" id="searchJob">
		              					<option value="">전체</option>
		              					<option value="백엔드 개발자">백엔드 개발자</option>
		              					<option value="프론트 개발자">프론트엔드 개발자</option>
		              					<option value="개발자">개발자</option>
		              					<option value="취업 준비생">취업 준비생</option>
	              					</select>              				
	              				</td>
	              			</tr>
              			<tr>
              			<tr>
              				<th>성별</th>
              				<td>
					         	 <label for="allMember"><span class="text-white genderText">전체</span></label>
					        	 <input type="radio" name="searchGender" id="allMember" value="" class="mr-5"
					         	 	<c:if test="${empty searchGender or searchGender==''}">checked</c:if>					        	 
					        	 />
					         	 <label for="blackMember"><span class="text-white genderText">남성</span></label>
					        	 <input type="radio" name="searchGender" id="blackMember" value="M" class="mr-5"
					         	 	<c:if test="${searchGender eq 'M'}">checked</c:if>
					        	 />
					         	 <label for="nonBlackMember"><span class="text-white genderText">여성</span></label>
					        	 <input type="radio" name="searchGender" id="nonBlackMember" value="F"
					         	 	<c:if test="${searchGender eq 'F'}">checked</c:if>					        	 
					        	 />              					
              				</td>
              			</tr>
              				<th>블랙리스트 유무</th>
              				<td>
					         	 <label for="allMember"><span class="text-white genderText" >전체</span></label>
					        	 <input type="radio" name="searchEnabled" id="allMember" value="" class="mr-5"
					         	 	<c:if test="${empty searchEnabled}">checked</c:if>					        	 
					        	 />
					         	 <label for="blackMember"><span class="text-white genderText">블랙회원</span></label>
					        	 <input type="radio" name="searchEnabled" id="blackMember" value="0" class="mr-5"
					         	 	<c:if test="${searchEnabled eq '0'}">checked</c:if>					        	 	
					        	 />
					         	 <label for="nonBlackMember"><span class="text-white genderText">일반회원</span></label>
					        	 <input type="radio" name="searchEnabled" id="nonBlackMember" value="1"
					         	 	<c:if test="${searchEnabled eq '1'}">checked</c:if>					        	 						        	 
					        	 />              					
              				</td>
              			</tr>
              			
              		</thread>
              	</table>
              

	         
	             <button id="searchBtn" class="btn btn-primary col rounded mt-3 mb-5" type="button"><span class="font-weight-bold">검 색</span></button>
              </form>
            </div>
            
            <!-- 회원목록 테이블 -->
            <div class="row tm-content-row">
              <table id="memberTable" class="table mb-3 text-center">

                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">아이디</th>
                    <th scope="col">이름</th>
                    <th scope="col">생년월일</th>
                    <th scope="col">성별</th>
                    <th scope="col">생성일</th>
                    <th scope="col">블랙리스트</th>
                  </tr>
                </thead>
                <tbody>
              <c:if test="${empty list}"><tr><td colspan="7"><h3 class="text-white">조회된 행이 없습니다.</h3></td></tr></c:if>
              <c:if test="${not empty list}">
                <c:forEach items="${list}" var="member" varStatus="vs">
                  <tr class="selectOne" id="tr-${member.id}">
                    <td>${vs.count}</td>
                    <td id="memberId-${vs.count}">${member.id}</td>
                    <td id="memberName-${vs.count}">${member.memberName}</td>
                    <td id="birthday-${vs.count}"><fmt:formatDate value="${member.birthday}" pattern="yy-MM-dd"/></td>
                    <td id="memberGender-${vs.count}">${member.memberGender }</td>
                    <td id="memberEnrollDate-${vs.count}"><fmt:formatDate value="${member.memberEnrollDate}" pattern="yy-MM-dd"/></td>
                    <td id="enabled-${vs.count}">
                    	<c:if test="${member.enabled eq 'true'}">.</c:if>
                    	<c:if test="${member.enabled eq 'false'}">O</c:if>
                    </td>
                  </tr>   
                </c:forEach>
                </tbody>
              </c:if>                
              </table>
              <div style="margin: auto">${pagebar}</div>

            </div>
          </div>
          
        </div>
  
        <!-- row -->
        <div class="row tm-content-row">
          <div class="tm-block-col tm-col-avatar">
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
              <h2 class="tm-block-title">프로필 사진</h2>
              <div class="tm-avatar-container">
                <img
                  id="profileImg"
                  src="${pageContext.request.contextPath}/resources/images/sample.png"
                  alt="Avatar"
                  class="tm-avatar img-fluid mb-4"
                />
                <a href="#" class="tm-avatar-delete-link">
                  <i class="far fa-trash-alt tm-product-delete-icon"></i>
                </a>
              </div>

              
            </div>
          </div>
          <div class="tm-block-col tm-col-account-settings">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
              <h2 class="tm-block-title">회원 정보</h2>
              <div class="tm-signup-form row">
                <div class="form-group col-lg-6">
                  <label for="name">아이디</label>
                  <input
                    id="id"
                    name="id"
                    type="text"
                    class="form-control validate"
                    readonly                    
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="email">이름</label>
                  <input
                    id="memberName"
                    name="memberName"            
                    class="form-control validate"
                    readonly                    
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="password">생년월일</label>
                  <input
                    id="birthday"
                    name="birthday"
                    type="date"
                    class="form-control validate"
                    readonly                    
                  />
                </div>

                <div class="form-group col-lg-6">
                  <label for="phone">연락처</label>
                  <input
                    id="phone"
                    name="phone"
                    type="tel"
                    class="form-control validate"
                    readonly                    
                  />
                </div>

                <div class="form-group col-lg-6">
                  <label for="password">생성일</label>
                  <input
                    id="regDate"
                    name="regDate"
                    type="date"
                    class="form-control validate"
                    readonly                    
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="gender">성별</label>
                  <input
                    id="gender"
                    name="gender"
                    class="form-control validate"
                    readonly
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="job">직업</label>
                  <input
                    id="job"
                    name="job"
                    class="form-control validate"
                    readonly                    
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="email">이메일</label>
                  <input
                    id="email"
                    name="email"
                    class="form-control validate"
                    readonly                    
                  />
                </div>                
                <div class="form-group col-lg-12">
                  <label for="groupList">참여 모임</label>
                  <input
                    id="groupList"
                    name="groupList"
                    class="form-control validate"
                    readonly                    
                  />
                </div>
				
				<input type="hidden" id="enabled" />
				
                <div class="col-12">
                  <button
                    id="blackListBtn"
                    type="submit"                 
                    class="btn btn-primary btn-block text-uppercase"
                  >
                    블랙리스트 회원 등록
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
<script>
/* 회원 리스트 불러오기 */

/*클릭한 회원 정보 불러오기*/
var showMemberInfo = $(".selectOne").click((e)=>{
	
	/* 테이블 내 회원 데이터 담긴 행을 클릭시, 해당 행 회원 데이터를 비동기로 호출한다. */
	var memberId = e.target.parentNode.children[1].innerText;
	
	var attachNo = '';
	var calledId = '';
	
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/selectOneMember.do`,
		data: {
			id: memberId
		},
		dataType: "json",
		success: function(data){
			console.log(data);
			console.log(data.member.id);
			$("#id").val(data.member.id);
			$("#memberName").val(data.member.memberName);
			$("#birthday").val(data.member.birthday);
			$("#phone").val(data.member.phone);
			$("#regDate").val(data.member.memberEnrollDate);
			$("#gender").val(data.member.memberGender);
			$("#job").val(data.member.memberJob);
			$("#email").val(data.member.memberEmail);
			$("#enabled").val(data.member.enabled);
			if(data.member.groupName == "null"){
				$("#groupList").val("")
			}else{
				$("#groupList").val(data.member.groupName);
			}
			
			console.log(data.member.memberJob);
			/* 등록된 프로필 이미지가 없을 때 */
			console.log("첨부파일번호: "+data.member.attachNo);
			if(data.member.attachNo == "0"){
				document.getElementById('profileImg').src = `${pageContext.request.contextPath}/resources/images/sample.png`;
			}else{
				document.getElementById('profileImg').src = `${pageContext.request.contextPath}/resources/upload/member`+data.member.attachNo;				
			}
			/* Promise 사용하기 위해 변수에 담기 */
			attachNo = data.member.attachNo;
			calledId = data.member.id;
		},
		/* 변경된 사항의 리스트 행을 클릭시 해당 회원의 정보에 맞춰 버튼의 색깔이 변경된다.*/
		complete : function(){
			if($("#enabled").val()=='true'){
			  document.getElementById('blackListBtn').className = 'btn btn-primary btn-block text-uppercase';
			  document.getElementById('blackListBtn').innerText = '블랙리스트 회원 등록';
			}else{
			  document.getElementById('blackListBtn').className = 'btn btn-success btn-block text-uppercase';
			  document.getElementById('blackListBtn').innerText = '블랙리스트 회원 해제';
			}
		},
		error: console.log
	/* Promise 사용해보기. */
	}).then(function(result,status,responseObj){
		console.log("여기는 Promise 함수입니다.");
		console.log("calledId = "+calledId);
		if( attachNo == '0'){
			$.ajax({
				url: `${pageContext.request.contextPath}/admin/selectKakaoImage.do`,
				data: {
					id: calledId,
				},
				dataType: "json",
				success: function(data){
					if(data.imgSrc != ''){
						document.getElementById('profileImg').src = data.imgSrc;
					}else{
						document.getElementById('profileImg').src = `${pageContext.request.contextPath}/resources/images/sample.png`;
					}
				},
				error: console.log
			})
		}		
	});
})


  
  
/* 블랙리스트 등록 */
$("#blackListBtn").click((e)=>{

	if(!$("#id").val()){
		alert("먼저 회원을 선택해주세요."); 
		return false;
	}
		

	var targetMember = document.getElementById('id').value; 
    var changeMemberEnabled = 'tr-'+targetMember;

	$.ajax({
		url: `${pageContext.request.contextPath}/admin/updateBlack.do`,
		data: {
			id: $("#id").val(),
			enabled: $("#enabled").val()
		},
		dataType: "json",
		success(data){
			console.log(data);
			alert("변경이 완료되었습니다.");
			console.log($("#enabled").val())
			if($("#enabled").val()=='true'){
			  document.getElementById('blackListBtn').className = 'btn btn-success btn-block text-uppercase';
			  document.getElementById('blackListBtn').innerText = '블랙리스트 회원 해제';
			  document.getElementById(changeMemberEnabled).children[6].innerText='O'	  				  
			}else{
			  document.getElementById('blackListBtn').className = 'btn btn-primary btn-block text-uppercase';
			  document.getElementById('blackListBtn').innerText = '블랙리스트 회원 등록';
			  document.getElementById(changeMemberEnabled).children[6].innerText='.'	  				  
			}
		},
		error: console.log
	});
});

$(searchBtn).click((e)=>{

	/* 날짜 입력 중 한 쪽 값이 비어있을 때 */
	if(($(searchRegDateStart).val() != '' && $(searchRegDateEnd).val() =='') || ($(searchRegDateStart).val() == '' && $(searchRegDateEnd).val() != '')){
		alert("가입 기간의 시작 날짜, 종료 날짜를 정확하게 입력해주세요");
		e.preventDefault();
		return;
	}
	if(($(searchBirthdayStart).val() != '' && $(searchBirthdayEnd).val() =='') || ($(searchBirthdayStart).val() == '' && $(searchBirthdayEnd).val() != '')){
		alert("생년 월일의 시작 날짜, 종료 날짜를 정확하게 입력해주세요");
		e.preventDefault();
		return;
	}
	$(searchForm).submit();
})

</script>

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>