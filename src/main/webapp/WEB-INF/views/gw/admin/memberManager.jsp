<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	

<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
  <div class="workspace-box">

    <div class="study-join-admin-box">
      <div class="study-member-table">
        <h4>그룹원 관리</h4>

 <table class="table table-sm text-center">
          <thead>
            <tr>
              <th>번호</th>
              <th>이름</th>
              <th>역할</th>
              <th>가입일</th>
              <th>관리</th>
            </tr>
          </thead>
	          <tbody>
	          
	            <c:forEach var="memberList" items="${memberList }" >
		           <c:forEach var="acceptList" items="${acceptApplocationGroupList }" varStatus="vs">
		           <c:if test="${memberList.id eq acceptList.memberId}">
	 					<c:set var="j" value="${j+1}"/>
	     					 <tr>
	 					 <td>${j}</td>
			              <td>${memberList.nickname}</td>	             
			              <c:if test="${fn:contains(acceptList.role, 'G')}">
			             	 <td>그룹장</td>
			              </c:if>
			              <c:if test="${fn:contains(acceptList.role, 'P')}">
			              	<td>일반멤버</td>
			              </c:if>
			              <c:if test="${fn:contains(acceptList.role, 'M')}">
			             	 <td>그룹장</td>
			              </c:if>
			              <td><fmt:formatDate value="${acceptList.joinRegDate}" pattern="yy-MM-dd"/></td>
			           <!--    <td>2020-12-16</td> -->
			              <td>
			             
			                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
			                  <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"/>
			                  <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
			                </svg>
			              </td>
			            </tr>
			          </c:if>
		        </c:forEach> 
		       </c:forEach> 
			  </tbody>
        </table>
      </div>
      <div class="study-join-table">
        <h4>그룹 가입 요청</h4>
        <form:form 
         id="checkValidList"
        action="${pageContext.request.contextPath }/gw/admin/groupAccept.do" method="post" >
            <table class="table table-sm text-center">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>이름</th>
                  <th>질문답변</th>
                  <th>가입신청일</th>
                  <th>선택</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="memberList" items="${memberList}" >
                   <c:forEach var="watingList" items="${waitingApplocationGroupList }" varStatus="vs"  >
                            <c:if test="${memberList.id eq watingList.memberId}" >
                            
                            <c:set var="i" value="${i+1}"/>
                            <tr>
                              <td>${i}</td>
                              <td>${memberList.nickname}</td>                 
                              <td>${watingList.answer }</td>
                              <td><fmt:formatDate value="${watingList.joinRegDate}" pattern="yy-MM-dd"/></td>
                              <td><input type="checkbox" name="checkValid" id="" value="${memberList.id}"></td>
                            </tr>
                           
                            </c:if>
                  </c:forEach> 
              </c:forEach>
              </tbody>
            </table>
      </div>
      <div class="study-join-buttons text-center">
      
        <button type="button" class="btn btn-primary" value="Y" name="checkYN" id="checkY">가입 승인</button>
        <button type="button" class="btn btn-secondary" value="N" name="checkYN" id="checkN">가입 거절</button>
      </div>
      <input type="hidden" name = "groupNo" value="${groupNo}">
     </form:form>
    </div>
    
  </div>
<script>
//가입승인
function refreshMemList(){
    location.reload();
}
$("[id='checkY']").click((e) => {
    e.preventDefault();
    
let rowNum = $("input[name='checkValid']:checked").length;
var idList = [];

for(i=0; i<rowNum; i++) {
    let id= $("input[name='checkValid']:checked").eq(i).val()
       idList.push(id); 
};    
    var idString = idList.toString();        
    console.log(idString);    
 
        $.ajax({
            url: `${pageContext.request.contextPath}/gw/admin/groupAccept.do?groupNo=${groupNo}`,
            dataType: "json", //돌려받는거
            traditional : true,
            data:  {
                "idList": idString                
            },
            contentType: "application/json; charset=utf-8", //주는타입
            success(data){
                alert(data.msg);
                refreshMemList();
        },
        error: console.log
      }) 
});    
        
  
//가입거절
  
  function refreshMemList(){
        location.reload();
    }
  $("[id='checkN']").click((e) => {
        e.preventDefault();
        
    let rowNum = $("input[name='checkValid']:checked").length;
    var idList = [];
   
    for(i=0; i<rowNum; i++) {
        let id= $("input[name='checkValid']:checked").eq(i).val()
           idList.push(id); 
    };    
        var idString = idList.toString();        
        console.log(idString);    
     
            $.ajax({
                url: `${pageContext.request.contextPath}/gw/admin/groupRefuse.do?groupNo=${groupNo}`,
                dataType: "json", //돌려받는거
                traditional : true,
                data:  {
                    "idList": idString                
                },
                contentType: "application/json; charset=utf-8", //주는타입
                success(data){
                    alert(data.msg);
                    refreshMemList();
            },
            error: console.log
          }) 
  });    
</script>


<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>