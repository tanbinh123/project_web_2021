import { CButton, CCardBody, CCollapse, CDataTable } from "@coreui/react";
import React, { useEffect, useState } from "react";
import { Link, useHistory } from "react-router-dom";
import notificationApi from "src/api/notificationApi";
import CustomButton from "src/components/CustomButton";
import DeleteUser from "./components/DeleteUser";
import "./ListNotification.scss";

// const fields = ["id", "userName", "gmail", "birthDay", "gender", "phone"];

const ListNotification = () => {
  const [details, setDetails] = useState([]);
  const [dataNoti, setDataNoti] = useState([]);
  const { push } = useHistory();

  useEffect(() => {
    (async () => {
      const res = await notificationApi.getAll();
      const { data, pagination } = res;
      console.log(data);
      setDataNoti(data);
      // console.log(res);
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
    { key: "name", label: "Tiêu đề" },
    { key: "content", label: "Nội dung" },
  ];

  return (
    <>
      <div className="btn-add-container">
        <CustomButton
          title="Thêm"
          onClick={() => {
            push("/form/categorie");
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
        }}
      />
    </>
  );
};

export default ListNotification;
