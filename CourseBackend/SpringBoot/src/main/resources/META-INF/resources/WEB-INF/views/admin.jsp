<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>List Course</title>
<link rel="stylesheet" href="/admin/css/courses.css" />
<link rel="shortcut icon" type="image/png" href="/favicon.ico" />
</head>

<body>
	<table>
		<tr>
			<td><a href="/admin/upload/image/multipartfile"> Upload
					Image</a></td>
		</tr>
		<tr>
			<td><a href="/admin/upload/video/multipartfile"> Upload
					Video</a></td>
		</tr>
		<tr>
			<td><a href="/admin/courses"> Courses</a></td>
		</tr>
		<tr>
			<td><a href="/admin/images"> Images</a></td>
		</tr>
		<tr>
			<td><a href="/admin/videos"> Videos</a></td>
		</tr>
		<tr>
			<td><a href="/admin/upload/course"> Upload Course</a></td>
		</tr>
		<tr>
			<td><a href="/admin/charts"> Charts</a></td>
		</tr>
	</table>
	Click on this
	<strong><a href="${homeUrl}">link</a></strong> to visit Home Page
	<script>
		
	</script>

</body>
</html>
