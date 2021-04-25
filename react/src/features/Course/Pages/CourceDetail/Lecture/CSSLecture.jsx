import { makeStyles } from "@material-ui/core";

const CSSLecture = makeStyles((theme) => ({
  root: {
    fontFamily: "'Open Sans', sans-serif",
  },
  leftRoot: {
    position: "fixed",

    width: "75%",
    overflowX: "hidden",
    overflowY: "auto",
    "&>.videoRoot": {
      "&>.video": {
        // minHeight: 400,
        minWidth: "100%",
      },
      "&>span": {
        position: "absolute",
        color: "var(--colorOrange1)",
        position: "absolute",
        left: "86%",
        top: "4%",
        zIndex: 1,
        width: "100%",
      },
    },
    height: "100%",
  },
  rightRoot: {
    position: "fixed",
    width: "25%",
    overflowX: "hidden",
    overflowY: "auto",
    height: "100%",
    "&>.title": {
      position: "fixed",
      zIndex: 1,
      display: "flex",
      background: "var(--colorWhite1)",
      padding: "20px",
      fontWeight: 600,
      borderBottom: "2px var(--colorGray2) solid",
      "&>a": {
        textDecoration: "none",
        color: "var(--colorBlack1)",
        marginRight: 10,
        fontSize: "18px",
        "&:hover": {
          color: "var(--colorOrange2)",
          transition: "all 0.2s linear",
        },
      },
      "&>i": {
        color: "var(--colorBlack1)",
        cursor: "pointer",
        "&:hover": {
          color: "var(--colorOrange2)",
          transition: "all 0.2s linear",
        },
      },
    },
    "&>.title+div": { marginTop: 75 },
  },
  [theme.breakpoints.down("md")]: {
    leftRoot: {
      position: "relative",
      width: "100%",
      "&>.video": {
        width: "100%",
      },
      height: "100%",
    },
    rightRoot: {
      position: "relative",
      width: "100%",
      "&>.title": {
        position: "relative",
      },
      "&>.title+div": { marginTop: 0 },
    },
  },
  noneList: {
    display: "none",
  },
  fullScreen: {
    width: "100%",
    "&>.video": {
      minWidth: "100%",
      height: "70%",
      background: "var(--colorGray2)",
    },
  },
}));
export default CSSLecture;
