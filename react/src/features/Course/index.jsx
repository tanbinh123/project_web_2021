import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import { Box, Container, Grid, makeStyles, Paper } from "@material-ui/core";
import {
  colorBlack1,
  colorBlue1,
  colorWhite1,
  colorWhite2,
} from "../../components/color/color";
import Header from "../../components/header";
import courseApi from "../../api/courseApi";
import RightCoures from "./components/RightCoures";

CourseFeatures.propTypes = {};
const useStyles = makeStyles((theme) => ({
  root: {
    background: colorWhite1,
    padding: "50px 0px 20px 0px",
  },
  left: {
    display: "block",
    [theme.breakpoints.down("sm")]: {
      display: "none",
    },
  },
  right: {},
  backgroundHeader: {
    height: "64px",
    background: colorBlack1,
  },
}));
function CourseFeatures(props) {
  const classes = useStyles();
  const [dataCourse, setDataCourse] = useState({});
  useEffect(() => {
    (async () => {
      const data = await courseApi.getAll();
      setDataCourse(data);
    })();
  }, []);
  return (
    <>
      <Header />
      <Box className={classes.backgroundHeader} />
      <Box className={classes.root}>
        <Container>
          <Grid container spacing={2}>
            <Grid item className={classes.left} xl={3} lg={3} md={3}>
              <Paper elevation={0}>left course</Paper>
            </Grid>
            <Grid
              item
              className={classes.right}
              xl={9}
              lg={9}
              md={9}
              sm={12}
              xs={12}
            >
              <Paper elevation={0}>
                <RightCoures dataCourse={dataCourse} />
              </Paper>
            </Grid>
          </Grid>
        </Container>
      </Box>
    </>
  );
}

export default CourseFeatures;
