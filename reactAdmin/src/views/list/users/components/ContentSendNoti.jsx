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
function ContentSendNoti(props) {
  const { item, onUpdate } = props;
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      subject: "",
      content: "",
      userId: item.id || 0,
    },
    resolver: yupResolver(scheme),
  });
  const handleSubmit = async (values) => {
    console.log(values);
    const res = await notificationApi.newToUser(values);
    console.log(res);
    if (!!!res.status) {
      // enqueueSnackbar('')
      if (onUpdate) onUpdate();
    }
  };
  return (
    <div className="form-notification">
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
  );
}

export default ContentSendNoti;
