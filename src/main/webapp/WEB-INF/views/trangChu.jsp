<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>

<%@include file="/common/css_js_head.jsp"%>



</head>

<body id="page-top" onLoad="thongBao()">

	<%@ include file="/common/navbar.jsp"%>

	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5"
				src="${pageContext.request.contextPath }/resources/template/trangChu/assets/img/logo.png"
				alt="">
			<!-- Masthead Heading-->
			<h1 class="masthead-heading mb-0">${email}</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="pre-wrap masthead-subheading font-weight-light mb-0">Poly shop - Hận hạnh phục vụ quý khách</p>
		</div>
	</header>
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-->
			<div class="text-center">
				<h2 class="page-section-heading text-secondary mb-0 d-inline-block">DANH
					SÁCH MẶT HÀNG</h2>
			</div>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Portfolio Grid Items-->
			<div class="row justify-content-center">
				<c:forEach var="sanpham" items="${sanphams}">
					<%@ include file="/common/forloop/matHang.jsp"%>
				</c:forEach>
			</div>
		</div>
	</section>


	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<div class="text-center">
				<h2 class="page-section-heading d-inline-block text-white">GIỚI
					THIỆU</h2>
			</div>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-4 ml-auto">
					<p class="pre-wrap lead">Poly codelearn cung cấp cho các bạn các khóa học miễn phí, từ cơ bản đến nâng cao. Các khóa học đa dạng: SQL, Java, C++, C#, lập trình frontend (HTML, CSS, JS...). Ngoài ra còn các môn kỹ năng mềm, các bài thi cực kì bổ ích cho các bạn ôn luyện</p>
				</div>
				<div class="col-lg-4 mr-auto">
					<p class="pre-wrap lead">Bạn có thể tạo một tài khoản và theo dõi quá trình học của mình. Sau khi học xong mỗi môn học bạn sẽ thấy mình đã biết thêm nhiều điều. Chúc bạn học tốt.</p>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<div class="text-center">
				<h2 class="page-section-heading text-secondary d-inline-block mb-0">LIÊN HỆ</h2>
			</div>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Content-->
			<div class="row justify-content-center">
				<div class="col-lg-4">
					<div class="d-flex flex-column align-items-center">
						<div class="icon-contact mb-3">
							<i class="fas fa-mobile-alt"></i>
						</div>
						<div class="text-muted">Phone</div>
						<div class="lead font-weight-bold">0934 344 149</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="d-flex flex-column align-items-center">
						<div class="icon-contact mb-3">
							<i class="far fa-envelope"></i>
						</div>
						<div class="text-muted">Email</div>
						<a class="lead font-weight-bold"
							href="mailto:ducnmph09201@fpt.edu.vn">ducnmph09201@fpt.edu.vn</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<p id="showError">${AdminError}</p>
	<script type="text/javascript">
		function thongBao() {
			var temp = document.getElementById("showError").innerHTML;
			if (temp !== "") {
				alert("Bạn phải là admin mới vào được trang này");
			}
		}
	</script>

	<%@include file="/common/footer.jsp"%>

	<%@include file="/common/js_body.jsp"%>

</body>

</html>