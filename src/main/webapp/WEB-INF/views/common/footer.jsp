<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Footer-->
<hr>
<footer class="py-5" style="margin-top: 0; padding-top: 0;">
	<div class="footer-container">
		<div class="footer-up-box" style="display: flex;">
			<div>
				<img id="footer_logo" src="${pageContext.request.contextPath }/resources/images/cosmoslogo_black.png" alt="">
			</div>
			<div class="footer-list">
				<ul style="display: flex; justify-content: space-between;">
					<li style="display: flex; flex-direction: column;"><span class="footer-list-content">cosmos </span> <span>cosmos소개</span></li>
					<li><span class="footer-list-content"></span><a class="nav-link" href="${pageContext.request.contextPath}/main/qa.do">문의사항</a></li>
					<li><span class="footer-list-content"></span><a class="nav-link" href="${pageContext.request.contextPath}/main/noticeList.do">공지사항</a></li>
					<li><span class="footer-list-content"></span><a class="nav-link" href="${pageContext.request.contextPath}/group/groupSearch.do">Search</a></li>
				</ul>
			</div>
		</div>
		<hr>
		<div class="footer-down-box">
			<div class="footer-cosmos-info">
				<ul>
					<br>
					<li><span class="m-0 text-center">사업자등록번호 : 000-00-00000</span></li>
					<li><span class="m-0 text-center">주소 : 서울시 강남구 테헤란로</span></li>
					<li><span class="m-0 text-center">고객센터 : 1000-0000</span></li>
					<li><span class="m-0 text-center">Copyright &copy; Your Website 2021</span></li>
				</ul>
			</div>
			<div class="logo-box">
				<ul style="display: flex;">
					<li><img class="sns_logo" id="facebook_logo" src="${pageContext.request.contextPath }/resources/images/facebook.png" alt=""></li>
					<li><img class="sns_logo" id="github_logo" src="${pageContext.request.contextPath }/resources/images/github.png" alt=""></li>
					<li><img class="sns_logo" id="insta_logo" src="${pageContext.request.contextPath }/resources/images/Instagram.jpg" alt=""></li>
					<li><img class="sns_logo" id="youtube_logo" src="${pageContext.request.contextPath }/resources/images/youtube.png" alt=""></li>
				</ul>
			</div>
		</div>
	</div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
</body>
</html>