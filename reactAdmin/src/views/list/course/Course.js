import { CButton, CCardBody, CCollapse, CDataTable } from "@coreui/react";
import { Avatar } from "@material-ui/core";
import { Rating } from "@material-ui/lab";
import React, { useEffect, useState } from "react";
import { Link, useHistory } from "react-router-dom";
import courseApi from "src/api/courseApi";
import CustomButton from "src/components/CustomButton";
import { DateToString, DateToString3 } from "src/Tool/Tools";
import BlockCourse from "./components/BlockCourse";
import ImageHTML from "./components/ImageHTML";
import UnBlockCourse from "./components/UnBlockCourse";
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
  const { push } = useHistory();
  const [details, setDetails] = useState([]);
  const [dataCourse, setDataCourse] = useState();

  useEffect(() => {
    (async () => {
      const res = await courseApi.getAll();
      setDataCourse(res.data);
      // console.log(res);
    })();
    return () => {
      setDataCourse();
      setDetails([]);
    };
  }, []);
  function reloadData() {
    (async () => {
      const res = await courseApi.getAll();
      setDataCourse(res.data);
      // console.log(res);
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
    { key: "id", label: "ID" },
    { key: "title", label: "Tiêu Đề" },
    { key: "imgAvatar", label: "Avatar", sorter: false, filter: false },
    { key: "nameAuthor", label: "Tên Tác Giả" },
    { key: "rateStar", label: "Đánh Giá" },
    { key: "thumbnail", label: "Hình Thumbnail", sorter: false, filter: false },
    { key: "actived", label: "Trạng thái" },
    { key: "updateAt", label: "Ngày Update" },
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
            push("/form/course");
          }}
        />
      </div>
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
          imgAvatar: (item) => (
            <td className="tdCenter">
              <Avatar src={item.imgAvatar} />
            </td>
          ),
          thumbnail: (item) => <ImageHTML item={item} />,
          updateAt: (item) => (
            <td className="tdCenter">{DateToString(item.updateAt)}</td>
          ),
          rateStar: (item) => (
            <td>
              <Rating
                key={item.id}
                defaultValue={item.rateStar}
                precision={0.5}
                readOnly
              />
            </td>
          ),
          actived: (item) => (
            <td className="tdCenter">
              {item.actived ? (
                <div>
                  <span>Hoạt động</span>
                  <i className="fas fa-circle green"></i>
                </div>
              ) : (
                <div>
                  <span>Khóa</span>
                  <i className="fas fa-circle red"></i>
                </div>
              )}
            </td>
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
            // console.log(item);
            return (
              <CCollapse show={details.includes(index)}>
                <CCardBody className="detailBody">
                  <Link
                    style={{ textDecoration: "none" }}
                    to={`/list/course/${item.id}`}
                  >
                    <CustomButton title="Chi tiết phần học" />
                  </Link>
                  {item.actived ? (
                    <BlockCourse item={item} onReload={reloadData} />
                  ) : (
                    <UnBlockCourse item={item} onReload={reloadData} />
                  )}
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
