import React from "react";
var {CanvasJSChart} = require('./../assets/canvasjs.react');
function Charts(props) {
     const options = {
        animationEnabled: true,
        exportEnabled: true,
        theme: "dark2", // "light1", "dark1", "dark2"
        title:{
            text: "Trip Expenses"
        },
        data: [{
            type: "pie",
            indexLabel: "{label}: {y}%",		
            startAngle: -90,
            dataPoints: [
                { y: 20, label: "Airfare" },
                { y: 24, label: "Food & Drinks" },
                { y: 20, label: "Accomodation" },
                { y: 14, label: "Transportation" },
                { y: 12, label: "Activities" },
                { y: 10, label: "Misc" }	
            ]
        }]
    } 
    console.log("helo");
    return (
    <div>
      
        <h1>Chart</h1>
         <CanvasJSChart options = {options}  
         /> 
    
    </div>
    );
}
export default Charts