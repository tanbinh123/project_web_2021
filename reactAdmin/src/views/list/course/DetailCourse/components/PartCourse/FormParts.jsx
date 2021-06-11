import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import courseApi from "src/api/courseApi";
import CustomButton from "src/components/CustomButton";
import CustomButtonRed from "src/components/CustomButtonRed";
import CustomDialogAction from "src/components/CustomDialogAction";
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
  const {
    part = {},
    index = 0,
    onSubmit = null,
    changeDataCourse = null,
  } = props;
  // console.log(part);
  //  indexPart = [],
  const classes = useStyles();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      idCourse: part.courseId,
      // indexPart: index,
      titlePart: part.title,
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = (values) => {
    //todo hoang todo
    console.log(values);

    (async () => {
      const rp = await courseApi.updatePart(part.courseId, part.id, values);
      if (!rp.status) {
        console.log(rp);
        if (changeDataCourse) changeDataCourse(rp);
        //setDataLearning(rp.learnings);
        //setUpdate(true);
      }
    })();
  };
  const [isOpen, setOpen] = useState(false);
  const handleOnChangeOpen = () => {
    setOpen(!isOpen);
  };
  const handleDeletePart = async () => {
    const rp = await courseApi.deletePart(part.courseId, part.id);
    if (!rp.status) {
      console.log(rp);
      if (changeDataCourse) changeDataCourse(rp);
      //setDataLearning(rp.learnings);
      //setUpdate(true);
    }
  };
  return (
    <form
      className={classes.formAddPart}
      onSubmit={form.handleSubmit(handleOnSubmit)}
    >
      <h3 className={classes.title}>Chỉnh sửa phần học</h3>
      {/* <div>
        <span>Thứ tự</span>
        <CustomSelectForm
          name="indexPart"
          label="Thứ tự"
          form={form}
          data={indexPart}
        />
      </div> */}
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
        <CustomButtonRed title="Xóa phần học" onClick={handleOnChangeOpen} />
        <CustomDialogAction
          title={`Bạn có muốn xóa phần ${part.title}`}
          closeDialog={handleOnChangeOpen}
          isOpen={isOpen}
          accepct={handleDeletePart}
          id={`delete-${part.id}`}
          content={
            <div>
              Bạn có muốn xóa phần <b>{part.title}</b> này không ?
            </div>
          }
        />
      </div>
    </form>
  );
}

export default FormParts;
