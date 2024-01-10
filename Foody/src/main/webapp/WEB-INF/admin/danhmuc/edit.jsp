<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<title>DDA</title>

</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
		<div class="container px-4 px-lg-5">
			<a href="homeAdminAction"> <img class="img" width='90'
				src=' ./img/yame-footer-logo-white.jpg' />
			</a>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						href="homeAdminAction">TRANG CHỦ</a></li>
					<li class="nav-item"><a class="nav-link" href="listFoodAction">QUẢN
							LÝ SẢN PHẨM</a></li>
					<li class="nav-item"><a class="nav-link" href="listUserAction">QUẢN
							LÝ NGƯỜI DÙNG</a></li>
					<li class="nav-item"><a class="nav-link" href="listDanhMucAction">QUẢN
							LÝ DANH MỤC</a></li>
					<li class="nav-item"><a class="nav-link" href="#">QUẢN
							LÝ GIỎ HÀNG</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">GIỚI
							THIỆU</a></li>

				</ul>
				<div class="d-flex">
					<a href="logoutUser" class="btn btn-outline-light"><i
						class="bi bi-person"></i> ĐĂNG XUẤT</a>
				</div>
			</div>
		</div>
	</nav>
	<h1>Chỉnh sửa danh mục</h1>	
	
	<s:form action="updateDanhMucAction" method="POST" enctype="multipart/form-data" validate="true">
		<input type="hidden" name="id" value='<s:property value="danhmuc.id"/>'/>		
		<s:textfield label="Tên danh mục" id="ten" name="ten" value="%{danhmuc.ten }"  /> 
		<s:submit/>
	</s:form>	
	<footer class="bg-dark text-white py-4 bg-dark">
		<div class="text-center mb-5">
			<a class="text-warning" href="#top"><i class="bi bi-chevron-up"
				style="font-size: 3rem; font-weight: bold; color: white;"></i></a>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-6 text-light">
					<a href="homeKhachAction"> <img class="img img-fluid rounded-0"
						width='200' src=' ./img/yame-footer-logo-white.jpg' />
					</a>
					<p>
						<b><i>Địa chỉ:</i></b> 18 Ung Văn Khiêm, phường Đông Xuyên, TP
						Long Xuyên, An Giang<br> <b><i>Điện thoại:</i></b> 0523
						088423<br> <b><i>Email:</i></b> Paperzonevn@gmail.com
					</p>
				</div>
				<div class="col-3 text-light">
					<h4>DANH MỤC HÀNG</h4>
					<a class="dropdown-item" asp-action="Index1" asp-route-id="1">Anime
						vs Game</a> <a class="dropdown-item" asp-action="Index1"
						asp-route-id="2">Phương Tiện</a> <a class="dropdown-item"
						asp-action="Index1" asp-route-id="3">Động vật vs Thực vật</a>

				</div>
				<div class="col-3 text-light">
					<h4>DỊCH VỤ KHÁCH HÀNG</h4>
					<a href="#" class="list-group-item">Hướng dẫn mua hàng</a> <a
						href="#" class="list-group-item">Câu hỏi thường gặp</a> <a
						href="#" class="list-group-item">Liên hệ với chúng tôi</a>
				</div>
			</div>
			<hr>
			<p class="m-0 text-center text-warning fw-bolder">Copyright
				&copy; Yame.vn</p>
		</div>
	</footer>
</body>
</html>
