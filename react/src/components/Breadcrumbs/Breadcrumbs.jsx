import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import { School, ViewList } from "@material-ui/icons";
import HomeIcon from "@material-ui/icons/Home";
import React from "react";
import { colorBlack1 } from "../color/color";
import { Link } from "react-router-dom";

const useStyles = makeStyles((theme) => ({
  link: {
    display: "flex",
    textDecoration: "none",
    color: "var(--colorGray2)",
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
}

export default function IconBreadcrumbs(props) {
  const { nameCourse = "" } = props;
  const classes = useStyles();

  return (
    <Breadcrumbs aria-label="breadcrumb">
      <Link to="/" className={classes.link}>
        <HomeIcon className={classes.icon} />
        Trang chủ
      </Link>
      <Link to="/course" className={classes.link}>
        <ViewList className={classes.icon} />
        Dang sách Khóa học
      </Link>
      <Typography color="textPrimary" className={classes.current}>
        <School className={classes.icon} />
        <span>{nameCourse}</span>
      </Typography>
    </Breadcrumbs>
  );
}
