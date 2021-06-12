import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import classNames from "classnames";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import courseApi from "src/api/courseApi";
import CustomButton from "src/components/CustomButton";
import CustomButtonRed from "src/components/CustomButtonRed";
import CustomDialogAction from "src/components/CustomDialogAction";
import CustomInput from "src/components/CustomInput";
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
function FormUpdateLesson(props) {
  const { part = {}, lesson = {}, changeDataCourse = null } = props;
  const classes = useStyles();
  const [demoVideo, setDemoVideo] = useState(lesson.video.urlVideo);
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      idCourse: part.courseId,
      idLesson: lesson.id,
      idPart: lesson.partId,
      description: lesson.description,
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = (values) => {
    //todo hoang todo
    console.log("Update Lesson", values);

    (async () => {
      const formData = new FormData();

      formData.append("videoCourse", values.videoCourse);
      formData.append("description", values.description);
      // formData.append("image", values.image);
      // pass param courseId, partId
      const rp = await courseApi.updateLesson(
        part.courseId,
        part.id,
        lesson.id,
        formData
      );
      if (!rp.status) {
        console.log(rp);

        if (changeDataCourse) changeDataCourse(rp);
      }
    })();
  };
  const handleChangeImg = () => {
    const inputFile = document.getElementById(
      `input-video-update-${lesson.id}`
    );
    inputFile.click();
  };
  const handleOnChangeFile = (event) => {
    const file = event.target.files[0];
    console.log(file);
    const tmpImg = URL.createObjectURL(file);
    setDemoVideo(tmpImg);
    form.setValue("videoCourse", file);
  };
  const [isOpen, setOpen] = useState(false);
  const handleOnChangeOpen = () => {
    setOpen(!isOpen);
  };
  const handleDeleteLesson = async () => {
    //console.log("Hoang TODO");
    console.log("Xóa Bài Học");

    const rp = await courseApi.deleteLesson(
      part.courseId,
      part.id,
      lesson.id
    );
       if (!rp.status) {
        console.log(rp);

      
    }
  };
  return (
    <form
      className={classes.formAddPart}
      onSubmit={form.handleSubmit(handleOnSubmit)}
    >
      <h3 className={classes.title}>Cập nhật bài học</h3>
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
            id={`input-video-update-${lesson.id}`}
            onChange={handleOnChangeFile}
            hidden
          />
          <CustomButton
            className={classes.buttonUpload}
            title="Upload"
            color="secondary"
            variant="contained"
            onClick={handleChangeImg}
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
        <CustomButtonRed title="Xóa bài học" onClick={handleOnChangeOpen} />
        <CustomDialogAction
          title={`Bạn có muốn xóa bài ${lesson.description}`}
          closeDialog={handleOnChangeOpen}
          isOpen={isOpen}
          accepct={handleDeleteLesson}
          id={`delete-lesson-${lesson.id}`}
          content={
            <div>
              Bạn có muốn xóa bài <b>{lesson.description}</b> này không ?
            </div>
          }
        />
      </div>
    </form>
  );
}

export default FormUpdateLesson;
