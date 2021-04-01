import React from "react";
import PropTypes from "prop-types";
import RightCDCSS from "./CSSRightCD";
import CardCourseDetail from "../../../../../components/card/CardCourseDetail";

RightCD.propTypes = {};

function RightCD(props) {
  const { onClickOpenVideo } = props;
  function handleOnClickOpenVideo() {
    if (!onClickOpenVideo) return;
    onClickOpenVideo();
  }
  const classes = RightCDCSS();
  return (
    <div className={classes.root}>
      <CardCourseDetail onClickOpenVideo={handleOnClickOpenVideo} />
    </div>
  );
}

export default RightCD;
