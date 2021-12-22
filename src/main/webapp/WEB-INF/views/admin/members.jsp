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
  </style>

      <div class="container mt-5">
        <div class="col-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <h2 class="tm-block-title">회원 목록</h2>
            <p class="text-white">검색 카테고리</p>
            <div>
              <select class="custom-select selectBar mr-3">
                <option value="0">전체</option>
                <option value="1">아이디</option>
                <option value="2">이름</option>
                <option value="4">생년월일</option>
                <option value="5">연락처</option>
                <option value="6">생성일</option>
                <option value="7">성별</option>
                <option value="8">직업</option>
                <option value="9">블랙리스트</option>


              </select>
              <input id="searchKeyword"  type="text" class="form-control mb-5" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
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
                  src="${pageContext.request.contextPath}/resources/images/avatar.png"
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
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="email">이름</label>
                  <input
                    id="memberName"
                    name="memberName"            
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="password">생년월일</label>
                  <input
                    id="birthday"
                    name="birthday"
                    type="date"
                    class="form-control validate"
                  />
                </div>

                <div class="form-group col-lg-6">
                  <label for="phone">연락처</label>
                  <input
                    id="phone"
                    name="phone"
                    type="tel"
                    class="form-control validate"
                  />
                </div>

                <div class="form-group col-lg-6">
                  <label for="password">생성일</label>
                  <input
                    id="regDate"
                    name="regDate"
                    type="date"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="gender">성별</label>
                  <input
                    id="gender"
                    name="gender"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="job">직업</label>
                  <input
                    id="job"
                    name="job"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-12">
                  <label for="groupList">참여 모임</label>
                  <input
                    id="groupList"
                    name="groupList"
                    class="form-control validate"
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
$(".selectOne").click((e)=>{
	
	/* 테이블 내 회원 데이터 담긴 행을 클릭시, 해당 행 회원 데이터를 비동기로 호출한다. */
	var memberId = e.target.parentNode.children[1].innerText;
	
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
			$("#enabled").val(data.member.enabled);
			if(data.member.groupName == "null"){
				$("#groupList").val("")
			}else{
				$("#groupList").val(data.member.groupName);
			}
			;

				
		},
		error: console.log
	});
});
  
  
/* 블랙리스트 등록 */
$("#blackListBtn").click((e)=>{

	if(!$("#id").val()){
		alert("먼저 회원을 선택해주세요."); 
		return false;
	}
		

	/* 테이블 내 회원 데이터 담긴 행을 클릭시, 해당 행 회원 데이터를 비동기로 호출한다. */
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
  
  
  
</script>

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>