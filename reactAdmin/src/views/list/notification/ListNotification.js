import { CButton, CCardBody, CCollapse, CDataTable } from "@coreui/react";
import { useSnackbar } from "notistack";
import React, { useEffect, useState } from "react";
import { Link, useHistory } from "react-router-dom";
import notificationApi from "src/api/notificationApi";
import CustomButton from "src/components/CustomButton";
import DeleteNotification from "./components/DeleteNotification";
import "./ListNotification.scss";

// const fields = ["id", "userName", "gmail", "birthDay", "gender", "phone"];

const ListNotification = () => {
  const { enqueueSnackbar } = useSnackbar();
  const [details, setDetails] = useState([]);
  const [dataNoti, setDataNoti] = useState([]);
  const { push } = useHistory();

  useEffect(() => {
    getDataNotification();
    return () => {
      setDataNoti([]);
    };
  }, []);
  const getDataNotification = async () => {
    const res = await notificationApi.getAll();
    // console.log(res);
    if (!!!res.status) {
      const { data, pagination } = res;
      setDataNoti(data);
      // console.log(data);
    } else {
      enqueueSnackbar(res?.data?.message?.en, { variant: "error" });
    }
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
    { key: "name", label: "Tiêu đề" },
    { key: "content", label: "Nội dung" },
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
      <div className="btn-add-container">
        <CustomButton
          title="Thêm"
          onClick={() => {
            push("/form/notification");
          }}
        />
      </div>
      <CDataTable
        items={dataNoti}
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
                    to={{
                      pathname: `/list/notification/${item.id}`,
                      state: { name: item?.name, content: item?.content },
                    }}
                  >
                    <CustomButton title="Cập nhật thông báo" />
                  </Link>
                  <DeleteNotification
                    item={item}
                    onUpdate={() => {
                      getDataNotification();
                    }}
                  />
                </CCardBody>
              </CCollapse>
            );
          },
        }}
      />
    </>
  );
};

export default ListNotification;
