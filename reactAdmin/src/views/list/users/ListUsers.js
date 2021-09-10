import { CButton, CCardBody, CCollapse, CDataTable } from "@coreui/react";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import userApi from "src/api/userApi";
import CustomButton from "src/components/CustomButton";
import DeleteUser from "./components/DeleteUser";
import "./ListUsers.scss";

// const fields = ["id", "userName", "gmail", "birthDay", "gender", "phone"];

const ListUsers = () => {
  const [details, setDetails] = useState([]);
  const [dataUsers, setDataUsers] = useState([]);

  useEffect(() => {
    (async () => {
      const res = await userApi.getListAccount();
      const { data, pagination } = res;
      setDataUsers(data);
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
    { key: "userName", label: "Tên tài khoản" },
    { key: "gmail", label: "Email" },
    { key: "birthDay", label: "Ngày sinh" },
    { key: "gender", label: "Giới Tính" },
    { key: "phone", label: "Số điện thoại" },
    { key: "isAdmin", label: "Quyền tài khoản" },
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
        items={dataUsers}
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
          gender: (item) => (
            <td className="tdCenter">
              {item.gender === "NAM" ? (
                <div className="sex">
                  <span>Nam</span>
                  <i className="fas fa-mars blue"></i>
                </div>
              ) : (
                <div className="sex">
                  <span>Nữ</span>
                  <i className="fas fa-mars blue"></i>
                </div>
              )}
            </td>
          ),
          gmail: (item) => (
            <td className="tdCenter">
              {item.gmail ? item.gmail : "Không có dữ liệu"}
            </td>
          ),
          birthDay: (item) => (
            <td className="tdCenter">
              {item.birthDay ? item.birthDay : "Không có dữ liệu"}
            </td>
          ),
          phone: (item) => (
            <td className="tdCenter">
              {item.phone ? item.phone : "Không có dữ liệu"}
            </td>
          ),
          isAdmin: (item) => (
            <td className="tdCenter">{item.isAdmin ? "Admin" : "User"}</td>
          ),
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
                    to={`/list/user/${item.id}`}
                  >
                    <CustomButton title="Chi tiết tài khoản" />
                  </Link>
                  <Link
                    style={{ textDecoration: "none" }}
                    to={`/list/user-role/${item.id}`}
                  >
                    <CustomButton title="Cập nhật quyền" />
                  </Link>
                  <DeleteUser item={item} />
                </CCardBody>
              </CCollapse>
            );
          },
        }}
      />
    </>
  );
};

export default ListUsers;
