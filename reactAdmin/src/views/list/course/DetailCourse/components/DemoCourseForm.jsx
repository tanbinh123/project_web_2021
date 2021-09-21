import { CCard, CCardBody, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { LinearProgress, makeStyles } from "@material-ui/core";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import CustomButton from "src/components/CustomButton";
import * as yup from "yup";
import SimpleDialog from "./SimpleDialog";
import courseApi from "src/api/courseApi";
import { useSnackbar } from "notistack";
import { isEmpty } from "src/Tool/Tools";
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
  videoPlay: {
    width: "50%",
    height: "auto",
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
    center: {
      display: "flex",
      flexFlow: "row !important",
      justifyContent: "center",
      alignItems: "center",
    },
    videoPlay: {
      width: "100%",
      height: "auto",
    },
  },
}));
const schema = yup.object().shape({
  // firstName: yup.string().required(),
});
function DemoCourseForm(props) {
  const classes = useStyles();
  const { enqueueSnackbar } = useSnackbar();
  const [progress, setProgress] = useState(false);
  const { dataCourse = {}, changeDataCourse = null } = props;
  const [demoVideo, setDemoVideo] = useState(dataCourse?.demo?.urlVideo);
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      image: null,
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = (values) => {
    console.log(values);
    if (isEmpty(values?.image?.name)) {
      enqueueSnackbar("Vui lòng tải video lên", { variant: "error" });
      return;
    }
    (async () => {
      try {
        const formData = new FormData();
        formData.append("video", values.image);
        setProgress(true);
        const rp = await courseApi.uploadNewVideoDemo(dataCourse?.id, formData);
        setProgress(false);
        // console.log(rp);
        if (!!!rp.status) {
          if (changeDataCourse) changeDataCourse(rp);
          enqueueSnackbar("Cập nhật thành công", { variant: "success" });
        } else {
          enqueueSnackbar(rp?.data?.message?.en, { variant: "error" });
        }
      } catch (error) {
        enqueueSnackbar(error.message, { variant: "error" });
        setProgress(false);
      }
    })();
  };
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => {
    setOpen(!open);
  };
  const contentSimpleDialog = (
    <img src={demoVideo} className="poster_image_dialog" />
  );
  const handleChangeImg = () => {
    const inputFile = document.getElementById("input-video-demo");
    inputFile.click();
  };
  const handleOnChangeFile = (event) => {
    const file = event.target.files[0];
    console.log(file);
    const tmpImg = URL.createObjectURL(file);
    setDemoVideo(tmpImg);
    form.setValue("image", file);
  };
  return (
    <CCard>
      {progress && <LinearProgress />}
      <CCardHeader>
        <span className="title">Chỉnh sửa video demo</span>
      </CCardHeader>
      <CCardBody>
        <form
          className={classes.form}
          onSubmit={form.handleSubmit(handleOnSubmit)}
        >
          <div>
            <span>Video xem trước</span>
            <video
              key={demoVideo}
              // autoPlay
              muted
              loop
              className={classes.videoPlay}
              controls
            >
              <source src={demoVideo} type="video/mp4"></source>
            </video>

            <SimpleDialog
              open={open}
              id={dataCourse?.imagePoster?.id}
              onClose={handleClickOpen}
              content={contentSimpleDialog}
            />
          </div>
          <div className={classes.center}>
            <input
              accept="video/*"
              type="file"
              name="avatar"
              id="input-video-demo"
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
      {/* <CCardFooter></CCardFooter> */}
    </CCard>
  );
}

export default DemoCourseForm;
