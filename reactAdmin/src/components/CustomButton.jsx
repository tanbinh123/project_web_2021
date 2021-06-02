import { Button, makeStyles } from "@material-ui/core";
import classNames from "classnames";
import React from "react";
const useStyles = makeStyles((theme) => ({
  CustomButton: {
    background:
      "linear-gradient(45deg, var(--colorBlue1) 30%, var(--colorBlue2) 90%)",
    backgroundSize: "200%",
    transition: "0.3s",
    "&:hover": {
      backgroundPosition: "right",
    },
    border: 0,
    color: "white",
    height: 35,
    padding: "0 15px",
    boxShadow: "0 3px 2px 2px #3498db30",
    borderRadius: "10px",
  },
}));
function CustomButton(props) {
  const {
    title = "",
    type = "button",
    size = "medium",
    variant = "text",
    fullWidth = false,
    css = true,
    color = "default",
    onClick = null,
  } = props;
  const classes = useStyles();
  return (
    <Button
      size={size}
      type={type}
      variant={variant}
      fullWidth={fullWidth}
      color={color}
      className={classNames(css && classes.CustomButton)}
      onClick={() => {
        if (onClick) onClick();
      }}
    >
      {title}
    </Button>
  );
}

export default CustomButton;
