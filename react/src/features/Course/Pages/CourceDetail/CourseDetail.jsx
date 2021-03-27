import { Box, Container, Grid, makeStyles, Paper } from "@material-ui/core";
import React from "react";
import { useParams } from "react-router";
import Header from "../../../../components/header/index";
import CourseDetailCSS from "./CSSCourseDetail";
import LeftCD from "./LeftCourseDetail/LeftCD";
import RightCD from "./RightCourseDetail/RightCD";

function CourseDetail() {
  const classes = CourseDetailCSS();
  const { idCourse } = useParams();
  return (
    <div className="">
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
                <LeftCD />
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
                <RightCD />
              </Paper>
            </Grid>
          </Grid>
        </Container>
      </Box>
    </div>
  );
}

export default CourseDetail;
