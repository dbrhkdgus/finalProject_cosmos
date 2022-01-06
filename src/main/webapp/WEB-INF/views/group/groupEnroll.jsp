<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="그룹 생성" name="title" />
</jsp:include>
<script type="text/javascript">
window.addEventListener("load", function(){
	$.ajax({
		url:"<%= request.getContextPath() %>/group/groupCategoryOne.do?${_csrf.parameterName}=${_csrf.token}",
		method: "GET",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success(data){
			const $CATEdiv = $(`<select class="form-select" id="selectCateOne" name="categoryNo" aria-label="Default select example" onchange="getItem()"></select>`);
			const htmlfix = `<option value=0 selected>상위 카테고리</option>`;
			$CATEdiv.append(htmlfix);
			$.each(data, (k, v) => { 
				let html = `<option value=\${k}>\${v}</option>`;
				$CATEdiv.append(html);
			});
			$("#fCate").html($CATEdiv);
		},
		error(xhr,textStatus,err){
			console.log(xhr,textStatus,err);
		}
	});
});  
function getItem(){
	$((e)=>{
		  $.ajax({
				url:"<%= request.getContextPath() %>/group/groupCategoryTwo.do?${_csrf.parameterName}=${_csrf.token}",
				method: "GET",
				dataType: "json",
				data: {categoryOneNo : $("#selectCateOne option:selected").val()},
				success(data){
					const $CATETWOdiv = $(`<div class="group-text-input">`);
					$.each(data, (k, v) => {
						let html = `<div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="cateCheckBox" id="inlineCheckbox\${k}" value=\${k}><label class="form-check-label" for="inlineCheckbox\${k}">\${v}</label></div>`;
						$CATETWOdiv.append(html);
					});
						$CATETWOdiv.append(`</div>`);
					$("#sCate").html($CATETWOdiv);
				},
				error(xhr,textStatus,err){
					console.log(xhr,textStatus,err);
				}
			});
	});
};


