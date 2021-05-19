import {
  CBadge,
  CButton,
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CCollapse,
  CDataTable,
  CRow,
} from "@coreui/react";
import { Avatar } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import courseApi from "src/api/courseApi";
import "./Course.scss";

const fields = [
  "id",
  "title",
  "categoryName",
  "thumbnail",
  "description",
  "bought",
  "updateAt",
  "rateStar",
  "nameAuthor",
  "imgAvatar",
];

const Course = () => {
  const [details, setDetails] = useState([]);
  const [dataCourse, setDataCourse] = useState();
  useEffect(() => {
    (async () => {
      const res = await courseApi.getAll();
      setDataCourse(res.data);
      console.log(res);
    })();
  }, []);
  const toggleDetails = (index) => {
    const position = details.indexOf(index);
    let newDetails = details.slice();
    if (position !== -1) {
      newDetails.splice(position, 1);
    } else {
      newDetails = [...details, index];
    }
    setDetails(newDetails);
  };

  const fields = [
    { key: "id", label: "ID" },
    { key: "title", label: "Tiêu Đề" },
    { key: "imgAvatar", label: "Avatar", sorter: false, filter: false },
    { key: "nameAuthor", label: "Tên Tác Giả" },
    { key: "rateStar", label: "Đánh Giá" },
    { key: "thumbnail", label: "Hình Thumbnail", sorter: false, filter: false },
    { key: "updateAt", label: "Ngày Update" },
    {
      key: "show_details",
      label: "Chi Tiết",
      //   _style: { width: "1%" },
      sorter: false,
      filter: false,
    },
  ];

  //   const getBadge = (status) => {
  //     switch (status) {
  //       case "Active":
  //         return "success";
  //       case "Inactive":
  //         return "secondary";
  //       case "Pending":
  //         return "warning";
  //       case "Banned":
  //         return "danger";
  //       default:
  //         return "primary";
  //     }
  //   };
  return (
    <>
      <CDataTable
        items={dataCourse}
        fields={fields}
        columnFilter
        tableFilter
        // footer
        itemsPerPageSelect
        itemsPerPage={5}
        hover
        sorter
        pagination
        scopedSlots={{
          imgAvatar: (item) => <td></td>,
          show_details: (item, index) => {
            return (
              <td className="py-2">
                <CButton
                  color="primary"
                  variant="outline"
                  shape="square"
                  size="sm"
                  onClick={() => {
                    toggleDetails(index);
                  }}
                >
                  {details.includes(index) ? "Hide" : "Show"}
                </CButton>
              </td>
            );
          },
          details: (item, index) => {
            return (
              <CCollapse show={details.includes(index)}>
                <CCardBody>
                  <CButton size="sm" color="info">
                    User Settings
                  </CButton>
                  <CButton size="sm" color="danger" className="ml-1">
                    Delete
                  </CButton>
                </CCardBody>
              </CCollapse>
            );
          },
        }}
      />
    </>
  );
};

export default Course;
