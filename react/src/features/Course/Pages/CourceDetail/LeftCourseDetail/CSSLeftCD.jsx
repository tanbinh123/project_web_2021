import { makeStyles } from "@material-ui/core";
import {
  colorBlack2,
  colorGray2,
  colorOrange2,
} from "../../../../../components/color/color";

const LeftCDCSS = makeStyles(() => ({
  root: {
    fontFamily: "'Open Sans', sans-serif",
  },
  introduce: {
    "&> h1": {
      fontFamily: "'Montserrat', sans-serif",
      color: colorBlack2,
      marginBottom: "20px",
    },
    "&> span": {
      color: colorBlack2,
      marginBottom: "20px",
    },
    "&> h2": {
      color: colorBlack2,
      margin: "30px 0px 20px 0px",
    },
    "&> ul": {
      listStyle: "none",
      display: "flex",
      flexFlow: "row wrap",
      "&> li": {
        fontSize: 16,
        fontWeight: 400,
        flexBasis: "50%",
        padding: "0px 25px",
        position: "relative",
        "&> svg": {
          fontSize: 18,
          position: "absolute",
          top: 0,
          left: 0,
          color: "#e67e22",
        },
      },
    },
  },
  contentCourse: {
    "&> h2": {
      color: colorBlack2,
      margin: "30px 0px 20px 0px",
    },
    "&> ul": {
      listStyle: "none",
      display: "flex",
      flexFlow: "row wrap",
      "&> li": {
        fontSize: 16,
        fontWeight: 400,
        "&> svg": {
          color: colorGray2,
          fontSize: 10,
          margin: "0 10px",
        },
      },
    },
  },
}));
export default LeftCDCSS;