window.addEventListener("load", function(){
	
});
</script>

	<main class="my-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-header">스터디 그룹 생성</div>
						<div class="card-body">
							<form:form id="groupEnrollFrm" name="my-form" action="${pageContext.request.contextPath}/group/insertGroup.do?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
								<input type="hidden" name="memberId" value="<sec:authentication property="principal.id"/>"/>
								<div class="form-group row">
									<label for="full_name" class="col-md-4 col-form-label text-md-right">그룹명</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="group-name" class="form-control" name="groupName">
									</div>
								</div>
								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">상위 카테고리</label>
									<div class="col-md-6 group-text-input" id="fCate">
									</div>
								</div>
								<div class="form-group row">
									<label for="full_name" class="col-md-4 col-form-label text-md-right">하위 카테고리</label>
									<div class="col-md-6 group-text-input" id="sCate">
									</div>
								</div>
								<div class="form-group row">
									<label for="present_address" class="col-md-4 col-form-label text-md-right">모집글 제목</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="study-title" class="form-control" name="giTitle">
									</div>
								</div>
								<div class="form-group row">
									<label for="phone_number" class="col-md-4 col-form-label text-md-right">배너 이미지</label>
									<div class="col-md-6 group-text-input">
										<input class="form-control" type="file" id="upFile" name="upFile">
									</div>
								</div>
								<div class="form-group row">
									<label for="present_address" class="col-md-4 col-form-label text-md-right">모집정원</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="member-number" name="groupPool" class="form-control">
									</div>
								</div>
								<div class="form-group row">
								<label for="permanent_address" class="col-md-4 col-form-label text-md-right"></label>
								<div class="col-md-6 group-text-input gender-radio">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="flexRadioDefault1" onclick="pay()">
										<label class="form-check-label" for="flexRadioDefault1">프리미엄 그룹 결제</label>
									</div>
									<div class="form-check">
										<input type="hidden" name="groupCharge" id="pInput" value="F" readonly>
									</div>
								</div>
							</div>
								<div class="form-group row">
									<label for="permanent_address" class="col-md-4 col-form-label text-md-right">위치</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="location" class="form-control" name="groupLocation">
									</div>
									<div id="map"  style="width: 500px; height: 300px; margin-left: 28%; margin-top: 20px;">
									</div>
								</div>
								<div class="form-check text-center">
									<input class="form-check-input" type="checkbox" id="groupPrivate" name="groupPrivate" value="L">
									<label for="groupPrivate"> &nbsp;조회에서 제외되는 비밀그룹으로 생성하기 </label>
								</div>							
								<div class="form-group row">
									<label for="permanent_address" class="col-md-4 col-form-label text-md-right">스터디를 소개해주세요!</label>
									<div class="col-md-6 group-text-input">
										<div class="group-text-input form-floating col-md-6">
											<textarea class="form-control" placeholder="Leave a comment here" id="giContent1" name="giContent" style="height: 100px; width: 200%; resize: none;"></textarea>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label for="permanent_address" class="col-md-4 col-form-label text-md-right">이런 분들이 들으면 좋아요!</label>
									<div class="col-md-6 group-text-input">
										<div class="group-text-input form-floating col-md-6">
											<textarea class="form-control" placeholder="Leave a comment here" id="giContent2" name="giContent" style="height: 100px; width: 200%; resize: none;"></textarea>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label for="permanent_address" class="col-md-4 col-form-label text-md-right">스터디는 이렇게 진행됩니다!</label>
									<div class="col-md-6 group-text-input">
										<div class="group-text-input form-floating col-md-6">
											<textarea class="form-control" placeholder="Leave a comment here" id="giContent3" name="giContent" style="height: 100px; width: 200%; resize: none;"></textarea>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label for="permanent_address" class="col-md-4 col-form-label text-md-right">꼭! 지켜주세요.</label>
									<div class="col-md-6 group-text-input">
										<div class="group-text-input form-floating col-md-6">
											<textarea class="form-control" placeholder="Leave a comment here" id="giContent4" name="giContent" style="height: 100px; width: 200%; resize: none;"></textarea>
										</div>
									</div>
								</div>
								<div class="col-md-6 offset-md-4 group-create-button">
									<button type="submit" class="btn btn-primary">그룹생성</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>
	<script>
	
	var openWin;
	
	function pay() {
        // window.name = "부모창 이름"; 
        window.name = "parentForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        window.open("${pageContext.request.contextPath}/kakao/kakaoPay.do",
        		"childForm", "width=350, height=500, resizable = yes, scrollbars = yes"); 
    };
	// 없습니다. 반드시 파일을 선택해야 합니다
/* 	function EnrollFormSubmit() {		
		const filename = $("[name=upFile]").prop("files")[0].name
		if(filename =undefined || filename == null){
			filename = ("https://cdn.dribbble.com/users/3398149/screenshots/9873711/media/81018d8c3595c458138d49bde716d2f9.jpg?compress=1&resize=800x600")
		}
	} */
