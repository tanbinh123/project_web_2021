import { Paper } from "@material-ui/core";
import React from "react";
import { useRouteMatch } from "react-router-dom";

export default function Blank(props) {
  const { className } = props;
  console.log(className);
  return <Paper className={className} />;
}
