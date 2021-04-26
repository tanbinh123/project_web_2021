import React from "react";
import { Controller } from "react-hook-form";
import { TextField } from "@material-ui/core";

function CustomInputDisable(props) {
  const {
    form = {},
    name = "",
    label = "",
    value = "",
    type = "string",
  } = props;
  const { control, formState } = form;
  return (
    <Controller
      name={name}
      control={control}
      defaultValue={value}
      render={({ field }) => (
        <TextField
          variant="outlined"
          label={label}
          type={type}
          margin="normal"
          fullWidth
          error={!!formState.errors?.[name]}
          helperText={formState.errors?.[name]?.message}
          disabled
          {...field}
        />
      )}
    />
  );
}

export default CustomInputDisable;