/* 	document.my-form.onsubmit = e => {
		const filename = $("[name=upFile]").prop("files")[0].name
		if(filename =undefined || filename == null){
			filename = ("https://cdn.dribbble.com/users/3398149/screenshots/9873711/media/81018d8c3595c458138d49bde716d2f9.jpg?compress=1&resize=800x600")
		}
	} */
		/* function YnCheck(obj) {
			var checked = obj.checked;
			if(checked) {
				obj.value="L";
			} else {
				obj.value="U";
			}
		}
		var checkYn="${data.groupPrivate}";
		if(checkYn=="L") {
			$("#groupPrivate").prop("checked", true);
		} else {
			$("#groupPrivate").prop("checked", false);
		}
		if($("#groupPrivate").is(':checked')==true) {
			data.set("groupPrivate", "L");
		} else {
			data.set("groupPrivate", "U");
		} */
		
		/* form 유효성 검사 */
		$("[id='groupEnrollFrm']").submit(function(){
			const $cateOne = $("#selectCateOne");
			const $cateTwo = $('input:checkbox[name="cateCheckBox"]');
			const $groupName = $("#group-name");
			const $studyTitle = $("#study-title");
			const $upFile = $("#upFile");
			const $memberNumber = $("#member-number");
			const $location = $("#location");
			const $giContent1 = $("#giContent1");
			const $giContent2 = $("#giContent2");
			const $giContent3 = $("#giContent3");
			const $giContent4 = $("#giContent4");
			console.log($cateOne.val());
			console.log($('input[type="checkbox"]:checked').val());
			console.log($groupName.val());
			console.log($studyTitle.val());
			console.log($upFile.val());
			console.log($memberNumber.val());
			console.log($location.val());
			console.log($giContent1.val());
			console.log($giContent2.val());
			console.log($giContent3.val());
			console.log($giContent4.val());
			
			if($("#group-name").val() == null || $("#group-name").val() == 'undefined' || $("#group-name").val() == ''){
				$groupName.focus();
				return false;
			}
			if($("#selectCateOne option:selected").val() == 0){
				$cateOne.focus();
				return false;
			}
			if($('input:checkbox[name="cateCheckBox"]:checked').val() == null || $('input:checkbox[name="cateCheckBox"]:checked').val() == 'undefined' || $('input:checkbox[name="cateCheckBox"]:checked').val() == ''){
				$cateOne.focus();
				return false;
			}
			if($("#study-title").val() == null || $("#study-title").val() == 'undefined' || $("#study-title").val() == ''){
				$studyTitle.focus();
				return false;
			}
			
			if($("#member-number").val() == null || $("#member-number").val() == 'undefined' || $("#member-number").val() == 0){
				$memberNumber.focus();
				return false;
			}
			if($("#location").val() == null || $("#location").val() == 'undefined' || $("#location").val() == ''){
				$location.focus();
				return false;
			}
			if($("#giContent1").val() == null || $("#giContent1").val() == 'undefined' || $("#giContent1").val() == ''){
				$giContent1.focus();
				return false;
			}
			if($("#giContent2").val() == null || $("#giContent2").val() == 'undefined' || $("#giContent2").val() == ''){
				$giContent2.focus();
				return false;
			}
			if($("#giContent3").val() == null || $("#giContent3").val() == 'undefined' || $("#giContent3").val() == ''){
				$giContent3.focus();
				return false;
			}
			if($("#giContent4").val() == null || $("#giContent4").val() == 'undefined' || $("#giContent4").val() == ''){
				$giContent4.focus();
				return false;
			}
			return true;
		});
		
		var charged = document.getElementsByName('groupCharge');
		var isCharged;
		for(var i = 0; i < charged.length; i++) {
			if(charged[i].checked) {
				isCharged = charged[i].value;
			}
		};
		
		
		$(() => {
			$("[name=upFile]").change((e) => {
				// 1.파일명 가져오기
				const file = $(e.target).prop("files")[0];
				const filename = file?.name; // optional chaining 객체가 undefined경우에도 오류가 나지 않는다.
				console.dir(e.target);
				console.log(filename);
				
				// 2.label에 설정하기
				const $label = $(e.target).next();
				if(file != undefined)
					$label.html(filename);
				else
					$label.html("파일을 선택하세요.");
				
			});
			
			
		});
		</script>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753f0f237470af5e83541545d143b9c3&libraries=services"></script>
		
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 1 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		var markers = [];
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		$("#location").keyup((e)=>{
			
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($("#location").val(), function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		     
		            // 마커를 생성합니다
		            var marker = new kakao.maps.Marker({
		            	map: map,
		                position: coords
		            });

		            
		            // 생성된 마커를 배열에 추가합니다
		            markers.push(marker);
		        

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		}); 
		});
		
		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		    function setMarkers(map) {
			    for (var i = 0; i < markers.length; i++) {
			        markers[i].setMap(map);
			    }            
			}
			function hideMarkers() {
			    setMarkers(null);    
			}
		
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			hideMarkers();
			
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">법정동 주소정보</span>' + 
		                            detailAddr + 
		                        '</div>';
					// input#location에 값 출력
					$("#location").val(result[0].road_address.address_name);
		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);

		           
		        }   
		    });
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}

		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');

		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }    
		};

		
		
		</script>
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>