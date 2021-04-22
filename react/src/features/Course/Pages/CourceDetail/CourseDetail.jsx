import {
  Box,
  Container,
  // DialogActions,
  DialogContent,
  DialogTitle,
  Grid,
  //makeStyles,
  Paper,
  useMediaQuery,
  useTheme,
} from "@material-ui/core";
import Dialog from "@material-ui/core/Dialog";
import { Close } from "@material-ui/icons";
import React, { useEffect, useState } from "react";
import { Route, Switch, useParams, useRouteMatch } from "react-router";
import courseApi from "../../../../api/courseApi";
import Header from "../../../../components/header/index";
import CourseDetailCSS from "./CSSCourseDetail";
import Lecture from "./Lecture/Lecture";
import LeftCD from "./LeftCourseDetail/LeftCD";
import RightCD from "./RightCourseDetail/RightCD";

function CourseDetail(props) {
  const classes = CourseDetailCSS();
  const { idCourse } = useParams();
  // console.log(idCourse);
  const { url } = useRouteMatch();
  const [isOpenDialog, setIsOpenDialog] = useState(false);
  const theme = useTheme();
  const fullScreen = useMediaQuery(theme.breakpoints.down("xs"));
  const [course, setCourse] = useState({
    title: "",
  });
  function handleToggleDialog() {
    setIsOpenDialog(!isOpenDialog);
  }

  useEffect(() => {
    (async () => {
      try {
        var id = props.match.params.idCourse;
        const res = await courseApi.get(id);
        console.log(res);
        setCourse(res || {});
        // console.log("course", course);
      } catch (error) {
        console.log(error);
      }
    })();
  }, []);

  return (
    <>
      <Header />
      <Box className={classes.backgroundHeader} />
      <Box className={classes.root}>
        <Container>
          <Grid container spacing={3}>
            <Grid
              item
              className={classes.left}
              xl={8}
              lg={8}
              md={8}
              sm={12}
              xs={12}
            >
              <Paper elevation={0}>
                {/* --------------------- Left Data --------------------------- */}
                <LeftCD
                  title={course.title}
                  description={course.description}
                  learning={course.learning}
                  parts={course.parts}
                />
              </Paper>
            </Grid>
            <Grid
              item
              className={classes.right}
              xl={4}
              lg={4}
              md={4}
              sm={12}
              xs={12}
            >
              <Paper elevation={0}>
                <RightCD onClickOpenVideo={handleToggleDialog} />
              </Paper>
            </Grid>
          </Grid>
        </Container>
      </Box>
      <Dialog
        className={classes.DialogCustom}
        fullScreen={fullScreen}
        maxWidth="lg"
        onClose={handleToggleDialog}
        aria-labelledby="customized-dialog-title"
        open={isOpenDialog}
      >
        <DialogTitle id="customized-dialog-title" onClose={handleToggleDialog}>
          <span className={classes.smallTitle}>Giới thiệu khóa học</span>
          <span className={classes.iconClose} onClick={handleToggleDialog}>
            <Close />
          </span>
          <br />
          <span className={classes.titleVideo}>{course.title}</span>
        </DialogTitle>
        <DialogContent dividers>
          <div className={classes.video}>
            <video autoPlay muted loop className="video__play" controls>
              <source src={course.demo?.urlVideo} type="video/mp4"></source>
            </video>
          </div>
        </DialogContent>
      </Dialog>
    </>
  );
}

export default CourseDetail;
