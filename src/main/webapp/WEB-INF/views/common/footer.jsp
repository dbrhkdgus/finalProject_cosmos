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
				<ul style="display: flex; justify-content: space-between; align-items: flex-end;">
					
					<li style="display: flex; flex-direction: column;" ><span class="footer-list-content"><a href="${pageContext.request.contextPath}/main/about.do">cosmos</a> </span> <span>cosmos소개</span></li>
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
					<li><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="red" class="bi bi-youtube" viewBox="0 0 16 16">
					  <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"/>
					</svg></li>
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