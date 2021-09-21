import { CButton, CCardBody, CCollapse, CDataTable } from "@coreui/react";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import userApi from "src/api/userApi";
import CustomButton from "src/components/CustomButton";
import DeleteUser from "./components/DeleteUser";
import SendNotification from "./components/SendNotification";
import UnBlockUser from "./components/UnBlockUser";
import "./ListUsers.scss";

// const fields = ["id", "userName", "gmail", "birthDay", "gender", "phone"];

const ListUsers = () => {
  const [details, setDetails] = useState([]);
  const [dataUsers, setDataUsers] = useState([]);

  useEffect(() => {
    getDataUser();
    return () => {
      setDataUsers([]);
    };
  }, []);
  const getDataUser = async () => {
    const res = await userApi.getListAccount({ _limit: 9999 });
    // console.log(res);
    const { data, pagination } = res;
    setDataUsers(data);
  };
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
    { key: "blocked", label: "Chặn" },
    { key: "actived", label: "Trạng thái" },
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
          userName: (item) => (
            <td className="list-user__username">
              <span>{item.userName}</span>
            </td>
          ),
          gmail: (item) => (
            <td className="tdCenter">
              {item.email ? item.email : "Không có dữ liệu"}
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
          blocked: (item) => (
            <td className="tdCenter">
              {item.blocked ? (
                <i className="fas fa-circle red"></i>
              ) : (
                <i className="fas fa-circle green"></i>
              )}
            </td>
          ),
          actived: (item) => (
            <td className="tdCenter">
              {item.actived ? (
                <i className="fas fa-circle green"></i>
              ) : (
                <i className="fas fa-circle red"></i>
              )}
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
                  {item.blocked ? (
                    <UnBlockUser item={item} onUpdate={getDataUser} />
                  ) : (
                    <DeleteUser item={item} onUpdate={getDataUser} />
                  )}
                  <SendNotification item={item} />
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
