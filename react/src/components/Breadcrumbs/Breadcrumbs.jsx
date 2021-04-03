import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import { School, ViewList } from "@material-ui/icons";
import HomeIcon from "@material-ui/icons/Home";
import React from "react";
import { colorBlack1 } from "../color/color";

const useStyles = makeStyles((theme) => ({
  link: {
    display: "flex",
  },
  icon: {
    marginRight: theme.spacing(0.5),
    width: 20,
    height: 20,
  },
  current: {
    color: colorBlack1,
    display: "flex",
  },
}));

function handleClick(event) {
  event.preventDefault();
  console.info("You clicked a breadcrumb.");
}

export default function IconBreadcrumbs() {
  const classes = useStyles();

  return (
    <Breadcrumbs aria-label="breadcrumb">
      <Link
        color="inherit"
        href="/"
        onClick={handleClick}
        className={classes.link}
      >
        <HomeIcon className={classes.icon} />
        Home
      </Link>
      <Link
        color="inherit"
        href="/getting-started/installation/"
        onClick={handleClick}
        className={classes.link}
      >
        <ViewList className={classes.icon} />
        List Course
      </Link>
      <Typography color="textPrimary" className={classes.current}>
        <School className={classes.icon} />
        <span>Name:Course</span>
      </Typography>
    </Breadcrumbs>
  );
}
