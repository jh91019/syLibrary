<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<!-- ========== All CSS files ========= -->
<link rel="stylesheet" href="/syLibrary/include/user.css">
<script src="http://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(function() {
	reservCheck();
});

 function reservCheck(){
	let m_id = "${sessionScope.mId}";
	let r_reservation = [];
	let b_id = [];
	let b_name = [];
	$.ajax({
		url:"/syLibrary/res_book_servlet/reservation.do",
		type : "get",
		data:{"mId":m_id},
		dataType: "json",
		contentType: 'text/html;charset=utf-8',
		success: function(data){
			console.log(data);
		 	for (let i = 0; i < data.length; i++){
		 		if(data[i].r_reservation == 0){
					swal({
						text : "대출가능한 책이 있습니다.",
						buttons : [ "취소", "확인" ],
					}).then(function(isConfirmed) {
						//대출기능추가
					});
		 		}
			}
		},
		error: function(request, status, error){
			swal('에러 발생', '관리자에게 문의바랍니다.', 'error');
		}
	});
}
 
function checkOut(r_bookid){
	let m_id = "${sessionScope.mId}";
	if(m_id != ""){
		$.ajax({
			url:"/syLibrary/checkout_servlet/checkout.do",
			data:{"m_id":m_id,"r_bookid":r_bookid},
			success: function(txt){
				myConfirm(txt,
						"대출이 완료되었습니다. 나의서재에서 신청현황을 조회할 수 있습니다.", 
						"info",
						"/syLibrary/myLibrary_servlet/myLibray_info.do?mId="+m_id);
			},
			error: function(request, status, error){
				swal('에러 발생', '관리자에게 문의바랍니다.', 'error');
			}
		});
	}
}

function reDelete(r_bookid) {
	let m_id = "${sessionScope.mId}";
	swal({
		text : "선택하신 도서를 예약취소하시겠습니까?",
		buttons : [ "취소", "확인" ],
	}).then(function(isConfirmed) {
		if (isConfirmed) {
			$.ajax({
				url : "/syLibrary/res_book_servlet/re_delete.do",
				type : "post",
				data : {
					"m_id" : m_id,
					"r_bookid" : r_bookid
				},
				success : function(data) {
					swal({
						text : "예약이 취소되었습니다.",
						icon: 'success',
					}).then(function(isConfirmed){
						location.reload();
					});
				},
				error : function() {
					swal('에러 발생', '관리자에게 문의바랍니다.', 'error');
				}
			});
		}
	})
}
</script>
</head>
<body>
	<div class="container min-vh-100">
		<h3 class="text-bold">
			<img src="/syLibrary/resources/images/myLibrary/reserv.png"
				width="35px" height="35px"> 예약 중인 도서
		</h3>
		<hr>
		<c:choose>
			<c:when test="${myReBook.size() > 0 }">
				<div class="card-style mb-30">
					<h4>예약 현황건수 : ${myReBook[0].re_book_cnt}건</h4>
					<hr>
					<ul>
						<c:forEach var="myRList" items="${myReBook}">
							<li style="list-style: none;">
								<div class="row mb-4">
									<!-- 이미지 -->
									<div class="col col-md-auto">
										<img src="${myRList.b_url}"
											style="width: 150px; height: 200px;">
									</div>
									<!-- 이미지 끝-->
									<!-- 도서 설명 -->
									<div class="col detail">
										<p>
											<a
												href="/syLibrary/search_servlet/bookInfo.do?b_id=${myRList.b_id}">${myRList.b_name}</a>
										</p>
										<p>
											<span>작가 : ${myRList.b_author} </span> <span> 출판사 :
												${myRList.b_pub} </span> <span>발행연도 : ${myRList.b_year}</span>
										</p>
										<p>
											<c:set var="now" value="<%=new java.util.Date()%>" />
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"
												var="today" />

											<span>예약일 : ${myRList.r_regdate}</span> <span>예약순번
												:${myRList.r_reservation}</span> <span></span>
										</p>
										<p>
											<input type="button" value="예약취소" id="main-btn"
												onclick="reDelete(${myRList.b_id})"> <input
												type="button" value="대출하기" id="main-btn"
												onclick="checkOut(${myRList.r_bookid})">
										</p>
									</div>
									<!--도서설명 끝 -->
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div class="card-style mb-30" style="height: 150px;">
					<h4>예약 현황건수 : ${myReBook.size()} 건</h4>
					<hr>
					<h5 class="text-bold" align="center">현재 예약 중인 도서가 없습니다.</h5>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
<%@ include file="../common/footer.jsp"%>
</html>