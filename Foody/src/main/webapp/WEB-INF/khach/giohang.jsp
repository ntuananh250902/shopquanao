<%@ taglib uri="/struts-tags" prefix="s"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Giỏ hàng</title>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
		<div class="container px-4 px-lg-5">
			<a href="homeKhachAction"> <img class="img-thumbnail" width='90'
				src=' ./img/yame-f-logo-white.jpg' />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						href="homeKhachAction">Trang chính</a></li>

					<li class="nav-item"><a class="nav-link" href="#!">Giới
							thiệu</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Danh
							mục sản phẩm</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							@foreach (var i in (List
							<Danhmuc>)ViewBag.danhmuc) {
							<li><a class="dropdown-item" asp-action="Index1"
								asp-route-id="@i.MaDm">@i.Ten </a></li>
							}
							<li><a class="dropdown-item" asp-action="Index2">Mô hình
									VIP</a></li>
						</ul></li>
					<form asp-action="MathangByTen">
						<table>
							<tr>
								<td><input class="form-control" type="text" name="keyword"
									placeholder="Nhập tên sản phẩm" /></td>
								<td><input class="btn btn-info" type="submit" value="Tìm" />
								</td>
							</tr>
						</table>
					</form>
				</ul>
				<div class="d-flex">
					<a href="viewCartAction" class="btn btn-outline-light"><i
						class="bi bi-cart3"></i> Giỏ hàng <span
						class="badge bg-danger text-white ms-1 rounded-pill"><s:property
								value="%{numberOfElements}" /></span></a>&nbsp;
					<s:if test="%{nguoidung != null}">
						<a href="logoutUser" class="btn btn-outline-light"><i
							class="bi bi-person"></i> Đăng xuất</a>
					</s:if>
					<s:else>
						<a href="login" class="btn btn-outline-light"><i
							class="bi bi-person"></i> Đăng nhập</a>
					</s:else>
				</div>
			</div>
		</div>
	</nav>

	<h1>Giỏ hàng của bạn</h1>
	<table class="table" border="1">
		<tr>
			<th>Tên sản phẩm</th>
			<th>Số lượng</th>
			<th>Giá</th>
			<th>Hình ảnh</th>
			<th>Thành tiền</th>
		</tr>
		<s:iterator var="food" value="foodlist">
			<tr>
				<td><s:property value="ten" /></td>
				<td><s:form action="updateAction" method="POST"
						enctype="multipart/form-data" validate="true">
						<s:hidden name="id" value="%{iddatmon}" />
						<div class="row">
							<div class="col">				
								<input type="number" name="soluong" id="soluong"
									value="<s:property value='soluong' />" />
							</div>
							<div class="col">
								<input class="btn btn-warning" type="submit" value="Cập nhật" />
							</div>
						</div>
					</s:form></td>
				<td><s:property value="gia" /></td>
				<td><img class="img-thumbnail" width='80'
					src=' ./img/<s:property value="hinh"/>' /></td>

				<td><s:property value="thanhtien" /></td>
				<td><a asp-action="RemoveItem" asp-route-id="@i.MatHang.MaMh"
					class="btn btn-danger"
					href='deleteAction?id=<s:property value="iddatmon"/>'
					onclick="return confirm('Bạn chắc chắn xóa?')">Xóa</a></td>
			</tr>
		</s:iterator>
	</table>
	<div class="text-end">
		<a class="btn btn-info" asp-action="CheckOut">Thanh toán</a>
	</div>

	<footer class="py-5 bg-dark">
		<div class="text-center mb-5">
			<a class="text-warning" href="#top"><i class="bi bi-chevron-up"
				style="font-size: 3rem; font-weight: bold; color: white;"></i></a>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-6 text-light">
					<h4>Yame</h4>
					<p>
						<b><i>Địa chỉ:</i></b> 18 Ung Văn Khiêm, phường Đông Xuyên, TP
						Long Xuyên, An Giang<br> <b><i>Điện thoại:</i></b> 0523
						088423<br> <b><i>Email:</i></b> Paperzonevn@gmail.com
					</p>
				</div>
				<div class="col-3 text-muted">
					<h4>DANH MỤC HÀNG</h4>
					<a class="dropdown-item" asp-action="Index1" asp-route-id="1">Anime
						vs Game</a> <a class="dropdown-item" asp-action="Index1"
						asp-route-id="2">Phương Tiện</a> <a class="dropdown-item"
						asp-action="Index1" asp-route-id="3">Động vật vs Thực vật</a>

				</div>
				<div class="col-3 text-muted">
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
