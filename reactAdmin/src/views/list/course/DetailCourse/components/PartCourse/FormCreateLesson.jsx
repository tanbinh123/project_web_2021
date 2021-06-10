import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import classNames from "classnames";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import courseApi from "src/api/courseApi";
import CustomButton from "src/components/CustomButton";
import CustomButtonRed from "src/components/CustomButtonRed";
import CustomInput from "src/components/CustomInput";
import CustomSelectForm from "src/components/form/CustomSelectForm";
import { isEmpty } from "src/Tool/Tools";
import * as yup from "yup";

const useStyles = makeStyles(() => ({
  formAddPart: {
    marginTop: 30,
    marginBottom: 20,
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
  videoPlay: {
    width: "50%",
  },
  buttonUpload: {
    marginLeft: 200,
  },
  divVideo: {
    "&>div": {
      display: "flex",
      alignItems: "center",
      justifyContent: "space-around",
    },
    marginTop: "30px",
    marginBottom: "30px",
  },
  hidden: {
    display: "none",
  },
}));
const schema = yup.object().shape({
  // firstName: yup.string().required(),
});
function FormCreateLesson(props) {
  const { part = {} } = props;
  const classes = useStyles();
  const [demoVideo, setDemoVideo] = useState();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      idCourse: part.courseId,
      description: "",
      idPart: part.id,
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = (values) => {
    //todo hoang todo
    console.log("Post  Lesson: ",values);
    (async () => {
      try {
        const formData = new FormData();
       formData.append("videoCourse", values.videoCourse);
       formData.append("description", values.description);
      //  setProgress(true);
        const rp = await courseApi.postLesson(part.courseId,part.id, formData);
        //setProgress(false);
        console.log(rp);
        // if (changeDataCourse) changeDataCourse(rp);
        // enqueueSnackbar("Cập nhật thành công", { variant: "success" });
      } catch (error) {
        // enqueueSnackbar(error.message, { variant: "error" });
        // setProgress(false);
      }
    })();


  };
  const handleChangeVideo = () => {
    const inputFile = document.getElementById(`input-video-create-${part.id}`);
    inputFile.click();
  };
  const handleOnChangeFile = (event) => {
    const file = event.target.files[0];
    console.log(file);
    const tmpImg = URL.createObjectURL(file);
    setDemoVideo(tmpImg);
    form.setValue("videoCourse", file);
  };
  return (
    <form
      className={classes.formAddPart}
      onSubmit={form.handleSubmit(handleOnSubmit)}
    >
      <h3 className={classes.title}>Thêm mới bài học</h3>
      <div>
        <span>Tiêu đề bài học</span>
        <CustomInput
          name="description"
          title="Tiêu đề bài học"
          label="Tiêu đề bài học"
          form={form}
        />
      </div>
      <div className={classes.divVideo}>
        <span>Video bài học</span>

        <div>
          <input
            accept="video/*"
            type="file"
            name="avatar"
            id={`input-video-create-${part.id}`}
            onChange={handleOnChangeFile}
            hidden
          />
          <CustomButton
            className={classes.buttonUpload}
            title="Upload"
            color="secondary"
            variant="contained"
            onClick={handleChangeVideo}
            css={false}
          />
          <video
            key={demoVideo}
            // autoPlay
            muted
            loop
            className={classNames(
              !isEmpty(demoVideo) && classes.videoPlay,
              isEmpty(demoVideo) && classes.hidden
            )}
            controls
          >
            <source src={demoVideo} type="video/mp4"></source>
          </video>
        </div>
      </div>

      <div>
        <CustomButton type="submit" title="Xác nhận" />
      </div>
    </form>
  );
}

export default FormCreateLesson;
