import React from "react";
import { CChartLine } from "@coreui/react-chartjs";

const MainChartExample = (attributes) => {
  const { dataset = [], labels = [], maxValue = 0 } = attributes;

  // const random = (min, max) => {
  //   return Math.floor(Math.random() * (max - min + 1) + min);
  // };

  // const defaultDatasets = (() => {
  //   let elements = 27;
  //   const data1 = [];
  //   const data2 = [];
  //   const data3 = [];
  //   for (let i = 0; i <= elements; i++) {
  //     data1.push(random(50, 200));
  //     data2.push(random(80, 100));
  //     data3.push(65);
  //   }
  //   return [
  //     {
  //       label: "My First dataset",
  //       backgroundColor: hexToRgba(brandInfo, 10),
  //       borderColor: brandInfo,
  //       pointHoverBackgroundColor: brandInfo,
  //       borderWidth: 2,
  //       data: data1,
  //     },
  //     {
  //       label: "My Second dataset",
  //       backgroundColor: "transparent",
  //       borderColor: brandSuccess,
  //       pointHoverBackgroundColor: brandSuccess,
  //       borderWidth: 2,
  //       data: data2,
  //     },
  //     {
  //       label: "My Third dataset",
  //       backgroundColor: "transparent",
  //       borderColor: brandDanger,
  //       pointHoverBackgroundColor: brandDanger,
  //       borderWidth: 1,
  //       borderDash: [8, 5],
  //       data: data3,
  //     },
  //   ];
  // })();

  const defaultOptions = (() => {
    return {
      maintainAspectRatio: false,
      legend: {
        display: false,
      },
      scales: {
        xAxes: [
          {
            gridLines: {
              drawOnChartArea: false,
            },
          },
        ],
        yAxes: [
          {
            ticks: {
              beginAtZero: true,
              maxTicksLimit: 5,
              stepSize: Math.ceil(maxValue / 5),
              max: maxValue,
            },
            gridLines: {
              display: true,
            },
          },
        ],
      },
      elements: {
        point: {
          radius: 0,
          hitRadius: 10,
          hoverRadius: 4,
          hoverBorderWidth: 3,
        },
      },
    };
  })();

  // render
  return (
    <CChartLine
      {...attributes}
      datasets={dataset}
      options={defaultOptions}
      labels={labels}
    />
  );
};

export default MainChartExample;
