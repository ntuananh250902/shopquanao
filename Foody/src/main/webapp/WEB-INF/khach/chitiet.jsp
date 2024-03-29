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
<title>DAD</title>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
		<div class="container px-4 px-lg-5">
			<a href="home"> <img class="img-thumbnail" width='90'
				src=' ./img/yame-f-logo-white.jpg' />
			</a>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active" href="home">Trang
							chính</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Giới
							thiệu</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Danh
							mục sản phẩm</a>

						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<s:iterator var="danhmuc" value="danhMucList">
								<li><a style="cursor: pointer;" href="#"
									class="dropdown-item"><s:property value="ten" /></a></li>
							</s:iterator>
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
					<s:if test="%{nguoidung != 0}">
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

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-1">
			<h1>Thông tin</h1>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div>
					<a> <img class="card-img-top"
						src=' ./img/<s:property value="%{food.hinh}"/>' alt="" />
					</a>
				</div>
				<s:form action="submitOrderAction" method="post" validate="true">
					<div class="form-group">
						<p class="form-control-static">
							<s:property value="%{food.ten}" />
						</p>
					</div>
					<div class="form-group">
							<s:textfield id="gia" name="gia" label="Giá" value='%{food.gia}' readonly="true"
							cssClass="form-control" />
						</p>
					</div>
					<div class="form-group">
						<s:textfield id="soluong" name="soluong" label="Số lượng"
							cssClass="form-control" />
					</div>
					<input type="hidden" name="idmonan"
						value='<s:property value="idmonan"/>' />
					<s:submit cssClass="btn btn-primary" value="Thêm vào giỏ hàng" />
				</s:form>
			</div>
		</div>
	</section>

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
