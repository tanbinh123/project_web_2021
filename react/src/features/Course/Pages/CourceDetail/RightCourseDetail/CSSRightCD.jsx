import { makeStyles } from "@material-ui/core";

const RightCDCSS = makeStyles((theme) => ({
  root: {
    height: 2000,
    [theme.breakpoints.down("sm")]: {
      height: "100%",
    },
  },
}));
export default RightCDCSS;
