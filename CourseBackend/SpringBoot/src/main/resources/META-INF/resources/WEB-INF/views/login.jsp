<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

	<form:form action="/admin/login" method="POST" modelAttribute="formLogin">
		<table>
			<tr>
				<td><label for="username">Username</label></td>
				<td><form:input id="username" path="username" /> <form:input type="hidden"
						path="urlReturn" /></td>
			</tr>
			<tr>
				<td><label for="password">Password</label></td>
				<td><form:input id="password" path="password" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Login" /></td>
			</tr>
		</table>
	</form:form>
	<script>
		
	</script>
</body>
</html>
