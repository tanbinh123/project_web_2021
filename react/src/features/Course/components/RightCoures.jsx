import React from "react";
import PropTypes from "prop-types";
import { Grid, makeStyles } from "@material-ui/core";
import { colorBlack1 } from "../../../components/color/color";
import CardCourse from "../../../components/card/CardCourse";

RightCoures.propTypes = {};
const useStyles = makeStyles((theme) => ({
  root: {
    padding: "20px",
  },
}));
function RightCoures(props) {
  const classes = useStyles();
  const { dataCourse } = props;
  return (
    <div className={classes.root}>
      <Grid container spacing={3}>
        <Grid item xl={4} lg={4} md={4} sm={6} xs={12}>
          <CardCourse title="" description="" />
        </Grid>
        <Grid item xl={4} lg={4} md={4} sm={6} xs={12}>
          <CardCourse />
        </Grid>
        <Grid item xl={4} lg={4} md={4} sm={6} xs={12}>
          <CardCourse />
        </Grid>
        <Grid item xl={4} lg={4} md={4} sm={6} xs={12}>
          <CardCourse />
        </Grid>
        <Grid item xl={4} lg={4} md={4} sm={6} xs={12}>
          <CardCourse />
        </Grid>
        <Grid item xl={4} lg={4} md={4} sm={6} xs={12}>
          <CardCourse />
        </Grid>
      </Grid>
    </div>
  );
}

export default RightCoures;
