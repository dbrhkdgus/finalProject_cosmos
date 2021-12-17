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
    width: 65%; display: inline;
  }
  .selectBar{
    width: 31%;
  }
  #selectCategory{
    display: none;
  }
  #selectDate{
    display: none;
  }
</style>

      <div class="container mt-5">
        <div class="col-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <h2 class="tm-block-title">문의 목록</h2>
            <p class="text-white">검색 카테고리</p>
            <!-- 검색어 전송 -->
            <form action="#" class="d-flex">
              <div>
                <select class="custom-select selectBar mr-3" id="search1" onchange="search2()">
                  <option value="all">전체</option>
                  <option value="writer">작성자</option>
                  <option value="regDate">등록일</option>
                  <option value="title">제목</option>
                <!-- 카테고리 선택시 sub option 으로 카테고리 목록 나와야 함 -->
                   <option value="category">카테고리</option>
                 </select>
              <input id="searchKeyword" type="text" class="form-control col-8 mr-3" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
              
              <!-- 카테고리 선택시 -->
              <select class="custom-select selectBar mr-3" id="selectCategory">
                <option value="security">아이디정보/보안</option>
                <option value="pay">결제</option>
                <option value="group">모임</option>
                <option value="etc">기타</option>
               </select>

               <!-- 날짜 선택시 -->
               <div id="selectDate" class="col-8">
                 <input
                 id="startDate"
                 name="startDate"
                 type="date"
                 class="form-control validate mr-4"
                 value="2021-12-10"
                 />
                 ~
                 <input
                 id="endDate"
                 name="endDate"
                 type="date"
                 class="form-control validate ml-4 mr-4"
                 value="2021-12-15"
                 />                
               </div>
               
               <br>
               <div class="col-12" style="margin: auto;">
                 <button class="btn btn-primary col mt-3 rounded" type="submit"><span class="font-weight-bold">검 색</span></button>
               </div>
              
              
            </form>
            <!-- 회원목록 테이블 -->
            <div class="row tm-content-row  mt-5">
              <table class="table mb-3 mt-1">
                <thead>
                  <tr>
                    <th scope="security">아이디정보/보안</th>
                    <th scope="pay">결제</th>
                    <th scope="col">그룹 웨어</th>
                    <th scope="etc">기타</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td onclick="openView()">[결제]</td>
                    <td>kh1231</td>
                    <td>프리미엄 모임 결제 관련 문의입니다.</td>
                    <td>처리 중</td>
                  <tr>
                    <td>1</td>
                    <td>[결제]</td>
                    <td>kh1231</td>
                    <td>프리미엄 모임 결제 관련 문의입니다.</td>
                    <td>처리 중</td>
                  </tr>              
                  <tr>
                    <td>1</td>
                    <td>[회원 탈퇴]</td>
                    <td>kh1231</td>
                    <td>프리미엄 모임 결제 관련 문의입니다.</td>
                    <td>처리 중</td>
                  </tr>              
                  <tr>
                    <td>1</td>
                    <td>[결제]</td>
                    <td>kh1231</td>
                    <td>프리미엄 모임 결제 관련 문의입니다.</td>
                    <td>처리 중</td>
                  </tr>              
                  <tr>
                    <td>1</td>
                    <td>[결제]</td>
                    <td>kh1231</td>
                    <td>프리미엄 모임 결제 관련 문의입니다.</td>
                    <td style="">처리 중</td>
                  </tr>              
                  <tr>
                    <td>1</td>
                    <td>[결제]</td>
                    <td>kh1231</td>
                    <td>프리미엄 모임 결제 관련 문의입니다.</td>
                    <td style="font-weight: bold; color:rgba(25, 165, 44, 0.74)">완료</td>
                  </tr>
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
      </div>

<script>
  function openView(inquiryNo){
    const width = 0;
    const height = 0;
    const x = (screen.availWidth - width) / 2 + screen.availLeft;
    const y = (screen.availHeight - height) / 2 + screen.availTop;
    const url = `${pageContext.request.contextPath}/admin/QnA_Popup.jsp`;
    open(url, 'popup', `width=400, height=400, left=\${x}, top=\${y}`);
  };

  function search2(){
    if($(search1).val() == "category"){
      console.log("카테고리");

      $(searchKeyword).prop("style", "display: none");
      $(selectCategory).prop("style", "display: inline");
      $(selectDate).prop("style", "display: none");

    } else if($(search1).val() == "regDate"){
      console.log("날짜");
      $(selectDate).prop("style", "display: inline-flex; align-items: center; color: white");
      $(searchKeyword).prop("style", "display: none");
      $(selectCategory).prop("style", "display: none");

    } else{
      console.log("카테고리/날짜 제외");
      $(searchKeyword).prop("style", "display: inline");
      $(selectCategory).prop("style", "display: none");
      $(selectDate).prop("style", "display: none");
    }
  }
</script>

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>