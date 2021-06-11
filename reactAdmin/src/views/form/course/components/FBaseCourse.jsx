import { CCard, CCardBody, CCardFooter, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import CustomButton from "src/components/CustomButton";
import CustomInput from "src/components/CustomInput";
import courseApi from "src/api/courseApi";
import * as yup from "yup";
import { useSnackbar } from "notistack";
import { convertVND, format1 } from "src/Tool/Tools";
import classNames from "classnames";
const useStyles = makeStyles((theme) => ({
  form: {
    "& > div": {
      display: "flex",
      alignItems: "center",
      "& > span": {
        minWidth: "150px",
        fontSize: " 16px",
      },
      marginBottom: "30px",
    },
    "& > div:last-of-type": {
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
  },
  price: {},
  footer: {
    display: "flex",
    justifyContent: "space-between",
  },
  visiable: {
    visibility: "hidden",
  },
  [theme.breakpoints.down("md")]: {
    form: {
      "& > div": {
        display: "flex",
        flexFlow: "column",
        alignItems: "start",
        "& > span": {
          marginBottom: "15px",
        },
      },
      "& > div:last-of-type": {},
    },
  },
}));
const schema = yup.object().shape({
  title: yup.string().required("Vui lòng nhập tiêu đề"),
  price: yup
    .string()
    .required("Vui lòng nhập giá tiền")
    .test("check number price", "Vui lòng nhập đúng kiểu giá tiền", (price) => {
      const regularExp = /^\d+$/;
      if (price.match(regularExp)) {
        return true;
      } else {
        return false;
      }
    }),
});
function FBaseCourse(props) {
  const classes = useStyles();
  const {
    nextCurrentStep = null,
    step = 0,
    currentStep = 0,
    prevStep = null,
    nextStep = null,
  } = props;
  const { enqueueSnackbar } = useSnackbar();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      title: "",
      price: "",
      description: "",
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = (values) => {
    console.log(values);
    (async () => {
      // const formData = new FormData();
      // formData.append("image", values.image);
      try {
        if (nextCurrentStep) nextCurrentStep(1);
        // const rp = await courseApi.post(dataCourse?.id, values);
        // console.log(rp);
        // if (changeDataCourse) changeDataCourse(rp);
        enqueueSnackbar("Cập nhật thành công", { variant: "success" });
      } catch (error) {
        enqueueSnackbar(error.message, { variant: "error" });
      }
    })();
  };
  return (
    <CCard>
      <CCardHeader>
        <span className="title">Thông tin cơ bản</span>
      </CCardHeader>
      <CCardBody>
        <form
          className={classes.form}
          onSubmit={form.handleSubmit(handleOnSubmit)}
        >
          <div>
            <span>Tên khóa học</span>
            <CustomInput
              name="title"
              title="Tên khóa học"
              label="Tên khóa học"
              form={form}
            />
          </div>
          <div>
            <span>Giá</span>
            <CustomInput
              name="price"
              title="Giá khóa học"
              label="Giá khóa học"
              form={form}
            />
          </div>
          <div className={classes.price}>
            <span>Hiển thị giá tiền</span>
            <span>{convertVND(form.watch("price"))}</span>
          </div>
          <div>
            <span>Mô tả</span>
            <CustomInput
              name="description"
              title="Mô tả khóa học"
              label="Mô tả khóa học"
              multiline={true}
              rows={4}
              form={form}
            />
          </div>
          <div>
            <CustomButton type="submit" title="Gửi" />
          </div>
        </form>
      </CCardBody>
      <CCardFooter className={classes.footer}>
        <div className={classNames(step <= 0 && classes.visiable)}>
          <CustomButton
            title="Trước"
            onClick={() => {
              if (prevStep) prevStep();
            }}
          />
        </div>
        <div className={classNames(step >= currentStep && classes.visiable)}>
          <CustomButton
            title="Sau"
            onClick={() => {
              if (nextStep) nextStep();
            }}
          />
        </div>
      </CCardFooter>
    </CCard>
  );
}

export default FBaseCourse;
