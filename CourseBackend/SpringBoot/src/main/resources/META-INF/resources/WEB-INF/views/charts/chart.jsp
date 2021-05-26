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

      title:{
        text: tilteInput.value             
      },
      data: [//array of dataSeries              
        { //dataSeries object

         /*** Change type "column" to "bar", "area", "line" or "pie"***/
         type: "column",
         dataPoints: JSON.parse(dataPoints.value)
     }]});

    chart.render();
  }
  </script>
<script type="text/javascript" src="/asserts/canvasjs/canvasjs.min.js"></script>
</head>

<body>

	<div style="display: flex">
		<div id="chartContainer" style="height: 300px; width: 500px;"></div>
		<div>
			<input id="title" type="hidden" value="${pieChart.title}" /> <input
				id="dataPoints" type="hidden"
				value='${pieChart.toJsonStringFromDataPoints()}' />
			<table>
			
				<tr>
					<td colspan="2"><a
						href="/admin/charts/chart-money-categories"><button
								type="button">Money Categories</button></a></td>
				</tr>
				
				<tr>
					<td colspan="2"><a href="/admin/charts"><button
								type="button">Back</button></a></td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript" src="/asserts/canvasjs/canvasjs.min.js"></script>
	<script>		
	</script>
</body>
</html>
