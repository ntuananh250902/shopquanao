<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YAME</title>

</head>
<body>
	<h1>Thêm sản phẩm</h1>	
	
	<s:form action="storeFoodAction" method="POST" enctype="multipart/form-data" validate="true">
			
	    <s:textfield label="Tên sản phẩm" id="tenmonan" name="tenmonan"  /> 
		<s:textfield id="gia" name="gia" label="Giá sản phẩm"  />		
		<s:file name="hinh" label="Chọn hình cho sản phẩm" accept="image/png, image/jpeg, image/gif"
		></s:file>
			
		<s:submit/>
	</s:form>	
	<script>
	
	</script>
</body>
</html>
