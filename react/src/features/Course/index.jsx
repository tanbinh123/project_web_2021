import React from "react";
import PropTypes from "prop-types";
import { Box, Container, Grid, makeStyles } from "@material-ui/core";
import {
  colorBlack1,
  colorBlue1,
  colorWhite2,
} from "../../components/color/color";
import Header from "../../components/header";

CourseFeatures.propTypes = {};
const useStyles = makeStyles((theme) => ({
  root: {
    marginTop: "64px",
    background: "#202020",
    padding: "10px",
  },
  left: {
    width: "250px",
    height: "1000px",
    background: colorWhite2,
  },
  right: {
    flex: "1 1 auto",
    background: colorBlue1,
  },
}));
function CourseFeatures(props) {
  const classes = useStyles();
  return (
    <>
      <Header />
      <Box className={classes.root}>
        <Container>
          <Grid container>
            <Grid item className={classes.left}>
              left course
            </Grid>
            <Grid item className={classes.right}>
              right course
            </Grid>
          </Grid>
        </Container>
      </Box>
    </>
  );
}

export default CourseFeatures;
