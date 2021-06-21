import { makeStyles } from "@material-ui/core";

const CSSInfomationFeature = makeStyles((theme) => ({
  root: {
    paddingTop: " 50px",
    fontFamily: " 'Open Sans', sans-serif",
    background: "var(--colorWhite1)",
    minHeight: "100vh",
  },
  backgroundHeader: {
    height: "64px",
    background: "var(--colorBlack1)",
  },
  //left
  leftRoot: {
    color: "var(--colorBlack1)",
    backgroundColor: "var(--colorWhite0)",
    borderRadius: "14px",
    boxShadow: "0px 0px 10px var(--colorBlack1)",
    "&>ul": {
      display: "flex",
      flexFlow: "column nowrap",
      "&>a": {
        color: "var(--colorBlack1)",
        textDecoration: "none",
        cursor: "pointer",
        "&:hover": {
          color: "var(--colorBlack1)",
          fontWeight: 600,
        },

        "&>li": {
          padding: "20px 15px 20px 15px",
          borderRadius: "10px",
          // color: "var(--colorBlack1)",
          "&:hover": {
            color: "var(--colorBlack1)",
          },
        },
      },
      "&>.active": {
        color: "var(--colorBlack1)",
        fontWeight: 600,
        background: "var(--colorWhite2)",
      },
      "&>li": {
        padding: "20px 15px 20px 15px",

        // color: "var(--colorBlack1)",
        cursor: "pointer",
        "&:hover": {
          color: "var(--colorBlack1)",
          fontWeight: 600,
        },
      },
      "&>li:first-child": {
        display: "flex",
        alignItems: "center",
        backgroundImage:
          "linear-gradient(to top right,var(--colorOrange1),var(--colorOrange2))",
        color: "var(--colorWhite1)",
        borderTopLeftRadius: "14px",
        borderTopRightRadius: "14px",
        padding: "20px 10px 20px 10px",
        "&>div": {
          // marginRight: 20,
          marginLeft: 15,
        },
        "&>div:last-of-type": {
          display: "flex",
          flexFlow: "column",
          "&>a": {
            textDecoration: "none",
            color: "var(--colorWhite0)",
            fontWeight: 600,
            "&>span": {
              fontSize: 18,

              "&>i": {
                fontSize: 18,
              },
              "&>.red": {
                color: "var(--colorRed1)",
              },
              "&>.green": {
                color: "var(--colorGreen2)",
              },
            },
          },
        },
        "&:hover": {
          color: "var(--colorWhite1)",
        },
      },
    },
  },
}));
export default CSSInfomationFeature;
