import { makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import ItemAccordionLecture from "./ItemAccordionLecture";

const useStyles = makeStyles((theme) => ({
  root: {
    width: "100%",
    marginBottom: 50,
  },
}));

export default function ListAccordion(props) {
  const { parts } = props;
  let indexLecture = 0;
  const classes = useStyles();
  return (
    <div className={classes.root}>
      {Array.from(parts || []).map((item, index) => (
        <ItemAccordionLecture
          key={index}
          title={index + 1 + ": " + item.title}
          indexLecture={
            index == 0
              ? indexLecture
              : (indexLecture += parts[index - 1].lessons.length)
          }
          lessons={item.lessons}
        />
      ))}
    </div>
  );
}
