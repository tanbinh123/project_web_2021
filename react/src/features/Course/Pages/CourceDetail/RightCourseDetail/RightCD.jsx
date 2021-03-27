import React from "react";
import PropTypes from "prop-types";
import RightCDCSS from "./CSSRightCD";
import CardCourseDetail from "../../../../../components/card/CardCourseDetail";

RightCD.propTypes = {};

function RightCD(props) {
  const classes = RightCDCSS();
  return (
    <div className={classes.root}>
      <CardCourseDetail />
    </div>
  );
}

export default RightCD;
