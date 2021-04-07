import React from "react";
import PropTypes from "prop-types";
import { makeStyles } from "@material-ui/core";
import classNames from "classnames";
import "./CssColor.scss";

CssColor.propTypes = {};
const useStyles = makeStyles((theme) => ({
  testcolor: {
    color: "var(--colorBlue1)",
  },
}));
function CssColor(props) {
  const classes = useStyles();
  return (
    <div className="abc">
      <div className={classes.testcolor}>
        nguyen huy thanh sang
        <button>test</button>
      </div>
    </div>
  );
}

export default CssColor;
