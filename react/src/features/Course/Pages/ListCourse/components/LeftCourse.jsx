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
  //console.log("init LeftCourse",props.categories);
  const handleOnClickCategory = (e) => {
    console.log(e.target.attributes.value.nodeValue);
  };

  // props.categories.map

  return (
    <div className={classes.root}>
      <h3 className="__title">Danh Mục</h3>
      <ul>
        {Array.from(props.categories).map((x, index)=>(
          <li key={index+''} value={x.id} onClick={handleOnClickCategory}>
            {x.name}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default LeftCourse;
