import { CDataTable } from "@coreui/react";
import { useSnackbar } from "notistack";
import React, { useEffect, useState } from "react";
import { useHistory } from "react-router-dom";
import courseApi from "src/api/courseApi";
import paymentApi from "src/api/paymentApi";
import CustomButton from "src/components/CustomButton";
import { convertVND, DateToString2, isEmpty } from "src/Tool/Tools";
import "./Categories.scss";

const fields = ["id", "name", "total", "totalMoney"];

const ListPayment = () => {
  const { enqueueSnackbar } = useSnackbar();
  const [dataListPayment, setDataListPayment] = useState([]);

  useEffect(() => {
    getDataListPayment();
    return () => {
      setDataListPayment([]);
    };
  }, []);
  const getDataListPayment = async () => {
    const res = await paymentApi.getAllStatement();
    if (!!!res.status) {
      const { data, pagination } = res;
      setDataListPayment(data);
      console.log(data);
    } else {
      enqueueSnackbar(res?.data?.message?.en, { variant: "error" });
    }
  };

  const fields = [
    { key: "id", label: "ID" },
    { key: "appUserPojo", label: "Tên" },
    { key: "urReturn", label: "ID Khóa học" },
    { key: "title", label: "Tên Khóa học" },
    { key: "amount", label: "Số tiền" },
    { key: "createTime", label: "Thời gian tạo" },
  ];
  const { push } = useHistory();

  return (
    <div className="list-payment">
      <div className="btn-add-container">
        <CustomButton
          title="Thêm"
          onClick={() => {
            push("/form/categorie");
          }}
        />
      </div>
      <CDataTable
        items={Array.from(dataListPayment).filter((item) => {
          return (
            item?.payment?.transactionStatus === "COMPLETE" &&
            item?.payment?.urReturn !== "http://localhost:25001/test/returnurl"
          );
        })}
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
          appUserPojo: (item) => <td>{item?.payment?.appUserPojo?.userName}</td>,
          urReturn: (item) => (
            <td className="td">
              <a
                href={item?.payment?.urReturn}
                target="_blank"
                rel="noopener noreferrer"
              >
                {item?.payment?.urReturn.split("/course/")[1]}
              </a>
            </td>
          ),
          title: (item) => (
            <td className="td">
              <a
                href={item?.payment?.urReturn}
                target="_blank"
                rel="noopener noreferrer"
              >
                {item?.coursePojo?.title}
              </a>
            </td>
          ),
          amount: (item) => <td>{convertVND(item?.payment?.amount/100)}</td>,
          createTime: (item) => <td>{DateToString2(item?.payment?.createTime)}</td>,
        }}
      />
    </div>
  );
};

export default ListPayment;
