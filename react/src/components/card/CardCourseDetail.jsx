import { makeStyles } from "@material-ui/core/styles";
import {
  AccessTime,
  LibraryBooks,
  PhoneAndroid,
  PlayCircleFilled,
  SentimentVerySatisfied,
} from "@material-ui/icons";
import React from "react";
import ButtonSmall from "../Button/ButtonSmall";
import { colorBlack1 } from "../color/color";
import { convertVND } from "../tools/Tools";

const useStyles = makeStyles((theme) => ({
  root: {
    position: "sticky",
    top: "82px",
    marginBottom: "28px",

    background: "#f5f5f5",
    paddingBottom: "20px",

    transition: "all .3s ease-in-out",

    display: "flex",
    flexDirection: "column",
    alignItems: "center",

    boxShadow: "0 2px 4px rgb(0 0 0 / 8%), 0 4px 12px rgb(0 0 0 / 8%)",
    borderRadius: "4%",
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
    background:
      "linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url(../assets/images/qiqi.jpg)",
    width: "100%",
    paddingTop: "56%",
    backgroundRepeat: "no-repeat",
    backgroundPosition: "50% 50%",
    backgroundSize: "100% auto",
  },
  content: {
    display: "flex",
    flexFlow: "column nowrap",
    "& ul": {
      listStyle: "none",
      marginTop: 20,
      "& > li": {
        display: "flex",
        color: colorBlack1,
        margin: "7px 0px",
        "& > span": {
          marginLeft: 7,
        },
      },
    },
  },
  price: {
    fontSize: "32px",
    fontWeight: "normal",
    color: "#f05123",
    margin: " 0 auto",
    opacity: " .8",
    marginBottom: 20,
  },
  iconPlay: {
    position: "absolute",
    top: "50%",
    left: "50%",
    transform: "translate(-50%, -50%)",
    width: 100,
    height: 100,
    color: "white",
    cursor: "pointer",
  },
}));
CardCourseDetail.propTypes = {};

CardCourseDetail.defaultProps = {};
export default function CardCourseDetail(props) {
  const classes = useStyles();
  const { onClickOpenVideo } = props;
  function handleOnClickOpenVideo() {
    if (!onClickOpenVideo) return;
    onClickOpenVideo();
  }

  return (
    <div className={classes.root}>
      <div className={classes.image} title="Xem giới thiệu khóa học">
        <div className={classes.bgImage}></div>
        <PlayCircleFilled
          className={classes.iconPlay}
          onClick={handleOnClickOpenVideo}
        />
      </div>
      <div className={classes.content}>
        <p className={classes.price}>{convertVND(2000000)}</p>
        <ButtonSmall title="Đăng Kí Học" />
        <ul>
          <li>
            <LibraryBooks />
            <span>Tổng số bài học {"0"}</span>
          </li>
          <li>
            <AccessTime />
            <span>Thời Lượng học ????</span>
          </li>
          <li>
            <PhoneAndroid />
            <span>Có thể học bằng SmartPhone</span>
          </li>
          <li>
            <SentimentVerySatisfied />
            <span>Trọn đời truy cập</span>
          </li>
        </ul>
      </div>
    </div>
  );
}
