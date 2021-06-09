import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import React from "react";
import { useForm } from "react-hook-form";
import courseApi from "src/api/courseApi";
import CustomButton from "src/components/CustomButton";
import CustomButtonRed from "src/components/CustomButtonRed";
import CustomInput from "src/components/CustomInput";
import CustomSelectForm from "src/components/form/CustomSelectForm";
import * as yup from "yup";

const useStyles = makeStyles(() => ({
  formAddPart: {
    marginTop: 30,
    padding: "15px",
    border: "var(--colorBlue2) 1px solid",
    borderRadius: "5px",
    "&>div": {
      display: "flex",
      alignItems: "center",
      "&>span": {
        minWidth: 150,
        fontSize: 16,
      },
    },
    "&>div:last-of-type": {
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      "&>button": {
        margin: "15px 10px",
      },
    },
  },
  title: {
    fontWeight: 600,
  },
}));
const schema = yup.object().shape({
  // firstName: yup.string().required(),
});
function FormParts(props) {
  const { part = {}, index = 0, indexPart = [], onSubmit = null } = props;
  const classes = useStyles();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      idCourse: part.courseId,
      indexPart: index,
      titlePart: part.title,
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = (value) => {
    //todo hoang todo
    console.log(value);
  };
  return (
    <form
      className={classes.formAddPart}
      onSubmit={form.handleSubmit(handleOnSubmit)}
    >
      <h3 className={classes.title}>Chỉnh sửa phần học</h3>
      <div>
        <span>Thứ tự</span>
        <CustomSelectForm
          name="indexPart"
          label="Thứ tự"
          form={form}
          data={indexPart}
        />
      </div>
      <div>
        <span>Tiêu đề</span>
        <CustomInput
          name="titlePart"
          title="Tiêu đề"
          label="Tiêu đề"
          form={form}
        />
      </div>
      <div>
        <CustomButton type="submit" title="Xác nhận" />
        <CustomButtonRed title="Xóa" />
      </div>
    </form>
  );
}

export default FormParts;
