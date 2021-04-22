import { AppBar, IconButton, makeStyles, Toolbar } from "@material-ui/core";
import { ArrowBackIos } from "@material-ui/icons";
import React from "react";
import { Link } from "react-router-dom";
const useStyles = makeStyles((theme) => ({
  root: {
    background: "var(--colorBlack1)",
    "&>div": {
      minHeight: 50,
    },
    "&>div>ul": {
      display: "flex",
      alignItems: "center",
      fontFamily: "'Open Sans', sans-serif",
      "&>li": {
        "&>.title": {
          color: "var(--colorWhite1)",
          fontSize: "20px",
          fontWeight: "600",
          display: "-webkit-box",
          "-webkit-line-clamp": 1,
          "-webkit-box-orient": "vertical",
          overflow: "hidden",
        },
      },
      "&>li:nth-child(2)": {
        marginRight: 15,
        paddingRight: 15,
        "&>i": {
          cursor: "pointer",
        },
        borderRight: "1px solid var(--colorWhite1)",
      },
      "&>li:first-child": {
        marginRight: 20,
        "&>i": {
          cursor: "pointer",
        },
      },
    },
  },
  logo: {
    height: theme.spacing(4),
    display: "block",
  },
  backgroundHeader: {
    minHeight: "50px",
  },
  [theme.breakpoints.only("xs")]: {
    backgroundHeader: {
      minHeight: "50px",
    },
    root: {
      "&>div": {
        minHeight: 50,
      },
    },
  },
}));

function HeaderLecture(props) {
  const classes = useStyles();
  return (
    <>
      <AppBar className={classes.root} position="fixed">
        <Toolbar>
          <ul>
            <li>
              <i className="fas fa-chevron-left"></i>
            </li>
            <li>
              <Link to="/">
                <img src="/assets/images/logo2.png" className={classes.logo} />
              </Link>
            </li>
            <li>
              <span className="title">Muộn Rồi Mà Sao Còn</span>
            </li>
          </ul>
        </Toolbar>
      </AppBar>
      <div className={classes.backgroundHeader} />
    </>
  );
}

export default HeaderLecture;
