import { CCol } from "@coreui/react";
import { CChartBar } from "@coreui/react-chartjs";
import React from "react";

function CustomBar(props) {
  const bar = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
      {
        label: "Tài khoản",
        backgroundColor: "#2ecc71",
        borderColor: "#27ae60",
        borderWidth: 1,
        hoverBackgroundColor: "#27ae60",
        hoverBorderColor: "#2ecc71",
        data: [65, 59, 80, 81, 56, 55, 40],
      },
    ],
  };
  const options = {
    // tooltips: {
    //   enabled: false,
    //   custom: customTooltips,
    // },
    maintainAspectRatio: false,
  };
  return (
    <CCol sm="6" lg="3">
      <h4>Bar</h4>
      <div className="chart-wrapper">
        <CChartBar
          type="bar"
          datasets={bar.datasets}
          options={options}
          labels="months"
        />
      </div>
      <hr />
    </CCol>
  );
}

export default CustomBar;
