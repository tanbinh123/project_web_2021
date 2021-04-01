import { Grid } from "@material-ui/core";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import { Skeleton } from "@material-ui/lab";
import React from "react";
import { Link } from "react-router-dom";
import { colorBlack1, colorBlack2 } from "../color/color";

const useStyles = makeStyles((theme) => ({
  root: {
    // maxWidth: 345,
    "&:hover": {
      boxShadow:
        "0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 5px 9px 0px rgb(0 0 0 / 14%), 0px 1px 3px 0px rgb(0 0 0 / 12%)",
    },
    // height: 500,
  },
  CardActionArea: {
    "&:hover>img": {
      transform: " scale(1.1)",
      transitionDuration: "0.5s",
      transitionProperty: "transform",
    },
  },
  CardActionArea__Content: {
    minHeight: 200,
  },
  linkAuthor: {
    textDecoration: "none",
    display: "flex",
  },
  avatar: {
    width: 35,
    height: 35,
    float: "left",
  },
  name: {
    fontSize: 18,
    marginLeft: 10,
    lineHeight: "35px",
    fontWeight: 600,
    color: colorBlack2,
  },
  money: {
    display: "flex",
    height: "100%",
    alignItems: "center",
    "&>span": {
      fontSize: 20,
      fontWeight: 600,
      color: "#e74c3c",
    },
  },
  row: {
    display: "block",
  },
  title: { fontSize: 22, fontWeight: 600, color: colorBlack2 },
  button: {
    display: "flex",
    width: "100%",
    justifyContent: "flex-end",
    "& > a": {
      textDecoration: "none",
    },
  },
  bought: {
    display: "flex",
    justifyContent: "flex-end",
    "&>span": {
      display: "flex",
    },
    "& .icon": {
      fontSize: 22,
      color: colorBlack1,
    },
    "& .number": {
      fontSize: 20,
      marginLeft: 10,
      color: colorBlack1,
    },
  },
}));
export default function CardCourseSkeleton() {
  const classes = useStyles();
  return (
    <Card className={classes.root}>
      <CardActionArea className={classes.CardActionArea}>
        <Skeleton animation="wave" variant="rect" width="100%" height="170px" />
        <CardContent className={classes.CardActionArea__Content}>
          <Typography
            gutterBottom
            variant="h5"
            component="h2"
            className={classes.title}
          >
            <Skeleton
              animation="wave"
              variant="text"
              width="100%"
              height="30px"
            />
          </Typography>
          <Typography variant="body2" color="textSecondary" component="p">
            <Skeleton
              animation="wave"
              variant="text"
              width="100%"
              height="130px"
            />
          </Typography>
        </CardContent>
      </CardActionArea>
      <CardActions>
        <Grid container spacing={2}>
          <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
            <Link to="/" className={classes.linkAuthor}>
              <Skeleton
                animation="wave"
                variant="circle"
                width="35px"
                height="35px"
              />
              <Skeleton
                animation="wave"
                variant="text"
                width="90%"
                height="32px"
              />
            </Link>
          </Grid>
          <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
            <Skeleton
              animation="wave"
              variant="text"
              width="100%"
              height="40px"
            />
          </Grid>
        </Grid>
      </CardActions>
    </Card>
  );
}
