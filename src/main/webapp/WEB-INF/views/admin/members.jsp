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
              <table class="table mb-3">
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
                  <tr class="selectOne">
                    <td>${vs.count}</td>
                    <td id="memberId-${vs.count}">${member.id}</td>
                    <td id="memberName-${vs.count}">${member.memberName}</td>
                    <td id="birthday-${vs.count}"><fmt:formatDate value="${member.birthday}" pattern="yy-MM-dd"/></td>
                    <td id="memberGender-${vs.count}">${member.memberGender }</td>
                    <td id="memberEnrollDate-${vs.count}"><fmt:formatDate value="${member.memberEnrollDate}" pattern="yy-MM-dd"/></td>
                    <td id="enabled-${vs.count}">${member.enabled}</td>
                  </tr>   
                </c:forEach>
                </tbody>
              </table>
              <nav aria-label="Page navigation example" style="margin: auto;">
                <ul class="pagination">
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
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
              <form action="" class="tm-signup-form row">
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

                <div class="col-12">
                  <button
                    id="blackListBtn"
                    type="submit"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                    블랙리스트 회원 등록
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

<script>

/*회원 정보 불러오기*/
$(".selectOne").click((e)=>{
	console.log(e.target.parentNode.children[1].innerText);

	
	var memberId = memberId= e.target.parentNode.children[1].innerText;
	
	
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
		},
		error: console.log
	});
});
  
</script>

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>