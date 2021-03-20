import { Grid, Typography } from "@material-ui/core";
import AppBar from "@material-ui/core/AppBar";
import { fade, makeStyles } from "@material-ui/core/styles";
import Toolbar from "@material-ui/core/Toolbar";
import classNames from "classnames";
import React, { useEffect, useRef, useState } from "react";
import { colorBlack1, colorWhite1, colorWhite2 } from "../color/color";
import InputSearchAppbar from "./components/InputSearch";
import RightAppbar from "./components/RightAppbar";

// css
const useStyles = makeStyles((theme) => ({
  root: {},
  logo: {
    height: theme.spacing(5),
    display: "block",
  },
  course: {
    fontWeight: "600",
    color: colorWhite1,
    lineHeight: "3",
    display: "none",
    [theme.breakpoints.up("md")]: {
      display: "block",
    },
  },
  floatLeft: {
    float: "left",
  },
  floatRight: {
    float: "right",
  },
  search: {
    position: "relative",
    borderRadius: theme.shape.borderRadius,
    backgroundColor: fade(theme.palette.common.white, 0.15),
    "&:hover": {
      backgroundColor: fade(theme.palette.common.white, 0.25),
    },
    margin: theme.spacing(0.7, 2, 0, 0),
    marginLeft: 0,
    width: "100%",
    [theme.breakpoints.up("sm")]: {
      width: "100%",
    },
  },
  searchIcon: {
    padding: theme.spacing(0, 2),
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
    padding: theme.spacing(1, 1, 1, 0),
    // vertical padding + font size from searchIcon
    paddingLeft: `calc(1em + ${theme.spacing(4)}px)`,
    transition: theme.transitions.create("width"),
    width: "100%",
    [theme.breakpoints.up("md")]: {
      width: "30vh",
    },
  },
  sectionDesktop: {
    display: "none",
    [theme.breakpoints.up("md")]: {
      display: "flex",
    },
  },
  sectionMobile: {
    display: "flex",
    [theme.breakpoints.up("md")]: {
      display: "none",
    },
  },
  showDesktop: {
    display: "none",
    [theme.breakpoints.up("sm")]: {
      display: "flex",
    },
  },
  customsAppbar: {
    boxShadow: "none",
  },
  customsAppBarTop: {
    background: "transparent",
    transition: "background-color .3s linear",
  },
  customsAppBarBottom: {
    backgroundColor: colorBlack1,
    transition: "background-color .3s linear",
  },
  listDrawer: {
    width: 200,
    backgroundColor: colorWhite2,
  },
  paper: {
    background: colorWhite1,
  },
}));

export default function Header() {
  const classes = useStyles();
  const navRef = useRef();
  const [navBackground, setNavBackground] = useState("customsAppBarTop");
  navRef.current = navBackground;
  useEffect(() => {
    function handleScrollAppBar() {
      const isHeight = window.scrollY > 238;
      if (isHeight) {
        setNavBackground("customsAppBarBottom");
      } else {
        setNavBackground("customsAppBarTop");
      }
    }
    document.addEventListener("scroll", handleScrollAppBar);
    return () => {
      document.removeEventListener("scroll", handleScrollAppBar);
    };
  }, []);

  //return
  return (
    <div className={classes.root}>
      <AppBar
        className={classNames(classes.customsAppbar, classes[navRef.current])}
        position="fixed"
      >
        <Toolbar>
          <Grid container>
            <Grid item lg={1}></Grid>
            <Grid item lg={2} md={3} sm={3} xs={3}>
              <img src="/assets/images/logo2.png" className={classes.logo} />
            </Grid>
            <Grid item lg={2} md={2}>
              <Typography className={classes.course}>KHÓA HỌC</Typography>
            </Grid>
            <Grid item lg={3} md={3} sm={6}>
              <InputSearchAppbar />
            </Grid>
            <Grid
              item
              lg={3}
              md={4}
              sm={3}
              xs={9}
              className={classes.floatRight}
            >
              <RightAppbar />
            </Grid>
            <Grid item lg={1}></Grid>
          </Grid>
        </Toolbar>
      </AppBar>
    </div>
  );
}
