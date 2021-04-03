import { Grid, makeStyles } from "@material-ui/core";
import PropTypes from "prop-types";
import React from "react";
import CardCourseSkeleton from "../../../../../components/card/CardCourseSekeleton";

SkeletonCourse.propTypes = {
  length: PropTypes.number,
};
SkeletonCourse.defaultProps = {
  length: 9,
};
const useStyles = makeStyles((theme) => ({
  root: {
    padding: "20px",
  },
}));
function SkeletonCourse(props) {
  const classes = useStyles();
  const { length } = props;
  return (
    <div className={classes.root}>
      <Grid container spacing={3}>
        {Array.from(new Array(length)).map((x, index) => (
          <Grid key={index} item xl={4} lg={4} md={6} sm={6} xs={12}>
            <CardCourseSkeleton />
          </Grid>
        ))}
      </Grid>
    </div>
  );
}

export default SkeletonCourse;
