import { CButton, CCardBody, CCollapse, CDataTable } from "@coreui/react";
import { Avatar } from "@material-ui/core";
import { Rating } from "@material-ui/lab";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import CustomButton from "src/components/CustomButton";
import { convertVND, DateToString } from "src/Tool/Tools";
import "./Categories.scss";
import categoriesApi from "src/api/categoriesApi";
import DeleteCategory from "./components/DeleteCategory";

const fields = ["id", "name", "total", "totalMoney"];

const Categories = () => {
  const [details, setDetails] = useState([]);
  const [dataCourse, setDataCourse] = useState([]);

  useEffect(() => {
    (async () => {
      const res = await categoriesApi.getAll();
      setDataCourse(res);
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
    { key: "name", label: "Tên" },
    { key: "total", label: "Tổng bài học" },
    { key: "totalMoney", label: "Tổng tiền" },
    {
      key: "show_details",
      label: "Chi Tiết",
      //   _style: { width: "1%" },
      sorter: false,
      filter: false,
    },
  ];

  return (
    <>
      <CDataTable
        items={Array.from(dataCourse).filter((item) => item.deleted === false)}
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
          totalMoney: (item) => <td>{convertVND(item.totalMoney)}</td>,
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
                  {details.includes(index) ? "Ẩn" : "Hiện"}
                </CButton>
              </td>
            );
          },
          details: (item, index) => {
            return (
              <CCollapse show={details.includes(index)}>
                <CCardBody className="detailBody">
                  <Link
                    style={{ textDecoration: "none" }}
                    to={`/list/categories/${item.id}`}
                  >
                    <CustomButton title="Chi tiết phần học" />
                  </Link>
                  <DeleteCategory item={item} />
                </CCardBody>
              </CCollapse>
            );
          },
        }}
      />
    </>
  );
};

export default Categories;
