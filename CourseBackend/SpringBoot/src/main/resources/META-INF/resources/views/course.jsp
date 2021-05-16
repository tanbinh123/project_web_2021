<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		<form:input type="hidden" path="id" id="id" />
		<form:input type="hidden" id="deleted" path="deleted" />
		<form:input type="hidden" id="updateAt" path="updateAt" />

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
		var deleteLearnig=function(b){
			console.log(".delete-learning");
			b.preventDefault();
			var btn = b.target;
			var tmp=document.getElementById(btn.getAttribute('learning-index'));
			tmp.children[1].value="1";
			tmp.style="display: none;";
			}
			if(indexL>0)
		document.querySelectorAll(".delete-learning").forEach((e)=>{
			
			e.addEventListener('click',deleteLearnig);
			});
		var indexL=${fullcourse.learnings.size()};
		document.querySelector("#add-learnings").addEventListener('click',function(b){
			b.preventDefault();
			console.log("#add-learnings");
				var tmp=document.getElementById('learnings');
				 var tag = document.createElement("div");
				 tag.style="display: flex;";
				 tag.id="learning-index-"+indexL;
				 var id = document.createElement("input");
				 id.type="hidden";
				 id.name="learnings["+indexL+"].id";
				 
				 var deleted = document.createElement("input");
				 deleted.type="hidden";
				 deleted.value="0";
				 deleted.name="learnings["+indexL+"].deleted";
				 var learning = document.createElement("input");
				 learning.name="learnings["+indexL+"].learning";
				 var btn = document.createElement("button");
				 btn.setAttribute('learning-index',"learning-index-"+indexL);
				 btn.setAttribute('class',"delete-learning");
				 var text = document.createTextNode("Delete");
				 learning.value="";
				 btn.appendChild(text);
				 btn.addEventListener('click',deleteLearnig);
			  	 tag.appendChild(id);
			  	 tag.appendChild(deleted);
			  	 tag.appendChild(learning);
			  	 tag.appendChild(btn);
	  			tmp.appendChild(tag);
	  			indexL++;
				
			});
		
		
		
		
		var deletePart=function(b){
			console.log(".delete-part");
			b.preventDefault();
			var btn = b.target;
			var tmp=document.getElementById(btn.getAttribute('part-index'));
			tmp.children[1].value="1";
			tmp.style="display: none;";
			}
			if(indexP>0)
		document.querySelectorAll(".delete-part").forEach((e)=>{
			
			e.addEventListener('click',deletePart);
			});
		var indexP=${fullcourse.parts.size()} ;
		
		document.querySelector("#add-parts").addEventListener('click',function(b){
			b.preventDefault();
			console.log("#add-parts");
				var tmp=document.getElementById('parts');
				 var tag = document.createElement("div");
				 tag.style="display: flex;";
				 tag.id="part-index-"+indexP;
				 var id = document.createElement("input");
				 id.type="hidden";
				 //id.value="0";
				 id.name="parts["+indexL+"].id";
				 
				 var deleted = document.createElement("input");
				 deleted.type="hidden";
				 deleted.value="0";
				 deleted.name="parts["+indexP+"].deleted";
				 var learning = document.createElement("input");
				 learning.name="parts["+indexP+"].title";
				 var btn = document.createElement("button");
				 btn.setAttribute('part-index',"part-index-"+indexP);
				 btn.setAttribute('class',"delete-part");
				 var text = document.createTextNode("Delete");
				 learning.value="";
				 btn.appendChild(text);
				 btn.addEventListener('click',deletePart);
			  	 tag.appendChild(id);
			  	 tag.appendChild(deleted);
			  	 tag.appendChild(learning);
			  	 tag.appendChild(btn);
	  			tmp.appendChild(tag);
	  			indexP++;
				
			});
		
				
	</script>
</body>
</html>
