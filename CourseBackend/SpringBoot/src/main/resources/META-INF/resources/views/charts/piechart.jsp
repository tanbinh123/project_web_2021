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


<script type="text/javascript">
  window.onload = function () { 
  	var tilteInput = document.getElementById('title');
  	var dataPoints = document.getElementById('dataPoints');
	var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: tilteInput.value
	},
	data: [{
		type: "pie",
		startAngle: 25,
		toolTipContent: "<b>{label}</b>: {y}%",
		showInLegend: "true",
		legendText: "{label}",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}%",
		dataPoints: JSON.parse(dataPoints.value)
	}]
});
chart.render();
  }
  </script>
</head>

<body>
	<div style="display:flex">
	<div id="chartContainer" style="height: 300px; width: 500px;"></div>
	<div>
		<form:form modelAttribute="pieChart">
			<form:input id="title" type="hidden" path="title" />
			<input id="dataPoints" type="hidden" value='${pieChart.toJsonStringFromDataPoints()}' />
			<table>
				<%-- <tr>
					<td><label for="title">Title</label></td>
					<td><form:input id="title" path="title" /></td>
				</tr> --%>
			</table>
			<tr>
				<td colspan="2"><input type="submit" value="Login" /></td>
			</tr>
		</form:form>
	</div>	
	</div>
	<script type="text/javascript" src="/asserts/canvasjs/canvasjs.min.js"></script>
	<script>		
	</script>
</body>
</html>
