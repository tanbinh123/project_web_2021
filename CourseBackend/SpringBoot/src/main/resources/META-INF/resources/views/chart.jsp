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
    var chart = new CanvasJS.Chart("chartContainer", {

      title:{
        text: "Fruits sold in First Quarter"              
      },
      data: [//array of dataSeries              
        { //dataSeries object

         /*** Change type "column" to "bar", "area", "line" or "pie"***/
         type: "column",
         dataPoints: [
         { label: "banana", y: 18 },
         { label: "orange", y: 29 },
         { label: "apple", y: 40 },                                    
         { label: "mango", y: 34 },
         { label: "grape", y: 24 }
         ]
       }
       ]
     });

    chart.render();
  }
  </script>
  <script type="text/javascript" src="/asserts/canvasjs/canvasjs.min.js"></script>
</head>

<body>

	<div id="chartContainer" style="height: 300px; width: 100%;">
  </div>
	<script>
		
	</script>
</body>
</html>
