import { Checkbox, FormControlLabel, makeStyles } from "@material-ui/core";
import React from "react";
import { Controller } from "react-hook-form";
const useStyles = makeStyles((theme) => ({
  checkbox: {
    minWidth: "0px !important",
  },
}));
function CustomCheckBox(props) {
  const {
    name = "",
    form = {},
    defaultValue = "",
    color = "secondary",
    disabled = false,
    size = "medium",
    label = "",
  } = props;
  const { control } = form;
  const classes = useStyles();
  return (
    <>
      <Controller
        name={name}
        control={control}
        defaultValue={defaultValue}
        render={({ field }) => (
          <FormControlLabel
            control={
              <Checkbox
                className={classes.checkbox}
                color={color}
                disabled={disabled}
                size={size}
                {...field}
              />
            }
            label={label}
          />
        )}
      />
    </>
  );
}

export default CustomCheckBox;
