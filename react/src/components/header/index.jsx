import { Grid, Typography } from "@material-ui/core";
import AppBar from "@material-ui/core/AppBar";
import { fade, makeStyles } from "@material-ui/core/styles";
import Toolbar from "@material-ui/core/Toolbar";
import { KeyboardBackspace } from "@material-ui/icons";
import classNames from "classnames";
import React, { useEffect, useRef, useState } from "react";
import { Link, useHistory } from "react-router-dom";
import { colorBlack1, colorWhite1, colorWhite2 } from "../color/color";
import InputSearchAppbar from "./components/InputSearch";
import InputSearchAppbarMobile from "./components/InputSearchMobile";
import RightAppbar from "./components/RightAppbar";

// css
const useStyles = makeStyles((theme) => ({
  root: {
    fontFamily: "'Open Sans', sans-serif",
    transition: "all 1s linear",
    "& > div": {
      display: "block",
    },
    "& > .searchMoblie": {
      display: "none",
    },
  },
  OpenSearchMenu: {
    opacity: 1,
    [theme.breakpoints.only("xs")]: {
      "& > div": {
        display: "none",
      },
      "& >.searchMoblie": {
        display: "flex",
        "&>.searchMoblie-div": {
          display: "flex",
          alignItems: "center",
          flex: "1 1 auto",
          "& > div": {
            marginLeft: 20,
            flexBasis: "80%",
          },
          "& > svg": { cursor: "pointer" },
        },
      },
    },
  },
  logo: {
    height: theme.spacing(5),
    display: "block",
  },
  course: {
    fontWeight: "600",
    color: colorWhite1,
    lineHeight: "3",
    display: "block",
    [theme.breakpoints.down("sm")]: {
      display: "none",
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
  customsAppBarHome: {
    background: "inherit",
    transition: "background-color .3s linear",
  },
  customsAppBarTop: {
    background: colorBlack1,
    transition: "background-color .3s linear",
  },
  customsAppBarBottom: {
    backgroundColor: colorBlack1,
    transition: "background-color .3s linear",
    opacity: "0.95",
  },
  listDrawer: {
    width: 200,
    backgroundColor: colorWhite2,
  },
  paper: {
    background: colorWhite1,
  },
  linkNone: {
    textDecoration: "none",
  },
}));

export default function Header() {
  const classes = useStyles();
  const { location } = useHistory();
  const navRef = useRef();
  const [isOpenSearchMB, setIsOpenSearchMB] = useState(false);
  const [navBackground, setNavBackground] = useState("customsAppBarHome");
  navRef.current = navBackground;
  useEffect(() => {
    if (location.pathname !== "/") {
      setNavBackground("customsAppBarTop");
      function handleScrollAppBar() {
        const isHeight = window.scrollY > 120;
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
    } else {
      function handleScrollAppBar() {
        const isHeight = window.scrollY > 120;
        if (isHeight) {
          setNavBackground("customsAppBarBottom");
        } else {
          setNavBackground("customsAppBarHome");
        }
      }
      document.addEventListener("scroll", handleScrollAppBar);
      return () => {
        document.removeEventListener("scroll", handleScrollAppBar);
      };
    }
  }, []);

  const handleOpenSearch = () => {
    setIsOpenSearchMB(!isOpenSearchMB);
  };

  //return
  return (
    <div>
      <AppBar
        className={classNames(classes.customsAppbar, classes[navRef.current])}
        position="fixed"
      >
        <Toolbar>
          <Grid
            container
            className={classNames(
              classes.root,
              isOpenSearchMB && classes.OpenSearchMenu
            )}
          >
            <Grid item xl={1} lg={1}></Grid>
            <Grid item xl={2} lg={2} md={3} sm={3} xs={3}>
              <Link to="/">
                <img src="/assets/images/logo2.png" className={classes.logo} />
              </Link>
            </Grid>
            <Grid item xl={2} lg={2} md={2}>
              <Link to="/course" className={classes.linkNone}>
                <Typography className={classes.course}>KHÓA HỌC</Typography>
              </Link>
            </Grid>
            <Grid item xl={3} lg={3} md={4} sm={6} xs={7}>
              <InputSearchAppbar openSearch={handleOpenSearch} />
            </Grid>
            <Grid
              item
              xl={3}
              lg={3}
              md={3}
              sm={3}
              xs={2}
              className={classes.floatRight}
            >
              <RightAppbar />
            </Grid>
            <Grid item xl={1} lg={1}></Grid>
            <Grid item xs={12} className="searchMoblie">
              <div className="searchMoblie-div">
                <KeyboardBackspace onClick={handleOpenSearch} />
                <InputSearchAppbarMobile />
              </div>
            </Grid>
          </Grid>
        </Toolbar>
      </AppBar>
    </div>
  );
}
