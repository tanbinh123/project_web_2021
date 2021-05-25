
var addLess=function(b) {
	b.preventDefault();
	var sizeE=document.getElementById(b.target.getAttribute("index"));
	var indexP = b.target.getAttribute("part-index");
	var index = parseInt(sizeE.value);
	// console.log("#add-lessons",b.target.getAttribute("lessons-wrap-id"));
	var tmp = document.getElementById(b.target.getAttribute("lessons-wrap-id"));
	var tag = document.createElement("div");
	tag.style = "display: flex;";
	tag.id = "part-index-" + indexP +"-lesson-index-"+index;
	var id = document.createElement("input");
	id.type = "hidden";
	
	id.name = "parts[" + indexP + "].lessons["+index+"].id";

	var deleted = document.createElement("input");
	deleted.type = "hidden";
	deleted.value = "0";
	deleted.name = "parts[" + indexP + "].lessons["+index+"].deleted";
	var name = document.createElement("input");
	name.name = "parts[" + indexP + "].lessons["+index+"].description";
	
	var videoId = document.createElement("input");
	videoId.name = "parts[" + indexP + "].lessons["+index+"].videoId";
	videoId.id="part-index-"+indexP+"-lesson-index-"+index+"-video-hidden";
	videoId.type="hidden";
	var video = document.createElement("input");
	video.name = "parts[" + indexP + "].lessons["+index+"].urlVideo";
	video.id="part-index-"+indexP+"-lesson-index-"+index+"-video";
	video.setAttribute('list','videos');	
	video.addEventListener(
			'input',funcListChoose
	);
	var btn = document.createElement("button");
	btn.setAttribute('delete-lesson-id', "part-index-" + indexP+"-lesson-index-"+index);
	btn.setAttribute('class', "delete-lesson");
	
	btn.addEventListener('click', deleteLesson);
	var text = document.createTextNode("Delete");
	name.value = "";
	btn.appendChild(text);
	btn.addEventListener('click', deleteLesson);
	tag.appendChild(id);
	tag.appendChild(deleted);
	tag.appendChild(name);
	tag.appendChild(videoId);
	tag.appendChild(video);
	tag.appendChild(btn);
	tmp.appendChild(tag);
	sizeE.value=index+1;
};
var funcListChoose=function (e) {
				var input = e.target, list = input
					.getAttribute('list'), options = document
						.querySelectorAll('#' + list + ' option'), hiddenInput = document
							.getElementById(input.getAttribute('id')
								+ '-hidden'), inputValue = input.value;

				hiddenInput.value = null;

				for (var i = 0; i < options.length; i++) {
					var option = options[i];

					if (option.innerText === inputValue) {
						hiddenInput.value = option
							.getAttribute('data-value');
						break;
					}
				}
			};

document
	.querySelectorAll('input[list]').forEach((e) => {
		e.addEventListener(
			'input',funcListChoose
			);
	});
var deleteLearnig = function(b) {
	console.log(".delete-learning");
	b.preventDefault();
	var btn = b.target;
	var tmp = document.getElementById(btn.getAttribute('learning-index'));
	tmp.children[1].value = "1";
	tmp.style = "display: none;";
}

document.querySelectorAll(".delete-learning").forEach((e) => {

		e.addEventListener('click', deleteLearnig);
	});

document.querySelector("#add-learnings").addEventListener('click', function(b) {
	b.preventDefault();
	var sizeLearnings= document.getElementById("sizeLearnings");
	var indexL = parseInt(sizeLearnings.value);
	
	console.log("#add-learnings");
	var tmp = document.getElementById('learnings');
	var tag = document.createElement("div");
	tag.style = "display: flex;";
	tag.id = "learning-index-" + indexL;
	var id = document.createElement("input");
	id.type = "hidden";
	id.name = "learnings[" + indexL + "].id";

	var deleted = document.createElement("input");
	deleted.type = "hidden";
	deleted.value = "0";
	deleted.name = "learnings[" + indexL + "].deleted";
	var learning = document.createElement("input");
	learning.name = "learnings[" + indexL + "].learning";
	var btn = document.createElement("button");
	btn.setAttribute('learning-index', "learning-index-" + indexL);
	btn.setAttribute('class', "delete-learning");
	var text = document.createTextNode("Delete");
	learning.value = "";
	btn.appendChild(text);
	btn.addEventListener('click', deleteLearnig);
	tag.appendChild(id);
	tag.appendChild(deleted);
	tag.appendChild(learning);
	tag.appendChild(btn);
	tmp.appendChild(tag);
	indexL++;
	
	sizeLearnings.value=indexL;

});




