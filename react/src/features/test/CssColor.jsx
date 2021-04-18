import React from "react";
import PropTypes from "prop-types";
import { makeStyles } from "@material-ui/core";
import classNames from "classnames";
import "./CssColor.scss";

CssColor.propTypes = {};
const useStyles = makeStyles((theme) => ({
  testcolor: {
    color: "var(--colorWhite1)",
    backgroundColor: "var(--colorBlack1)",
  },
}));
function CssColor(props) {
  const classes = useStyles();
  const handleChangeTheme = () => {
    const currentTheme = localStorage.getItem("theme");
    if (!currentTheme) {
      document.documentElement.setAttribute("data-theme", "dark");
      localStorage.setItem("theme", "dark");
    } else if (currentTheme === "dark") {
      document.documentElement.setAttribute("data-theme", "dark");
      localStorage.setItem("theme", "light");
    } else {
      document.documentElement.setAttribute("data-theme", "light");
      localStorage.setItem("theme", "dark");
    }
  };
  return (
    <div className="abc">
      <div className={classes.testcolor}>
        nguyen huy thanh sang
        <button onClick={handleChangeTheme}>test</button>
      </div>
    </div>
  );
}

export default CssColor;
