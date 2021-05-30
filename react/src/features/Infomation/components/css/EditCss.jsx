import { makeStyles } from "@material-ui/core";

const EditCss = makeStyles((theme) => ({
  rightRoot: {
    //o tren
    "&>div:first-of-type": {
      // backgroundImage:
      //   "linear-gradient(to top,var(--colorBlack1),var(--colorBlack2))",
      display: "flex",
      justifyContent: "space-between",
      padding: "30px 40px 20px 40px",
      color: "var(--colorWhite0)",
      borderTopLeftRadius: "20px",
      borderTopRightRadius: "20px",
      boxShadow: "0px 0px 10px var(--colorBlack1)",

      "&>ul": {
        display: "flex",
        flexFlow: "column",
        alignItems: "flex-start",
        width: "100%",
        "&>li": {
          display: "flex",
          width: "100%",
        },
        "&>li:nth-child(1)": {
          // justifyContent: "center",
          marginBottom: 15,
          "&>span": {
            fontSize: "25px",
            fontWeight: 600,
          },
        },
        "&>li:nth-child(2)": {
          justifyContent: "flex-end",
          "&>span": {},
        },
      },
    },

    // o duoi
    "&>div:last-of-type": {
      backgroundColor: "var(--colorWhite0)",
      color: "var(--colorBlack2)",
      padding: "30px 20px 15px 20px",

      borderBottomLeftRadius: "20px",
      borderBottomRightRadius: "20px",
      boxShadow: "0px 3px 7px var(--colorBlack1)",
      "&>div": {
        display: "flex",
        justifyContent: "center",
      },
      "&>div:first-of-type": {
        margin: "30px 0",
        "&>span": {
          fontSize: 18,
          "&>span": {
            fontWeight: "600",
          },
        },
      },
      "&>div:nth-child(2)": {
        marginBottom: 30,
      },
      "& .MuiLinearProgress-barColorPrimary": {
        backgroundColor: "var(--colorOrange2)",
      },
    },
  },
  bgAvatar: {
    // padding: "0px 40px 0px 40px",
  },
  Avatar: {
    width: 120,
    height: 120,
    marginBottom: 30,
    cursor: "pointer",
  },
  flexRow: {
    display: "flex",
    flexFlow: "row",
    justifyContent: "space-around",
  },
  flexColumn: {
    display: "flex",
    flexFlow: "column",
  },
  rowEdit: {
    display: "flex",
    flexFlow: "row",
    alignItems: "center",
    width: 500,
    "&>span": {
      minWidth: 130,
    },
  },
  bottomEdit: {
    display: "flex",
    justifyContent: "center",
    margin: "50px 0 20px 0",
  },
  [theme.breakpoints.down("md")]: {
    bgAvatar: {
      display: "flex",
      flexFlow: "column",
      alignItems: "center",
    },
    flexRow: {
      display: "flex",
      flexFlow: "column",
    },
    rowEdit: {
      "&>span": {
        display: "none",
      },
      width: "100%",
    },
  },
}));
export default EditCss;