var deletePart = function(b) {
	console.log(".delete-part");
	b.preventDefault();
	var btn = b.target;
	var tmp = document.getElementById(btn.getAttribute('part-wrap'));
	tmp.children[0].children[1].value = "1";
	tmp.style = "display: none;";
}

document.querySelectorAll(".delete-part").forEach((e) => {

	e.addEventListener('click', deletePart);
});


document.querySelector("#add-parts").addEventListener('click', function(b) {
	b.preventDefault();
	var sizeParts= document.getElementById("sizeParts");
	var indexP = parseInt(sizeParts.value);
	console.log("#add-parts");
	var divContainer = document.getElementById('parts');
	var lessonContainer = document.createElement("div");
	lessonContainer.id="part-index-"+indexP+"-lessons";
	lessonContainer.style="width:100%;"
	var divContainerFlex = document.createElement("div");
	divContainerFlex.style = "display: flex;";
	var tag = document.createElement("div");
	tag.style = "display: flex;";
	tag.id = "part-index-" + indexP;
	var id = document.createElement("input");
	id.type = "hidden";
	
	id.name = "parts[" + indexP + "].id";

	var deleted = document.createElement("input");
	deleted.type = "hidden";
	deleted.value = "0";
	deleted.name = "parts[" + indexP + "].deleted";
	var learning = document.createElement("input");
	learning.name = "parts[" + indexP + "].title";
	
	
	var btn = document.createElement("button");
	btn.setAttribute('part-index', "part-index-" + indexP);
	btn.setAttribute('class', "delete-part");
	
	
	var titleLesson = document.createElement("div");
	titleLesson.appendChild(document.createTextNode("Lessons"));
	var divLesson = document.createElement("div");
	divLesson.style="display: flex";
	var sizeLessons = document.createElement("input");
	sizeLessons.type="hidden";
	sizeLessons.id = "part-index-"+indexP+"size-lessons";
	sizeLessons.value=0;
	var addL = document.createElement("button");
	addL.setAttribute('part-index', "part-index-" + indexP);
	addL.setAttribute('class', "add-lessons");
	addL.appendChild(document.createTextNode("Add Lesson"));
	addL.addEventListener('click', addLess);
	addL.setAttribute('index', "part-index-"+indexP+"size-lessons");
	addL.setAttribute("lessons-wrap-id","part-index-"+indexP+"-lessons");
	addL.setAttribute("part-index",indexP);
	
	divLesson.appendChild(sizeLessons);
	divLesson.appendChild(addL);
	
	
	var text = document.createTextNode("Delete");
	learning.value = "";
	btn.appendChild(text);
	btn.setAttribute("part-wrap", "all-part-index-"+indexP);
	btn.addEventListener('click', deletePart);
	tag.appendChild(id);
	tag.appendChild(deleted);
	tag.appendChild(learning);
	tag.appendChild(btn);
	//lessonContainer.appendChild(tag);
	
	divContainerFlex.appendChild(titleLesson);
	divContainerFlex.appendChild(lessonContainer);
	divContainer.appendChild(tag);
	divContainer.appendChild(divContainerFlex);
	divContainer.appendChild(divLesson);
	indexP++;
	sizeParts.value=indexP++;

});


var deleteLesson = function(b) {
	b.preventDefault();
	var btn = b.target;
	console.log(".delete-lesson",btn.getAttribute('delete-lesson-id'));
	var tmp = document.getElementById(btn.getAttribute('delete-lesson-id'));
	// tmp.querySelector('input')[1].value=1;
	
	tmp.children[1].value = "1";
	
	tmp.style = "display: none;";
}

document.querySelectorAll(".delete-lesson").forEach((e) => {
	e.addEventListener('click', deleteLesson);
});

document.querySelectorAll(".add-lessons").forEach((e) => {
	e.addEventListener('click', addLess);
});