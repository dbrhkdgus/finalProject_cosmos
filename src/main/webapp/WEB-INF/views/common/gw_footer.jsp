<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!-- Footer-->
    <!-- 그룹원 리스트(축약버전) (오른쪽) -->
     <div class="test-member-list-small bg-light">
      <div class="online-member-list">
		<c:forEach var="profile" items="${memberProfileRenamedFilenameList }">
	        <div class="test-member-profile">
	          <div class="member-profile-img-box">
	            <img class="member-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${profile}" alt="">
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

  </section>
</main>

  </body>
  </body>
</html>
