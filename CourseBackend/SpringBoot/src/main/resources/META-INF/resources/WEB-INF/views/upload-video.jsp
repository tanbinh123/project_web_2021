<!DOCTYPE html>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Upload Video</title>
<link rel="stylesheet" href="/admin/css/courses.css" />
<link rel="shortcut icon" type="image/png" href="/favicon.ico" />
</head>

<body>

	<form action="/admin/upload/video/multipartfile" method="post"  enctype="multipart/form-data" >
		<table>
			<tr>
				<td><label for=file>File</label></td>
				<td><input id="file" type="file" name="file" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Upload" /></td>
			</tr>
		</table>
	</form>
	<script>
		
	</script>

</body>
</html>
