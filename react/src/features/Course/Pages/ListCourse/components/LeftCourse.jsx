import { makeStyles } from "@material-ui/core";
import classNames from "classnames";
import React from "react";

//LeftCourse.propTypes = {};
const useStyles = makeStyles((theme) => ({
  root: {
    fontFamily: "Open Sans, sans-serif",
    padding: "40px 15px 30px 15px",
    "&> .__title": {
      display: "flex",
      justifyContent: "center",
      fontSize: "23px",
      marginBottom: "20px",
      color: "var(--colorBlack2)",
    },

    "& ul": {
      listStyle: "none",
      display: "flex",
      flexFlow: "column",
      alignItems: "flex-star",
      justifyContent: "center",
      "& li": {
        marginLeft: "20px",
        margin: "10px 0px",
        fontSize: "17px",
        cursor: "pointer",
        color: "var(--colorBlack2)",
        "&:hover": {
          color: "var(--colorOrange2)",
        },
      },
    },
  },
  actived: {
    color: "var(--colorOrange2) !important",
  },
}));

function LeftCourse(props) {
  const classes = useStyles();
  const { categories, onChange, categorie = -1 } = props;
  // console.log("init LeftCourse", categories);
  const handleOnClickCategory = (value) => {
    onChange(value);
  };
  // props.categories.map

  return (
    <div className={classes.root}>
      <h3 className="__title">Danh Mục</h3>
      <ul>
        {Array.from(categories).map((item, index) => (
          <li
            key={item.id}
            onClick={() => {
              handleOnClickCategory(item);
            }}
            className={classNames(categorie == item.id && classes.actived)}
          >
            {item.name}
          </li>
        ))}
        <li
          onClick={() => {
            handleOnClickCategory({ id: -1 });
          }}
          className={classNames(categorie == -1 && classes.actived)}
        >
          Tất cả
        </li>
      </ul>
    </div>
  );
}

export default LeftCourse;
