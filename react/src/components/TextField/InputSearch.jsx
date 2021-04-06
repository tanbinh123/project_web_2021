import React from "react";
import PropTypes from "prop-types";
import { fade, InputAdornment, makeStyles, TextField } from "@material-ui/core";
import { SearchOutlined } from "@material-ui/icons";
import { colorBlack1, colorWhite1, colorWhite2 } from "../color/color";

InputSearch.propTypes = {};
const useStyles = makeStyles((theme) => ({
  root: {
    position: "relative",
    display: "flex",
    justifyContent: "flex-end",
  },
  search: {
    height: 38,
    position: "relative",
    borderRadius: theme.shape.borderRadius,
    backgroundColor: fade(theme.palette.common.white, 0.15),
    "&:hover": {
      backgroundColor: fade(theme.palette.common.white, 0.25),
    },
    margin: theme.spacing(0.7, 2, 0, 0),
    marginLeft: 0,
    width: "100%",
    "& > div > .MuiAutocomplete-endAdornment": {
      top: "calc(50% - 9px)",
    },
    "&>div>input": {
      fontFamily: "'Open Sans', sans-serif",
      marginLeft: 50,
      height: "100%",
      color: colorWhite1,
      padding: "5px 0 !important",
    },
    "&>div>div>button>span": {
      color: colorWhite1,
    },
    [theme.breakpoints.down("sm")]: {
      width: "20%",
    },
    "& .MuiInput-underline:after": {
      borderBottom: "none",
    },
    "& .MuiInput-underline:before": {
      borderBottom: "none",
    },
    "& .MuiInput-underline:hover:not(.Mui-disabled):before": {
      borderBottom: "none",
    },
  },
  icon: {
    position: "absolute",
    transform: "translate(-50%, -40%)",
    top: "50%",
    left: "10%",
    color: colorWhite2,
    [theme.breakpoints.down("sm")]: {
      left: "80%",
    },
  },
}));
function InputSearch({ onChange, params }) {
  const classes = useStyles();
  const handleOnChange = (e) => {
    if (onChange) onChange(e.target.value);
  };
  return (
    <div className={classes.root}>
      <SearchOutlined className={classes.icon} />
      <TextField
        // onClick={() => {}}
        className={classes.search}
        {...params}
        onChange={handleOnChange}
      />
    </div>
  );
}

export default InputSearch;
