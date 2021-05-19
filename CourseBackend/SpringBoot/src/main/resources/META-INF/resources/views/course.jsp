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
	<datalist id="videos">
		<c:forEach var="video" items="${videos}">
			<option data-value="${video.id}">${video.urlVideo}</option>
		</c:forEach>

	</datalist>
	<datalist id="images">
		<c:forEach var="poster" items="${images}">
			<option data-value="${poster.id}">${poster.image}</option>
		</c:forEach>
	</datalist>

	<h1>Detail Course</h1>
	<h4>Course Id ${fullcourse.id}</h4>

	<form:form modelAttribute="fullcourse">
		<form:input type="hidden" path="id" id="id" />
		<form:input type="hidden" id="deleted" path="deleted" />
		<form:input type="hidden" id="updateAt" path="updateAt" />
		<input type="hidden" id="sizeLearnings"
			value="${(fullcourse.learnings==null)?0:fullcourse.learnings.size()}" />
		<input type="hidden" id="sizeParts"
			value="${(fullcourse.parts==null)?0:fullcourse.parts.size()}" />

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
				<td>
					<input id="poster" name="poster.path" value="${fullcourse.poster.image}" list="images" />
					<form:input type="hidden" path="imgPosterId" id="poster-hidden" />
				</td>
			</tr>

			<tr>
				<td><label for="demo">Demo</label></td>
				<td><form:input id="demo" path="demo.urlVideo" list="videos" />
					<form:input type="hidden" path="videoDemoId" id="demo-hidden" /></td>
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
				<td colspan="2"><br /></td>
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
				<td colspan="2"><br /></td>
			</tr>
			<tr>
				<td><label>Parts</label></td>
				<td>
					<div id="parts" style="overflow: scroll;">

						<c:forEach var="part" items="${fullcourse.parts}"
							varStatus="status">
							<div style="display: block;">

								<div id="part-index-${status.index}" style="display: flex;">
									<form:input type="hidden" path="parts[${status.index}].id" />
									<form:input type="hidden" path="parts[${status.index}].deleted" />
									<form:input path="parts[${status.index}].title" />

									<button part-index="part-index-${status.index}"
										class="delete-part">Delete</button>

								</div>
								<div style="display: flex">
									<div>lessons</div>
									<div id="part-index-${status.index}-lessons"
										style="width: 100%;">
										<c:forEach var="lesson" items="${part.lessons}"
											varStatus="statusLesson">

											<div
												id="part-index-${status.index}-lesson-index-${statusLesson.index}"
												style="display: flex; flex: 1; overflow: auto;">
												<form:input type="hidden"
													path="parts[${status.index}].lessons[${statusLesson.index}].id" />
												<form:input type="hidden"
													path="parts[${status.index}].lessons[${statusLesson.index}].deleted" />
												<form:input
													path="parts[${status.index}].lessons[${statusLesson.index}].description" />
												<form:input id="video-hidden" type="hidden"
													path="parts[${status.index}].lessons[${statusLesson.index}].videoId" />
												<form:input id="video" list="videos"
													path="parts[${status.index}].lessons[${statusLesson.index}].video.urlVideo" />
												<%-- <input type="text"
													value="${lesson.video.urlVideo}" /> --%>

												<button
													delete-lesson-id="part-index-${status.index}-lesson-index-${statusLesson.index}"
													class="delete-lesson">Delete</button>

											</div>
										</c:forEach>

									</div>

								</div>
								<input type="hidden"
									id="part-index-${status.index}-size-lessons"
									value="${(part.lessons==null)?0:part.lessons.size()}" />
								<button part-index="${status.index}"
									lessons-wrap-id="part-index-${status.index}-lessons"
									index="part-index-${status.index}-size-lessons"
									id="add-lessons">Add lesson</button>

							</div>
						</c:forEach>
					</div>
					<button id="add-parts">Add Part</button>
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
	</script>
	<script src="/admin/js/course.js">
		
	</script>
</body>
</html>
