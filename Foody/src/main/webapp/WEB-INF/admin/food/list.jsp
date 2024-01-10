<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDA</title>
<style>
	table,td,tr,th
	{
		border: 1px solid;
	}
	table
	{
		width:100%;
	}
</style>
</head>
<body>
	<h1>Danh sách sản phẩm</h1>
	
	 <s:if test="hasActionMessages()">
	      <p>
	          <s:actionmessage /> 
	      </p>
	  </s:if>
	<p><a href="createFoodAction">Thêm mới</a>  <a href="homeAdminAction">Trang chủ</a></p>
	<table >
	<tr>
	<th>Tên sản phẩm</th>
	<th>Hình ảnh</th>
	<th>Giá</th>
	<th></th>
	<th></th>
	</tr>

	
		<s:iterator var="food" value="foodlist">
		<tr>
			<td><s:property value="ten"/></td>
			<td><img width='80' src=' ./img/<s:property value="hinh"/>'/></td>
			<td><s:property value="gia"/></td>
			<td><a href='editFoodAction?id=<s:property value="id"/>'>Chỉnh sửa</a></td>
			<td><a href='deleteFoodAction?id=<s:property value="id"/>' onclick="return confirm('Bạn chắc chắn xóa?')">Xóa</a></td>
		</tr>
		</s:iterator>
	
	</table>
	
</body>
</html>
