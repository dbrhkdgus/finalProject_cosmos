<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="그룹 검색" name="title"/>
</jsp:include>
		<!-- Page header with logo and tagline-->
        <!-- Page content-->
        <div class="container">
            <div class="search-parent-category">
                <ul class="nav nav-tabs">
                    <li class="nav-item" style="margin: 0;">
                      <a class="nav-link active" aria-current="page" href="#">ALL</a>
                    </li>
                    <li class="nav-item" style="margin: 0;">
                      <a class="nav-link" href="#">웹개발</a>
                    </li>
                    <li class="nav-item" style="margin: 0;">
                      <a class="nav-link" href="#">프론트엔드</a>
                    </li>
                    <li class="nav-item" style="margin: 0;">
                      <a class="nav-link href="#">백엔드</a>
                    </li>
                    <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">풀스택</a>
                      </li>
                      <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">모바일 앱 개발</a>
                      </li>
                      <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">프로그래밍 언어</a>
                      </li>
                      <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">알고리즘</a>
                      </li>
                      <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">데이터베이스</a>
                      </li>
                       <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">게임개발</a>
                      </li>
                  
                  </ul>
            </div>
            <div class="search-child-category">
                 <ul class="child-category-all">
                    <li><a href="">웹개발</a></li>
                    <li><a href="">프론트엔드</a></li>
                    <li><a href="">백엔드</a></li>
                    <li><a href="">풀스택</a></li>
                    <li><a href="">모바일 앱 개발</a></li>
                    <li><a href="">프로그래밍 언어</a></li>
                    <li><a href="">알고리즘</a></li>
                    <li><a href="">데이터베이스</a></li>
                </ul> 
            </div>
            <hr style="height: 0.5px; color: #8B6AD3; margin-bottom: 50px;">
            <div class="search-outer">
                <!-- 서치 메뉴 정렬및 검색기능  -->
                <div class="search-outer-top">
                    
                    <div class="search-outer-top left">
                    <p style="margin-bottom:20px;" id="class-amount">100개의 클래스</p>
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/group/groupEnroll.do';">그룹 생성</button>
                    </div>
                    
                    <div class="search-outer-top right">
                    <select class="form-select search-select" aria-label="Default select example">
                      <option selected>Open this select menu</option>
                      <option value="1">One</option>
                      <option value="2">Two</option>
                      <option value="3">Three</option>
                    </select>
                    <div class="input-group mb-3 search-input">
                        <input type="text" class="form-control" placeholder="강의를 찾아보세요"  aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
                      </div>
                    </div>
                      
                </div>

                <!-- Blog entries-->
                  <div class="col-lg-8" style="display: contents;">
                    
                    <!-- Nested row for non-featured blog posts-->
                    <div class="search-outer">
                        <div class="search-inner">
                            <!-- Blog post-->
                            <div class="card mb-4 search-card">
                                <a href="${pageContext.request.contextPath}/group/groupDetail.do"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                        alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">January 1, 2021</div>
                                    <h2 class="card-title h4">Post Title</h2>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                                        nulla.</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4 search-card">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                        alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">January 1, 2021</div>
                                    <h2 class="card-title h4">Post Title</h2>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                                        nulla.</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4 search-card">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                        alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">January 1, 2021</div>
                                    <h2 class="card-title h4">Post Title</h2>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                                        nulla.</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                        </div>
                        <div class="search-inner">
                            <!-- Blog post-->
                            <div class="card mb-4 search-card">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                        alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">January 1, 2021</div>
                                    <h2 class="card-title h4">Post Title</h2>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                                        nulla.</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4 search-card">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                        alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">January 1, 2021</div>
                                    <h2 class="card-title h4">Post Title</h2>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                                        nulla.</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4 search-card">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                        alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">January 1, 2021</div>
                                    <h2 class="card-title h4">Post Title</h2>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                                        nulla.</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div> 
                            
                        </div>
                        <div class="search-inner">
                            <!-- Blog post-->
                            <div class="card mb-4 search-card">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                        alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">January 1, 2021</div>
                                    <h2 class="card-title h4">Post Title</h2>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                                        nulla.</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4 search-card">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                        alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">January 1, 2021</div>
                                    <h2 class="card-title h4">Post Title</h2>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                                        nulla.</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4 search-card">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                        alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">January 1, 2021</div>
                                    <h2 class="card-title h4">Post Title</h2>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                                        nulla.</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div> 
                            
                        </div>
                    </div>
                    <!-- Pagination-->
                    <nav aria-label="Pagination" >
                        <hr style="height: 0.5px; color: #8B6AD3; margin-bottom: 50px;">
                        <ul class="pagination justify-content-center my-4 "  >
                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                            <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
                            <li class="page-item"><a class="page-link" href="#!">2</a></li>
                            <li class="page-item"><a class="page-link" href="#!">3</a></li>
                            <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
                            <li class="page-item"><a class="page-link" href="#!">15</a></li>
                            <li class="page-item"><a class="page-link" href="#!">Older</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>