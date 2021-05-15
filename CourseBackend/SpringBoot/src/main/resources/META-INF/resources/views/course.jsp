<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Full Course</title>
<link rel="stylesheet" href="/admin/css/course.css" />
<link rel="shortcut icon" type="image/png" href="/favicon.ico" />
</head>
<body>
	<h1>Detail Course</h1>
	<h4>Course Id ${fullcourse.id}</h4>

	<form:form modelAttribute="fullcourse">
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
				<td><label for="deleted">Deleted</label></td>
				<td><form:input id="deleted" path="deleted" /></td>
			</tr>
			<tr>
				<td><label for="category">Category</label></td>
				<td><form:input id="category" path="category.name"
						list="categories" /> <datalist id="categories">
						<c:forEach var="category" items="${categories}">
							<option data-value="${category.id}">${category.name}</option>
						</c:forEach>

					</datalist> <form:input type="hidden" path="category.id" id="category-hidden" /></td>
			</tr>

			<tr>
				<td><label for="poster">Poster</label></td>
				<td><form:input id="poster" path="poster.image" list="images" />
					<datalist id="images">
						<c:forEach var="poster" items="${images}">
							<option data-value="${poster.id}">${poster.image}</option>
						</c:forEach>

					</datalist> <form:input type="hidden" path="poster.id" id="poster-hidden" /></td>
			</tr>

			<tr>
				<td><label for="updateAt">UpdateAt</label></td>
				<td><form:input id="updateAt" path="updateAt" /></td>
			</tr>



			<tr>
				<td><label for="description">Description</label></td>
				<td><form:textarea id="description" rows="5" cols="120"
						path="description" /></td>
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
		document
				.querySelectorAll('input[list]').forEach((e)=>{
					e.addEventListener(
							'input',
							function(e) {
								var input = e.target, list = input
										.getAttribute('list'), options = document
										.querySelectorAll('#' + list + ' option'), hiddenInput = document
										.getElementById(input.getAttribute('id')
												+ '-hidden'), inputValue = input.value;

								hiddenInput.value = "0";

								for (var i = 0; i < options.length; i++) {
									var option = options[i];

									if (option.innerText === inputValue) {
										hiddenInput.value = option
												.getAttribute('data-value');
										break;
									}
								}
							});
				});
				
	</script>
</body>
</html>
