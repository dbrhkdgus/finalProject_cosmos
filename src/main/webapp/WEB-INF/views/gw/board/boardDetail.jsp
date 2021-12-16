<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<div class="groupware-board-detail-outter">
  <div class="groupware-board-detail-title">
    <hr>
    <p class="text-secondary">카테고리</p>
    <h3>게시글의 제목</h3>
    <p>작성자<span>2021-12-10</span></p>
    <div class="groupware-board-detail-title-btns">
      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
        <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"/>
      </svg>
      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
        <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
      </svg>
    </div>
    <hr>
  </div>

  <div class="groupware-board-detail-content ml-3 mt-3">
      등록된 댓글을 이젠 어뜨케 나열해 줄지... 고민해봐야함
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit similique iure fuga ut assumenda provident minus laborum aliquam nemo. Laudantium soluta provident atque, error velit fuga animi quam illum quaerat.
      Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure quidem ipsam et explicabo amet dolor reiciendis? Eligendi minus cumque deleniti porro perferendis dolorum suscipit ipsam obcaecati repellendus, quam, magnam possimus.
      Repellat soluta ullam voluptatum nisi eius molestias molestiae eaque esse hic aut! Itaque adipisci ea in sequi ullam magni, iusto ut molestias ad similique! Aliquid amet recusandae aspernatur omnis vero?
      Asperiores officia possimus facere voluptates accusantium cupiditate veniam voluptas dignissimos praesentium quasi qui, suscipit, eligendi ex ipsa cumque in fugiat sapiente vitae molestiae itaque! Doloremque delectus reiciendis saepe ratione consectetur!
      Amet aliquid repellendus ratione beatae? Tempora fugit nihil necessitatibus vero incidunt adipisci! Inventore molestias mollitia quo harum consectetur, ullam vel facere neque cupiditate voluptatibus, esse tenetur ut unde cumque architecto.
      Inventore mollitia sed tempore odio nostrum placeat, fugiat soluta vero sunt sequi quia omnis debitis laborum. Labore, eius error in laudantium dignissimos rerum repellat itaque, earum nam magni, suscipit fuga.
      Lorem ipsum dolor sit, amet consectetur adipisicing elit. Unde officia temporibus neque molestias nihil, ab maxime ut perferendis quas nisi accusamus deserunt dignissimos repellat odio optio doloremque rerum reiciendis totam.
      Animi debitis recusandae veritatis deserunt impedit corporis quia alias unde perferendis ullam atque deleniti in, repellat quas explicabo fugiat, dicta nisi quis sit voluptate. Tempora praesentium modi asperiores optio facilis.
      Molestias cupiditate voluptatum rem voluptatem dolorum exercitationem atque, unde eius ratione iste, itaque perferendis quasi expedita error eaque, quisquam id dignissimos recusandae eos provident corrupti quidem ab. Odit, illum facere.
      Autem omnis blanditiis ut nulla reiciendis hic, vel alias veniam eius nostrum, impedit voluptate voluptatem sed magnam rerum eum iusto atque accusamus quibusdam maxime a quidem error? Facilis, ipsam! Laborum.
      Animi fuga vitae delectus praesentium voluptas est ullam repudiandae, quis assumenda, necessitatibus odio quod sed incidunt voluptatum quas accusamus, neque quae quam ut voluptatibus ipsam non consectetur. Cum, commodi quam.
    

  </div>
  <div class="card mb-2">
	<div class="card-header bg-light">
	       
	</div>
	<div class="card-body groupware-board-detail-rep">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-3 groupware-board-detail-rep-name">
				<p>홍길동(loginMember.name)</p>
			</div>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="1"></textarea>
			<button type="button" class="btn btn-dark mt-3 groupware-board-detail-rep-btn-enroll" onClick="javascript:addReply();">등록</button>
		    </li>
		</ul>
	</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

