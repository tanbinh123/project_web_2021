import InputBase from "@material-ui/core/InputBase";
import { fade, makeStyles } from "@material-ui/core/styles";
import SearchIcon from "@material-ui/icons/Search";
import classNames from "classnames";
import React, { useState } from "react";

// css
const useStyles = makeStyles((theme) => ({
  search: {
    display: "none",
    [theme.breakpoints.down("xs")]: {
      display: "flex",
      position: "relative",
      borderRadius: theme.shape.borderRadius,

      margin: theme.spacing(1, 1, 1, 0),
      marginLeft: 0,
      width: "40px",

      transitionDuration: "0.3s",
    },
  },
  searchIcon: {
    padding: theme.spacing(0, 1),
    height: "100%",
    position: "absolute",
    pointerEvents: "none",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
  },
  inputRoot: {
    color: "inherit",
  },
  inputInput: {
    [theme.breakpoints.down("xs")]: {
      padding: theme.spacing(1, 1, 1, 0),
      // vertical padding + font size from searchIcon
      paddingLeft: `calc(1em + ${theme.spacing(4)}px)`,
      transition: theme.transitions.create("width"),
      width: "100%",
    },
  },
  showMobile: {
    display: "none",
    [theme.breakpoints.down("sm")]: {
      display: "flex",
    },
  },
  sizeSearch: {
    width: "150px",
    transitionDuration: "0.3s",
    backgroundColor: fade(theme.palette.common.white, 0.15),
    "&:focus": {
      backgroundColor: fade(theme.palette.common.white, 0.25),
    },
  },
}));

InputSearchMobile.propTypes = {};

function InputSearchMobile(props) {
  const classes = useStyles();
  const [sizeSearch, SetSizeSearch] = useState(false);
  function handleOnClickSearch() {
    SetSizeSearch(!sizeSearch);
  }
  return (
    <div
      className={classNames(
        classes.search,
        classes.showDesktop,
        sizeSearch && classes.sizeSearch
      )}
      onClick={handleOnClickSearch}
      onBlur={handleOnClickSearch}
    >
      <div className={classes.searchIcon}>
        <SearchIcon />
      </div>
      <InputBase
        classes={{
          root: classes.inputRoot,
          input: classes.inputInput,
        }}
        inputProps={{ "aria-label": "search" }}
      />
    </div>
  );
}

export default InputSearchMobile;
