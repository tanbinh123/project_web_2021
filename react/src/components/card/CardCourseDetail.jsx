import { Avatar, Grid } from "@material-ui/core";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import CardMedia from "@material-ui/core/CardMedia";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import { PeopleAlt } from "@material-ui/icons";
import Rating from "@material-ui/lab/Rating";
import PropTypes from "prop-types";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import ButtonSmall from "../Button/ButtonSmall";
import { colorBlack1, colorBlack2, colorWhite1 } from "../color/color";
import { convertVND } from "../tools/Tools";

const useStyles = makeStyles((theme) => ({
  root: {
    position: "sticky",
    top: "82px",
    marginLeft: "24px",
    marginBottom: "28px",

    background: "#f5f5f5",
    paddingBottom: "20px",

    transition: "all .3s ease-in-out",

    display: "flex",
    flexDirection: "column",
    alignItems: "center",

    boxShadow: "0 2px 4px rgb(0 0 0 / 8%), 0 4px 12px rgb(0 0 0 / 8%)",
    borderRadius: "4%",

    height: 450,
  },
  image: {
    width: "calc(100% - 2px)",
    margin: "2px 0 20px",
    position: "relative",
    borderRadius: "5px",
    overflow: "hidden",
    border: "1px solid #ccc",
    "-webkit-user-select": "none",
    "-moz-user-select": "none",
    "-ms-user-select": "none",
    userSelect: "none",
  },
  bgImage: {
    backgroundImage: "url(../assets/images/qiqi.jpg)",
    width: "100%",
    paddingTop: "56%",
    backgroundRepeat: "no-repeat",
    backgroundPosition: "50% 50%",
    backgroundSize: "100% auto",
  },
}));
CardCourseDetail.propTypes = {};

CardCourseDetail.defaultProps = {};
export default function CardCourseDetail(props) {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <div className={classes.image}>
        <div className={classes.bgImage}></div>
      </div>
      <div className={classes.content}>
        <p>{convertVND(2000000)}</p>
        <ButtonSmall title="Đăng Kí Học" />
        <p>Số lượng bài học</p>
        <p>Thời Lượng</p>
        <p>Truy cập được từ SmartPhone và PC</p>
        <p>Trọn đời truy cập</p>
        <p>Đảng bảo chất lượng</p>
      </div>
    </div>
  );
}
