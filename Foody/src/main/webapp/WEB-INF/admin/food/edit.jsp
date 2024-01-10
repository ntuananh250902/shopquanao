<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa món ăn</title>

</head>
<body>
	<h1>Chỉnh sửa món ăn</h1>	
	
	<s:form action="updateFoodAction" method="POST" enctype="multipart/form-data" validate="true">
		<input type="hidden" name="id" value='<s:property value="food.id"/>'/>	
		
		<s:textfield label="Tên sản phẩm" id="tenmonan" name="tenmonan" value="%{food.ten }"  /> 
		<s:textfield id="gia" name="gia" label="Giá sản phẩm" value="%{food.gia }" />
		Hình: <img width='80' src='./img/<s:property value="food.hinh"/>'/><br/>		
		<s:file name="hinh" label="Chọn hình" accept="image/png, image/jpeg, image/gif"></s:file>
		<s:submit/>
	</s:form>	
	<script>
	
	</script>
</body>
</html>
