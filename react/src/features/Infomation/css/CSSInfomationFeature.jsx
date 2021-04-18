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
          marginRight: 20,
          marginLeft: 15,
        },
        "&:hover": {
          color: "var(--colorWhite1)",
        },
      },
    },
  },
  avatar: {},
  //Info
  rightRoot: {
    //o tren
    "&>div:first-of-type": {
      backgroundImage:
        "linear-gradient(to top right,var(--colorOrange1),var(--colorOrange2))",
      display: "flex",
      justifyContent: "space-between",
      padding: "30px 40px 20px 40px",
      color: "var(--colorWhite1)",
      borderTopLeftRadius: "20px",
      borderTopRightRadius: "20px",
      "&>ul": {
        display: "flex",
        alignItems: "center",
        "&>li:first-child": {
          marginRight: "20px",
        },
        "&>li:last-child": {
          fontSize: "35px",
        },
      },
      //ben phai
      "&>div": {
        fontWeight: "300",
        "&>ul": {
          "&>li": { marginBottom: 10 },
          "&>li:first-child": {
            "&>i": {
              fontSize: "20px",
            },
          },
          //facebook google
          "&>li:last-child": {
            "&>ul": {
              "&>li": {
                cursor: "pointer",
                fontSize: 20,
                "&:hover": {
                  transform: "scale(1.2)",
                },
              },
              display: "flex",
              "&>li:first-child": {
                marginRight: 20,
              },
            },
          },
        },
      },
    },
    // o duoi
    "&>div:last-of-type": {
      backgroundColor: "var(--colorWhite1)",
      color: "var(--colorBlack2)",
      padding: "30px 20px 40px 20px",

      borderBottomLeftRadius: "20px",
      borderBottomRightRadius: "20px",
      "&>ul": {
        "&>li:first-child": {
          fontSize: "30px",
          fontWeight: 600,
          marginBottom: "20px",
        },
        "&>li:last-child": {
          fontSize: "18px",
        },
      },
    },
  },
  avatarRight: {
    width: 100,
    height: 100,
    "&:hover": {},
  },
}));
export default CSSInfomationFeature;
