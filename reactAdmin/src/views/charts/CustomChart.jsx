import CIcon from "@coreui/icons-react";
import {
  CButton,
  CButtonGroup,
  CCard,
  CCardBody,
  CCol,
  CRow,
} from "@coreui/react";
import React from "react";
import { getStyle, hexToRgba } from "@coreui/utils";
import MainChartExample from "./MainChartExample";
import { isEmpty } from "src/Tool/Tools";
const brandSuccess = getStyle("success") || "#4dbd74";
const brandInfo = getStyle("info") || "#20a8d8";
const brandDanger = getStyle("danger") || "#f86c6b";
const arrayButton = ["Ngày", "Tháng", "Năm"];
export default function CustomChart(props) {
  const {
    data10Day = {},
    data12Month = {},
    data10Year = {},
    attributes = "",
    title = "",
  } = props;
  const [dataset, setDataset] = React.useState([]);
  const [labels, setLabels] = React.useState([]);
  const [valueButton, setValueButton] = React.useState(1);
  const [data1, setData1] = React.useState([]);
  const [data2, setData2] = React.useState([]);
  const [data3, setData3] = React.useState([]);
  const [maxValue, setMaxValue] = React.useState(0);
  React.useEffect(() => {
    // console.log(data12Month);
    if (!isEmpty(data12Month)) {
      initData1();
      initData2();
      initData3();
    }
    return () => {
      setData1([]);
      setData2([]);
      setData3([]);
    };
  }, [data10Day, data12Month, data10Year]);
  const initData1 = () => {
    let tmpData1 = [];
    Object.keys(data12Month).map((item) => {
      tmpData1.push(data12Month[item][attributes]);
    });
    // console.log(tmpData1);
    setData1(tmpData1);
  };
  const initData2 = () => {
    let tmpData2 = [];
    Object.keys(data10Day).map((item) => {
      tmpData2.push(data10Day[item][attributes]);
    });
    // console.log(tmpData1);
    setData2(tmpData2);
  };
  const initData3 = () => {
    let tmpData3 = [];
    Object.keys(data10Year).map((item) => {
      tmpData3.push(data10Year[item][attributes]);
    });
    // console.log(tmpData1);
    setData3(tmpData3);
  };
  React.useEffect(() => {
    initDataset();
    return () => {
      setDataset([]);
      setLabels([]);
    };
  }, [data10Day, data12Month, data10Year, valueButton]);
  const initDataset = () => {
    if (valueButton === 0) {
      setDataset([
        {
          label: `${title} theo ngày`,
          backgroundColor: hexToRgba(brandSuccess, 10),
          borderColor: brandSuccess,
          pointHoverBackgroundColor: brandSuccess,
          borderWidth: 2,
          data: data2,
        },
      ]);
      setLabels(Object.keys(data10Day));
      setMaxValue(Math.max(...data2) * 1.5);
    } else if (valueButton === 1) {
      setDataset([
        {
          label: `${title} theo tháng`,
          backgroundColor: hexToRgba(brandInfo, 10),
          borderColor: brandInfo,
          pointHoverBackgroundColor: brandInfo,
          borderWidth: 2,
          data: data1,
        },
      ]);
      setLabels(Object.keys(data12Month));
      setMaxValue(Math.max(...data1) * 1.5);
    } else if (valueButton === 2) {
      setDataset([
        {
          label: `${title} theo năm`,
          backgroundColor: hexToRgba(brandDanger, 10),
          borderColor: brandDanger,
          pointHoverBackgroundColor: brandDanger,
          borderWidth: 2,
          data: data3,
        },
      ]);
      setLabels(Object.keys(data10Year));
      setMaxValue(Math.max(...data3) * 1.5);
    }
  };
  return (
    <CCard>
      <CCardBody>
        <CRow>
          <CCol sm="5">
            <h4 id="traffic" className="card-title mb-0">
              {title}
            </h4>
            {/* <div className="small text-muted">November 2017</div> */}
          </CCol>
          <CCol sm="7" className="d-none d-md-block">
            <CButton color="primary" className="float-right">
              <CIcon name="cil-cloud-download" />
            </CButton>
            <CButtonGroup className="float-right mr-3">
              {arrayButton.map((value, idx) => (
                <CButton
                  color="outline-secondary"
                  key={value}
                  className="mx-0"
                  active={idx === valueButton}
                  onClick={() => {
                    setValueButton(idx);
                  }}
                >
                  {value}
                </CButton>
              ))}
            </CButtonGroup>
          </CCol>
        </CRow>
        <MainChartExample
          dataset={dataset}
          labels={labels}
          maxValue={maxValue}
          style={{ height: "300px", marginTop: "40px" }}
          key={valueButton}
        />
      </CCardBody>
    </CCard>
  );
}
