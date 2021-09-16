import { yupResolver } from "@hookform/resolvers/yup";
import { useSnackbar } from "notistack";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import notificationApi from "src/api/notificationApi";
import userApi from "src/api/userApi";
import CustomButton from "src/components/CustomButton";
import CustomDialog from "src/components/CustomDialog";
import CustomInput from "src/components/CustomInput";
import * as yup from "yup";
const scheme = yup.object().shape({
  subject: yup.string().required("Vui lòng nhập tiêu đề"),
  content: yup.string().required("Vui lòng nhập nội dung thông báo"),
});
function SendNotification(props) {
  const { item } = props;
  const [isOpenDialog, setOpenDialog] = useState(false);
  const { enqueueSnackbar } = useSnackbar();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      subject: "",
      content: "",
    },
    resolver: yupResolver(scheme),
  });
  const handleOpenDialog = () => {
    setOpenDialog(true);
  };
  const handleCloseDialog = () => {
    setOpenDialog(false);
  };
  const handleSubmit = async (values) => {
    try {
      const res = await notificationApi.newToUser({
        ...values,
        userId: item.id,
      });
      console.log(res);
      if (!!!res.status) {
        enqueueSnackbar("Gửi thông báo thành công", { variant: "success" });
      } else {
        enqueueSnackbar(res?.data?.message?.en, { variant: "error" });
      }
    } catch (error) {
      enqueueSnackbar(error?.message, { variant: "error" });
    }
    setOpenDialog(false);
  };
  return (
    <>
      <CustomButton title="Gửi thông báo" onClick={handleOpenDialog} />
      <CustomDialog
        title={`Gửi thông báo đến tài khoản : ${item.userName}`}
        id={item.id}
        closeDialog={handleCloseDialog}
        isOpen={isOpenDialog}
        content={
          <div className="list-user__notification">
            <form className="form" onSubmit={form.handleSubmit(handleSubmit)}>
              <div className="itemForm">
                <span>Tiêu đề *</span>
                <CustomInput
                  name="subject"
                  title="Tiêu đề"
                  label="Tiêu đề"
                  form={form}
                />
              </div>
              <div className="itemForm">
                <span>Nội dung thông báo *</span>
                <CustomInput
                  name="content"
                  title="Nội dung thông báo"
                  label="Nội dung thông báo"
                  form={form}
                />
              </div>

              <div className="lastItemForm">
                <CustomButton type="submit" title="Gửi" />
              </div>
            </form>
          </div>
        }
      />
    </>
  );
}

export default SendNotification;
