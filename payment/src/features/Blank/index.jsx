import { Paper } from "@material-ui/core";
import React from "react";

export default function Blank(props) {
  const { className } = props;
  console.log(className);
  return <Paper className={className} />;
}
