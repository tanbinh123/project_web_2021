import { makeStyles } from "@material-ui/core";
import {
  colorBlack1,
  colorBlack2,
  colorOrange2,
} from "../../../../components/color/color";

const CourseDetailCSS = makeStyles((theme) => ({
  root: {
    background: "white",
    padding: "50px 0px 20px 0px",
  },
  left: {
    display: "block",
  },
  right: {},
  backgroundHeader: {
    height: "64px",
    background: colorBlack1,
  },
  smallTitle: {
    fontSize: 16,
  },
  iconClose: {
    float: "right",
    fontSize: 18,
    color: colorBlack2,
    cursor: "pointer",
    "&:hover": {
      color: colorOrange2,
    },
  },
  DialogCustom: {
    fontFamily: "font-family: 'Open Sans', sans-serif;",
  },
  titleVideo: {
    fontWeight: "600",
    fontSize: "20px",
  },
  video: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    height: 480,
    "&>.video__play": {
      width: 852,
      height: 480,
    },
  },
  [theme.breakpoints.only("xs")]: {
    video: {
      height: 250,
      "&>.video__play": {
        width: 327,
        height: 188,
      },
    },
  },
}));
export default CourseDetailCSS;
