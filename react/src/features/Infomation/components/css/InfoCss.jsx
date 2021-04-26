import { makeStyles } from "@material-ui/core";

const InfoCss = makeStyles((theme) => ({
  avatar: {},
  //Info
  rightRoot: {
    //o tren
    "&>div:first-of-type": {
      // backgroundImage:
      //   "linear-gradient(to top right,var(--colorOrange1),var(--colorOrange2))",
      display: "flex",
      justifyContent: "space-between",
      padding: "30px 40px 20px 40px",
      color: "var(--colorWhite0)",

      borderTopLeftRadius: "20px",
      borderTopRightRadius: "20px",
      // boxShadow: "0px 0px 10px var(--colorOrange1)",
      "&>div:first-of-type>ul": {
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
      "&>div:last-of-type": {
        fontWeight: "300",
        "&>ul": {
          "&>li": {
            marginBottom: 10,
          },
          "&>li:first-child": {
            "&>span": {
              "&>i": {
                fontSize: "20px",
              },
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
      // boxShadow: "0px 3px 7px var(--colorOrange1)",
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
  [theme.breakpoints.down("xs")]: {
    rightRoot: {
      //o tren
      // "&>div": {},
      "&>div:first-of-type": {
        "&>div:first-of-type>ul": {
          display: "flex",
          flexFlow: "column",
          alignItems: "center",
          "&>li:first-child": {
            marginRight: 0,
          },
        },
        //ben phai
        "&>div:last-of-type": {
          "&>ul": {
            display: "flex",
            flexFlow: "column",
            alignItems: "center",
          },
        },
      },
    },
  },
}));
export default InfoCss;
