<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>List Course</title>
<link rel="stylesheet" href="/admin/css/courses.css" />
<link rel="shortcut icon" type="image/png" href="/favicon.ico" />
</head>

<body>

	<form action="/admin/upload/image/multipartfile" method="post"  enctype="multipart/form-data" >
		<input type="hidden" id="id" />
		<input type="text" name="name" />
		<input type="file"  />
	</form>
	<script>
		
	</script>

</body>
</html>
