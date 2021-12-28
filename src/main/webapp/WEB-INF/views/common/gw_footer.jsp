<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!-- Footer-->
    <!-- 그룹원 리스트(축약버전) (오른쪽) -->
     <div class="test-member-list-small bg-light">
      <div class="online-member-list">
		<c:forEach var="profile" items="${memberProfileRenamedFilenameList }">
	        <div class="test-member-profile">
	          <div class="member-profile-img-box">
	            <img class="btn-profile member-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${profile}" alt="">
	          </div>
	        </div>
		</c:forEach>
        
        

      </div>


      <div class="offline-member-list">
  
        <div class="test-member-profile">
          <div class="member-profile-img-box">
            <img class="offline member-profile-img" src="https://i.pinimg.com/564x/9e/60/60/9e6060db90687be57c52ca5c5566c487.jpg" alt="">
          </div>
        </div>

      </div>
    </div> 
<%-- <div class="modal fade" id="gw-DM-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">채팅방 개설하기</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="createChatRoomFrm" method="post" action="${pageContext.request.contextPath }/gw/chat/createChatRoom.do">
          <div class="modal-body mx-3">
            <div class="md-form mb-5">
              <label  for="defaultForm-email">채팅방 이름</label>
              <input type="text" name="chatRoomName" class="form-control validate" placeholder="새로운 채팅방">
            </div>
            <div class="md-form mb-5">
              <label  for="defaultForm-email">채팅방 인원을 선택하세요.</label>
              <div class="create-chat-radio-box mb-3">
	              <input type="radio" name="chatRoomOpenType"  value="all" >전체
	              <input type="radio" name="chatRoomOpenType" value="select">선택
              </div>
              <div class="modal-member-box" style="border: 1px solid black; ">
              </div>
            </div>
          </div>
          <input type="hidden" name="groupNo" value="${currGroupNo }" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-createChatRoom">개설</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div> --%>
  </section>
</main>
<script>
$("#gw-DM-modal").hide();
$(".btn-profile").click((e)=>{
	$("#gw-DM-modal").show();
});
</script>
  </body>

</html>
