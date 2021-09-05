import { CButton, CCardBody, CCollapse, CDataTable } from "@coreui/react";
import { Avatar } from "@material-ui/core";
import { Rating } from "@material-ui/lab";
import React, { useEffect, useState } from "react";
import { Link, useHistory } from "react-router-dom";
import CustomButton from "src/components/CustomButton";
import { convertVND, DateToString } from "src/Tool/Tools";
import categoriesApi from "src/api/categoriesApi";
import imageApi from "src/api/imageApi";
import ImageHTML from "./components/ImageHTML";
import CustomButtonRed from "src/components/CustomButtonRed";
import DeleteImageBgHome from "./components/DeleteImageBgHome";

// import DeleteCategory from "./components/DeleteCategory";

const BackgroundHome = () => {
  const [details, setDetails] = useState([]);
  const [data, setData] = useState([]);

  useEffect(() => {
    (async () => {
      const res = await imageApi.getAll();
      console.log(res);
      const dataFillter = Array.from(res).filter((item) => {
        return item.tagName === "background_home";
      });
      console.log(dataFillter);
      setData(dataFillter);
    })();
  }, []);
  function reloadData() {
    (async () => {
      const res = await imageApi.getAll();
      const dataFillter = Array.from(res).filter((item) => {
        return item.tagName === "background_home";
      });
      setData(dataFillter);
    })();
  }
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
    { key: "id", label: "ID", _style: { width: "10%" } },
    { key: "image", label: "Hình" },
    { key: "description", label: "Mô tả" },
    { key: "createAt", label: "Ngày tạo" },
    {
      key: "delete",
      label: "Xóa",
      //   _style: { width: "1%" },
      sorter: false,
      filter: false,
    },
  ];
  const { push } = useHistory();
  return (
    <>
      <div className="btn-add-container">
        <CustomButton
          title="Thêm"
          onClick={() => {
            push("/form/image-background-home");
          }}
        />
      </div>
      <CDataTable
        items={Array.from(data).filter((item) => item.deleted === false)}
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
          image: (item) => <ImageHTML image={item?.image} />,
          createAt: (item) => (
            <td className="tdCenter">{DateToString(item.createTime)}</td>
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
          delete: (item, index) => {
            return (
              <td className="tdCenter">
                <DeleteImageBgHome item={item} onReload={reloadData} />
              </td>
            );
          },
        }}
      />
    </>
  );
};

export default BackgroundHome;
