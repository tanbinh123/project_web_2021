import React from "react";
import PropTypes from "prop-types";
import LeftCDCSS from "./CSSLeftCD";

LeftCD.propTypes = {};

function LeftCD(props) {
  const classes = LeftCDCSS();
  return <div className={classes.root}>Left Content</div>;
}

export default LeftCD;
