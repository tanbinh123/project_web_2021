import React from "react";
import { Controller } from "react-hook-form";
import { makeStyles, TextField } from "@material-ui/core";
const useStyles = makeStyles((theme) => ({
  root: {
    "& label.Mui-focused": {
      color: "var(--colorOrange2)",
    },
    "& .MuiInput-underline:after": {
      borderBottomColor: "var(--colorBlack2)",
    },
    "& .MuiOutlinedInput-root": {
      "& fieldset": {
        borderColor: "var(--colorBlack2)",
      },
      "&:hover fieldset": {
        borderColor: "var(--colorBlack2)",
      },
      "&.Mui-focused fieldset": {
        borderColor: "var(--colorBlack2)",
      },
    },
  },
}));
function CustomInput(props) {
  const {
    form = {},
    name = "",
    label = "",
    value = "",
    type = "string",
    fullWidth = true,
    multiline = false,
    rows = 1,
  } = props;
  const { control, formState } = form;
  const classes = useStyles();
  return (
    <Controller
      name={name}
      control={control}
      defaultValue={value}
      render={({ field }) => (
        <TextField
          className={classes.root}
          variant="outlined"
          label={label}
          type={type}
          margin="normal"
          fullWidth={fullWidth}
          multiline={multiline}
          rows={rows}
          error={!!formState.errors?.[name]}
          helperText={formState.errors?.[name]?.message}
          {...field}
        />
      )}
    />
  );
}
export default CustomInput;
