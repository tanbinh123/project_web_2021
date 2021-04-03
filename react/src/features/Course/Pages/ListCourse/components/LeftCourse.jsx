import { makeStyles } from "@material-ui/core";
import React from "react";

//LeftCourse.propTypes = {};
const useStyles = makeStyles((theme) => ({
  root: {
    fontFamily: "Open Sans, sans-serif",
    padding: "40px 15px 30px 15px",
    "&> .__title": {},

    "& ul": {
      listStyle: "none",
      "& li": {
        margin: "5px 0px 5px 15px",
      },
    },
  },
}));

function LeftCourse(props) {
  const classes = useStyles();
  const handleOnClickCategory = (e) => {
    console.log(e.target.attributes.value.nodeValue);
  };

  return (
    <div className={classes.root}>
      <h3 className="__title">Danh Mục</h3>
      <ul>
        <li value="cntt1" onClick={handleOnClickCategory}>
          Công nghệ thông tin
        </li>
        <li value="cntt2" onClick={handleOnClickCategory}>
          Kinh doanh
        </li>
        <li value="cntt3" onClick={handleOnClickCategory}>
          Kĩ năng sống
        </li>
        <li value="cntt4" onClick={handleOnClickCategory}>
          Ngoại ngữ
        </li>
        <li value="cntt5" onClick={handleOnClickCategory}>
          Thiết kế
        </li>
      </ul>
    </div>
  );
}

export default LeftCourse;
