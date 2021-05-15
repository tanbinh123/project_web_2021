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

	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>TITLE</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="course" items="${pageResponse.data}">
				<tr>
					<td>${course.id}</td>
					<td><a href="/admin/course/${course.id}"> ${course.title}
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<c:if test="${pageResponse.pagination._page gt '1' }">
		<a
			href="/admin/courses?_page=${pageResponse.pagination._page-1}&_limit=${pageResponse.pagination._limit}${pageResponse.pagination._filter}">Previous</a>
	</c:if>

	<c:if
		test="${pageResponse.pagination._page lt pageResponse.pagination._totalRows/pageResponse.pagination._limit }">
		<a
			href="/admin/courses?_page=${pageResponse.pagination._page+1}&_limit=${pageResponse.pagination._limit}${pageResponse.pagination._filter}">Next</a>
	</c:if>
	<%-- <c:forEach var="i" begin="1"
		end="${pageResponse.pagination._totalRows}" step="1"
		varStatus="status">
		<c:out value="${i}" />
	</c:forEach> --%>
	<script>
		var pagination = JSON
				.parse('${pageResponse.pagination.toJsonString()}');
		console.log("pagination", pagination);
		var data = JSON.parse('${pageResponse.data[0].toJsonString()}');
		console.log("data", data);
	</script>

</body>
</html>
