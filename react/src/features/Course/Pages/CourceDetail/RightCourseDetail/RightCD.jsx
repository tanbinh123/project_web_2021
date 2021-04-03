import React from "react";
import CardCourseDetail from "../../../../../components/card/CardCourseDetail";
import RightCDCSS from "./CSSRightCD";

//RightCD.propTypes = {};

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
