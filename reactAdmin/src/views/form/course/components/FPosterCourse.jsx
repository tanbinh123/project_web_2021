import { CCard, CCardBody, CCardFooter, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import CustomButton from "src/components/CustomButton";
import CustomInput from "src/components/CustomInput";
import * as yup from "yup";
import courseApi from "src/api/courseApi";
import SimpleDialog from "./SimpleDialog";
import { useSnackbar } from "notistack";
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
  center: { display: "flex", justifyContent: "center", alignItems: "center" },
  posterImage: {
    width: "50%",
    cursor: "pointer",
  },
  posterImageDialog: {
    width: "100%",
    margin: "20px 0px 40px 0px",
  },
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
    posterImage: {
      width: "100%",
      height: "auto",
      cursor: "pointer",
    },
    posterImageDialog: {
      width: "100%",
      margin: "20px 0px 40px 0px",
    },
    center: {
      display: "flex",
      flexFlow: "row !important",
      justifyContent: "center",
      alignItems: "center",
    },
  },
}));
const schema = yup.object().shape({
  // firstName: yup.string().required(),
});
function FPosterCourse(props) {
  const classes = useStyles();
  const { enqueueSnackbar } = useSnackbar();
  const {
    nextCurrentStep = null,
    step = 0,
    currentStep = 0,
    prevStep = null,
    nextStep = null,
    dataCourse = {},
    changeDataCourse = null,
  } = props;
  const [img, setImg] = useState();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      image: null,
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = async (values) => {
    console.log(values);
    if (nextCurrentStep) nextCurrentStep(2);
    // try {
    //   const formData = new FormData();
    //   formData.append("image", values.image);
    //   const rp = await courseApi.uploadNewPoster(dataCourse?.id, formData);
    //   // console.log(rp);
    //   if (changeDataCourse) changeDataCourse(rp);
    //   if (nextCurrentStep) nextCurrentStep();
    //   enqueueSnackbar("Cập nhật thành công", { variant: "success" });
    // } catch (error) {
    //   enqueueSnackbar(error.message, { variant: "error" });
    // }
  };
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => {
    setOpen(!open);
  };
  const contentSimpleDialog = (
    <img src={img} className={classes.posterImageDialog} />
  );
  const handleChangeImg = () => {
    const inputFile = document.getElementById("input-img");
    inputFile.click();
  };
  const handleOnChangeFile = (event) => {
    const file = event.target.files[0];
    console.log(file);
    const tmpImg = URL.createObjectURL(file);
    setImg(tmpImg);
    form.setValue("image", file);
  };
  return (
    <CCard>
      <CCardHeader>
        <span className="title">Chỉnh sửa Poster</span>
      </CCardHeader>
      <CCardBody>
        <form
          className={classes.form}
          onSubmit={form.handleSubmit(handleOnSubmit)}
        >
          <div>
            <span>Hình xem trước</span>
            <img
              src={img}
              className={classes.posterImage}
              onClick={handleClickOpen}
            />
            <SimpleDialog
              open={open}
              id={`form-create-course-poster`}
              onClose={handleClickOpen}
              title="Image Poster"
              content={contentSimpleDialog}
            />
          </div>
          <div className={classes.center}>
            <input
              accept="image/*"
              type="file"
              name="avatar"
              id="input-img"
              onChange={handleOnChangeFile}
              hidden
            />
            <CustomButton
              title="Upload"
              color="secondary"
              variant="contained"
              onClick={handleChangeImg}
              css={false}
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

export default FPosterCourse;
