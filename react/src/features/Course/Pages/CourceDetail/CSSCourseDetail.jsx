import { makeStyles } from "@material-ui/core";
import { colorBlack1, colorWhite1 } from "../../../../components/color/color";

const CourseDetailCSS = makeStyles((theme) => ({
  root: {
    background: "white",
    padding: "50px 0px 20px 0px",
  },
  left: {
    display: "block",
    [theme.breakpoints.down("sm")]: {
      display: "none",
    },
  },
  right: {},
  backgroundHeader: {
    height: "64px",
    background: colorBlack1,
  },
}));
export default CourseDetailCSS;
