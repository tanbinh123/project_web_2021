import { Grid, makeStyles } from "@material-ui/core";
import React from "react";
import { useForm } from "react-hook-form";
import * as yup from "yup";
import { yupResolver } from "@hookform/resolvers/yup";
import MenuRatting from "./Ratting/MenuRatting";
import ListRating from "./Ratting/ListRating";
import FormRating from "./Ratting/FormRating";
function RatingCourse(props) {
  const classes = makeStyles(() => ({
    root: {
      marginTop: "30px",
    },
    contentCourse: {
      "&> h2": {
        color: "var(--colorBlack2)",
        margin: "30px 0px 20px 0px",
      },
    },
  }))();

  return (
    <Grid item xl={12} lg={12} md={12} sm={12} xs={12} className={classes.root}>
      <div className={classes.contentCourse}>
        <h2>Đánh giá</h2>
        <MenuRatting />
        <FormRating />
        <ListRating />
      </div>
    </Grid>
  );
}

export default RatingCourse;
