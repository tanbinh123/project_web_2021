import { makeStyles } from "@material-ui/core";

const CSSInfomationFeature = makeStyles((theme) => ({
  root: {
    marginTop: 50,
    fontFamily: " 'Open Sans', sans-serif",
  },
  backgroundHeader: {
    height: "64px",
    background: "var(--colorBlack1)",
  },
  //left
  leftRoot: {
    color: "var(--colorBlack1)",
    backgroundColor: "var(--colorWhite1)",
    borderRadius: "5%",
    "&>ul": {
      display: "flex",
      flexFlow: "column nowrap",
      "&>li": {
        padding: "20px 15px 20px 15px",

        "&>a": {
          color: "var(--colorBlack1)",
          textDecoration: "none",
          cursor: "pointer",
          "&:hover": {
            color: "var(--colorOrange1)",
          },
        },
        "&>.active": {
          color: "var(--colorOrange1)",
        },
      },
      "&>li:first-child": {
        display: "flex",
        alignItems: "center",
        backgroundImage:
          "linear-gradient(to top right,var(--colorOrange1),var(--colorOrange2))",
        borderBottom: "1px solid var(--colorWhite1)",
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
        "&:hover": {
          color: "var(--colorWhite1)",
        },
      },
    },
  },
}));
export default CSSInfomationFeature;
