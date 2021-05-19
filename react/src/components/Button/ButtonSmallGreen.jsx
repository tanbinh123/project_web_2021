import { Button, makeStyles } from "@material-ui/core";
import PropTypes from "prop-types";
import React from "react";
const useStyles = makeStyles((theme) => ({
  CustomButton: {
    // Some CSS
    background:
      "linear-gradient(45deg, var(--colorGreen2) 30%, var(--colorGreen1) 90%)",
    backgroundSize: "200%",
    transition: "0.3s",
    "&:hover": {
      backgroundPosition: "right",
    },
    border: 0,
    color: "white",
    height: 40,
    // padding: "0 30px",
    boxShadow: "0 3px 5px 2px rgba(255, 105, 135, .3)",
    borderRadius: "25px",

    textTransform: "unset",
    "& > span": {
      color: "var(--colorWhite0)",
    },
  },
}));

function ButtonSmallGreen(props) {
  const {
    title = "",
    disabled = false,
    size = "small",
    fullWidth = false,
  } = props;
  const classes = useStyles();
  return (
    <Button
      disabled={disabled}
      onClick={props.onClickBuy}
      className={classes.CustomButton}
      size={size}
      fullWidth={fullWidth}
    >
      {title}
    </Button>
  );
}

export default ButtonSmallGreen;
