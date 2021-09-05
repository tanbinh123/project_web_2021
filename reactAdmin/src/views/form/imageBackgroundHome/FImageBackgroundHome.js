import { CCard, CCardBody, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { Grid, makeStyles } from "@material-ui/core";
import classNames from "classnames";
import { useSnackbar } from "notistack";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import categoriesApi from "src/api/categoriesApi";
import imageApi from "src/api/imageApi";
import CustomButton from "src/components/CustomButton";
import CustomInput from "src/components/CustomInput";
import { isEmpty } from "src/Tool/Tools";
import * as yup from "yup";
import SimpleDialog from "../course/components/SimpleDialog";
const scheme = yup.object().shape({
  // description: yup.string().required("Vui lòng nhập tên thể loại"),
});

const FImageBackgroundHome = () => {
  const classes = makeStyles((theme) => ({
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
  }))();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      tagName: "background_home",
    },
    resolver: yupResolver(scheme),
  });
  const { enqueueSnackbar } = useSnackbar();
  const [img, setImg] = useState();
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
    form.setValue("image", file);
  };
  const handleOnSubmit = async (values) => {
    console.log(values);
    if (isEmpty(values?.image?.name)) {
      enqueueSnackbar("Vui tải hình lên", { variant: "error" });
      return;
    }

    (async () => {
      // console.log("POST NEW COURSE", values);
      const formData = new FormData();
      formData.append("image", values.image);
      formData.append("tagName", values.tagName);
      formData.append("description", values.description);
      try {
        const rp = await imageApi.add(formData);
        console.log(rp);
        if (!rp.status) {
          console.log(rp);
          enqueueSnackbar("Tải hình lên thành công", { variant: "success" });
        }
        setImg(null);
        form.reset();
      } catch (error) {
        enqueueSnackbar(error.message, { variant: "error" });
      }
    })();
  };
  return (
    <>
      <Grid container className={classes.root} spacing={3}>
        <Grid item xl={12} lg={12} md={12} xs={12} sm={12}>
          <CCard>
            <CCardHeader>
              <span className="title">Form thể loại</span>
            </CCardHeader>
            <CCardBody>
              <form
                className={classes.form}
                onSubmit={form.handleSubmit(handleOnSubmit)}
              >
                <div className={classes.itemForm}>
                  <span>Hình </span>
                  <div className={classes.center}>
                    <img
                      src={img}
                      className={classNames(
                        !isEmpty(img) && classes.posterImage
                      )}
                      onClick={handleClickOpen}
                      alt=""
                    />
                    <SimpleDialog
                      open={open}
                      id={`form-create-course-poster`}
                      onClose={handleClickOpen}
                      title="Hình nền trang chủ"
                      content={contentSimpleDialog}
                    />
                    <input
                      accept="image/*"
                      type="file"
                      name="image"
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
                <div className={classes.itemForm}>
                  <span>Mô tả</span>
                  <CustomInput
                    name="description"
                    title="Mô tả"
                    label="Mô tả"
                    form={form}
                  />
                </div>

                <div className={classes.lastItem}>
                  <CustomButton type="submit" title="Gửi" />
                </div>
              </form>
            </CCardBody>
            {/* <CCardFooter></CCardFooter> */}
          </CCard>
        </Grid>
      </Grid>
    </>
  );
};

export default FImageBackgroundHome;
