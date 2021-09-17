import React from "react";
import {
  CWidgetDropdown,
  CRow,
  CCol,
  CDropdown,
  CDropdownMenu,
  CDropdownItem,
  CDropdownToggle,
} from "@coreui/react";
import CIcon from "@coreui/icons-react";
import ChartLineSimple from "../charts/ChartLineSimple";
import ChartBarSimple from "../charts/ChartBarSimple";
import { isEmpty } from "src/Tool/Tools";
import { CChartBar } from "@coreui/react-chartjs";

const WidgetsDropdown = (props) => {
  const { data12Month } = props;
  const [data1, setData1] = React.useState([]);
  const [data2, setData2] = React.useState([]);
  const [data3, setData3] = React.useState([]);
  const [data4, setData4] = React.useState([]);
  React.useEffect(() => {
    // console.log(data12Month);
    if (!isEmpty(data12Month)) {
      initData1();
      initData2();
      initData3();
      initData4();
    }
  }, [data12Month]);
  const initData1 = () => {
    let tmpData1 = [];
    Object.keys(data12Month).map((item) => {
      tmpData1.push(data12Month[item].newMember);
    });
    // console.log(tmpData1);
    setData1(tmpData1);
  };
  const initData2 = () => {
    let tmpData2 = [];
    Object.keys(data12Month).map((item) => {
      tmpData2.push(data12Month[item].courseUpload);
    });
    // console.log(tmpData2);
    setData2(tmpData2);
  };
  const initData3 = () => {
    let tmpData3 = [];
    Object.keys(data12Month).map((item) => {
      tmpData3.push(data12Month[item].courseSell);
    });
    // console.log(tmpData3);
    setData3(tmpData3);
  };
  const initData4 = () => {
    let tmpData4 = [];
    Object.keys(data12Month).map((item) => {
      tmpData4.push(data12Month[item].money);
    });
    // console.log(tmpData4);
    setData4(tmpData4);
  };
  // render

  return (
    <CRow>
      <CCol sm="6" lg="3">
        <CWidgetDropdown
          color="gradient-primary"
          header="Thành viên mới"
          text="Thành viên đăng kí mới theo tháng mới"
          footerSlot={
            <ChartLineSimple
              pointed
              className="c-chart-wrapper mt-3 mx-3"
              style={{ height: "70px" }}
              dataPoints={data1}
              pointHoverBackgroundColor="primary"
              label="Thành viên"
              // labels="months"
            />
          }
        ></CWidgetDropdown>
      </CCol>

      <CCol sm="6" lg="3">
        <CWidgetDropdown
          color="gradient-info"
          header="Khóa học mới"
          text="Khóa học đăng tải mới theo từng tháng"
          footerSlot={
            <ChartLineSimple
              pointed
              className="mt-3 mx-3"
              style={{ height: "70px" }}
              dataPoints={data2}
              pointHoverBackgroundColor="info"
              options={{ elements: { line: { tension: 0.00001 } } }}
              label="Khóa"
              // labels="months"
            />
          }
        ></CWidgetDropdown>
      </CCol>

      <CCol sm="6" lg="3">
        <CWidgetDropdown
          color="gradient-warning"
          header="Khóa học đã bán"
          text="Khóa học đã bán được theo từng tháng"
          footerSlot={
            <ChartBarSimple
              className="mt-3 mx-3"
              style={{ height: "70px" }}
              backgroundColor="#ecf0f1"
              dataPoints={data3}
              label="Khóa"
              // labels="months"
            />
          }
        ></CWidgetDropdown>
      </CCol>

      <CCol sm="6" lg="3">
        <CWidgetDropdown
          color="gradient-danger"
          header="Doanh thu"
          text="Doanh thu bán khóa học theo từng tháng"
          footerSlot={
            <ChartBarSimple
              className="mt-3 mx-3"
              style={{ height: "70px" }}
              backgroundColor="rgb(250, 152, 152)"
              dataPoints={data4}
              label="VNĐ"
              // labels="months"
            />
          }
        ></CWidgetDropdown>
      </CCol>
      {/* <CCol sm="6" lg="3">
        <CWidgetDropdown
          color="gradient-info"
          header="Khóa học mới"
          text="Khóa học đăng tải mới theo từng tháng"
          footerSlot={
            <ChartLineSimple
              pointed
              className="mt-3 mx-3"
              style={{ height: "70px" }}
              dataPoints={data2}
              pointHoverBackgroundColor="info"
              options={{ elements: { line: { tension: 0.00001 } } }}
              label="Khóa"
              labels="months"
            />
          }
        >
          <CDropdown>
            <CDropdownToggle caret={false} color="transparent">
              <CIcon name="cil-location-pin" />
            </CDropdownToggle>
            <CDropdownMenu className="pt-0" placement="bottom-end">
              <CDropdownItem>Action</CDropdownItem>
              <CDropdownItem>Another action</CDropdownItem>
              <CDropdownItem>Something else here...</CDropdownItem>
              <CDropdownItem disabled>Disabled action</CDropdownItem>
            </CDropdownMenu>
          </CDropdown>
        </CWidgetDropdown>
      </CCol> */}
    </CRow>
  );
};

export default WidgetsDropdown;
