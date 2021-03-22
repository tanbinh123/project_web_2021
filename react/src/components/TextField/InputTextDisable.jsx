import { makeStyles, TextField } from "@material-ui/core";
import React from "react";
import PropTypes from "prop-types";
import { Controller } from "react-hook-form";
const useStyles = makeStyles((theme) => ({
  cssInputText: {},
}));
InputTextDisable.propTypes = {
  name: PropTypes.string,
  label: PropTypes.string,
};
InputTextDisable.defaultProps = {
  name: PropTypes.string,
  label: PropTypes.string,
};

function InputTextDisable(props) {
  const classes = useStyles();
  const { name, label, form, data } = props;
  const { errors } = form;
  const hasError = errors[name];
  return (
    <Controller
      control={form.control}
      as={TextField}
      className={classes.cssInputText}
      name={name}
      label={label}
      variant="outlined"
      margin="normal"
      fullWidth
      error={!!hasError}
      helperText={errors[name]?.message}
      value={data}
      disabled
    />
  );
}

export default InputTextDisable;
