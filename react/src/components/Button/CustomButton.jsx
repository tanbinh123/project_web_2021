import { Button, makeStyles } from "@material-ui/core";
import React from "react";
const useStyles = makeStyles((theme) => ({
  CustomButton: {
    background: "linear-gradient(45deg, #f1c40f 30%, #f39c12 90%)",
    backgroundSize: "200%",
    transition: "0.3s",
    "&:hover": {
      backgroundPosition: "right",
    },
    border: 0,
    color: "white",
    height: 40,
    padding: "0 30px",
    boxShadow: "0 3px 2px 2px rgba(255, 105, 135, .3)",
    borderRadius: "20px",
  },
}));
function CustomButton(props) {
  const {
    title = "",
    type = "button",
    size = "medium",
    variant = "text",
    fullWidth = false,
    css = false,
    color = "default",
  } = props;
  const classes = useStyles();
  return (
    <Button
      size={size}
      type={type}
      variant={variant}
      fullWidth={fullWidth}
      color={color}
      className={css && classes.CustomButton}
    >
      {title}
    </Button>
  );
}

export default CustomButton;
