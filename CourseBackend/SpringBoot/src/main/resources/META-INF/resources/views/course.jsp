<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="en">
<head>
<meta charset="UTF-8"> 
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Full Course</title>
<link rel="stylesheet" href="/admin/css/course.css" />
<link rel="shortcut icon" type="image/png" href="/favicon.ico" />
</head>
<body>
	<h1>Detail Course</h1>
	<h4>Course Id ${fullcourse.id}</h4>

	<form:form modelAttribute="fullcourse">
		<form:input type="hidden" path="id" id="id" />
		<form:input type="hidden" id="deleted" path="deleted" />
		<form:input type="hidden" id="updateAt" path="updateAt" />
		<input type="hidden" id="sizeLearnings" value="${(fullcourse.learnings==null)?0:fullcourse.learnings.size()}" />
		<input type="hidden" id="sizeParts" value="${(fullcourse.parts==null)?0:fullcourse.parts.size()}"/>

		<table>
			<tr>
				<td><label for="title">Title</label></td>
				<td><form:input id="title" path="title" /></td>
			</tr>
			<tr>
				<td><label for="price">Price</label></td>
				<td><form:input id="price" path="price" /></td>
			</tr>
			<tr>
				<td><label for="price">Format Price</label></td>
				<td><span> <fmt:formatNumber type="number"
							pattern="###,###,### VND" value="${fullcourse.price}" var="pat" />
				</span> ${fn:replace(pat, ",", " ")}</td>
			</tr>

			<tr>
				<td><label for="category">Category</label></td>
				<td><form:input id="category" path="category.name"
						list="categories" /> <datalist id="categories">
						<c:forEach var="category" items="${categories}">
							<option data-value="${category.id}">${category.name}</option>
						</c:forEach>

					</datalist> <form:input type="hidden" path="categoryId" id="category-hidden" /></td>
			</tr>

			<tr>
				<td><label for="poster">Poster</label></td>
				<td><form:input id="poster" path="poster.image" list="images" />
					<datalist id="images">
						<c:forEach var="poster" items="${images}">
							<option data-value="${poster.id}">${poster.image}</option>
						</c:forEach>

					</datalist> <form:input type="hidden" path="imgPosterId" id="poster-hidden" />
					<%-- <form:input type="hidden" path="poster.path" id="poster-hidden" /> --%>

				</td>
			</tr>

			<tr>
				<td><label>UpdateAt</label></td>
				<td><fmt:formatDate pattern="EEE MMM dd HH:mm:ss zzz yyyy"
						value="${fullcourse.updateAt}" /> <%-- <c:out value="${fullcourse.updateAt}"/> --%>
				</td>
			</tr>



			<tr>
				<td><label for="description">Description</label></td>
				<td><form:textarea id="description" rows="5" cols="120"
						path="description" /></td>
			</tr>
			<tr>
				<td><label>Learnings</label></td>
				<td>
					<div id="learnings">

						<c:forEach var="learning" items="${fullcourse.learnings}"
							varStatus="status">
							<div id="learning-index-${status.index}" style="display: flex;">
								<form:input type="hidden" path="learnings[${status.index}].id" />
								<form:input type="hidden"
									path="learnings[${status.index}].deleted" />
								<form:input path="learnings[${status.index}].learning" />
								<button learning-index="learning-index-${status.index}"
									class="delete-learning">Delete</button>

							</div>
						</c:forEach>
					</div>
					<button id="add-learnings">Add</button>
				</td>
			</tr>

			<tr>
				<td><label>Parts</label></td>
				<td>
					<div id="parts">

						<c:forEach var="part" items="${fullcourse.parts}"
							varStatus="status">
							<div id="part-index-${status.index}" style="display: flex;">
								<form:input type="hidden" path="parts[${status.index}].id" />
								<form:input type="hidden" path="parts[${status.index}].deleted" />
								<form:input path="parts[${status.index}].title" />
								<button part-index="part-index-${status.index}"
									class="delete-part">Delete</button>

							</div>
						</c:forEach>
					</div>
					<button id="add-parts">Add</button>
				</td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="Save Changes" /></td>
			</tr>
		</table>
	</form:form>

	Click on this
	<strong><a href="/admin/courses">link</a></strong> to visit list course
	page.
	<script>
		/* var indexL = parseInt("${fullcourse.learnings.size()}");
		var indexP = parseInt("${fullcourse.parts.size()}"); */
	</script>
	<script src="/admin/js/course.js">
		
	</script>


</body>
</html>
