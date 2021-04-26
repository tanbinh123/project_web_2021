import React from "react";
import { Controller } from "react-hook-form";
import { TextField } from "@material-ui/core";

function CustomInputHidden(props) {
  const {
    form = {},
    name = "",
    label = "",
    value = "",
    type = "hidden",
  } = props;
  const { control, formState } = form;
  return (
    <Controller
      name={name}
      control={control}
      defaultValue={value}
      render={({ field }) => <input type={type} {...field} />}
    />
  );
}

export default CustomInputHidden;
