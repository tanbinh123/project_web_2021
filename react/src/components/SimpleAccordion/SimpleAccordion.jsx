import { makeStyles } from "@material-ui/core/styles";
import React from "react";
import { colorWhite1, colorWhite2 } from "../color/color";
import ItemAccordion from "./ItemAccordion";

const useStyles = makeStyles((theme) => ({
  root: {
    width: "100%",
    marginTop: 30,
  },
}));

export default function SimpleAccordion() {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <ItemAccordion />
      <ItemAccordion />
      <ItemAccordion />
      <ItemAccordion />
      <ItemAccordion />
      <ItemAccordion />
      <ItemAccordion />
    </div>
  );
}
