import { CCard, CCardBody, CCardFooter, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import classNames from "classnames";
import { useSnackbar } from "notistack";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import courseApi from "src/api/courseApi";
import CustomButton from "src/components/CustomButton";
import CustomInput from "src/components/CustomInput";
import CustomSelectForm from "src/components/form/CustomSelectForm";
import { convertVND, isEmpty } from "src/Tool/Tools";
import * as yup from "yup";
import SimpleDialog from "./SimpleDialog";
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
  center: {
    display: "flex",
    justifyContent: "space-evenly",
    alignItems: "center",
  },
  posterImage: {
    width: "25%",
    cursor: "pointer",
    // marginInline: "auto",
  },
  posterImageDialog: {
    width: "100%",
    margin: "20px 0px 40px 0px",
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
      flexFlow: "column",
      justifyContent: "center",
      alignItems: "center",
      marginInline: "auto",
      "&>img": {
        marginBottom: "20px",
      },
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
    dataCourse = {},
    updateCourse = null,
  } = props;
  const { enqueueSnackbar } = useSnackbar();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      title: dataCourse?.title || "",
      price: dataCourse?.price || "",
      description: dataCourse?.description || "",
      categorie: dataCourse?.category?.id || "",
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = (values) => {
    console.log(values);
    if (isEmpty(values.categorie)) {
      enqueueSnackbar("Vui lòng chọn thể loại", { variant: "error" });
      return;
    }
    if (isEmpty(values?.imageThumbnail?.name)) {
      enqueueSnackbar("Vui tải hình lên", { variant: "error" });
      return;
    }

    (async () => {
      console.log("POST NEW COURSE", values);
      const formData = new FormData();
      formData.append("title", values.title);
      formData.append("imageThumbnail", values.imageThumbnail);
      formData.append("categorie", values.categorie);
      formData.append("price", values.price);
      formData.append("description", values.description);
      try {
        const rp = await courseApi.postNewCourse(formData);
        console.log(rp);
        if (!rp.status) {
          console.log(rp);
          if (nextCurrentStep) nextCurrentStep(1);
          if (updateCourse) updateCourse(rp);
          enqueueSnackbar("Tạo khóa học thành công", { variant: "success" });
        } else {
          enqueueSnackbar(rp?.data?.message, { variant: "error" });
        }
      } catch (error) {
        enqueueSnackbar(error.message, { variant: "error" });
      }
    })();
  };
  const [dataSelect, setDataSelect] = useState(async () => {
    const res = await courseApi.categories();
    setDataSelect(
      Array.from(res).map((item, index) => ({
        value: item.id,
        title: item.name,
      }))
    );
  });
  const [img, setImg] = useState(dataCourse?.imagePoster?.image);
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => {
    setOpen(!open);
  };
  const contentSimpleDialog = (
    <img src={img} className={classes.posterImageDialog} alt="" />
  );
  const handleChangeImg = () => {
    const inputFile = document.getElementById("input-thumbnail");
    inputFile.click();
  };
  const handleOnChangeFile = (event) => {
    const file = event.target.files[0];
    // console.log(file);
    const tmpImg = URL.createObjectURL(file);
    setImg(tmpImg);
    form.setValue("imageThumbnail", file);
  };
  // console.log(dataCourse);
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
            <span>Chọn thể loại</span>
            <CustomSelectForm
              name={"categorie"}
              label="Chọn thể loại"
              data={dataSelect}
              form={form}
            />
          </div>

          <div>
            <span>Hình mô tả</span>
            <div className={classes.center}>
              <img
                src={img}
                className={classNames(!isEmpty(img) && classes.posterImage)}
                onClick={handleClickOpen}
                alt=""
              />
              <SimpleDialog
                open={open}
                id={`form-create-course-poster`}
                onClose={handleClickOpen}
                title="Image Poster"
                content={contentSimpleDialog}
              />
              <input
                accept="image/*"
                type="file"
                name="img-thumbnail"
                id="input-thumbnail"
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
