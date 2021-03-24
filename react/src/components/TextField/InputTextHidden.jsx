import { makeStyles, TextField } from "@material-ui/core";
import React from "react";
import PropTypes from "prop-types";
import { Controller } from "react-hook-form";
const useStyles = makeStyles((theme) => ({
  cssInputText: {},
}));
InputTextHidden.propTypes = {
  name: PropTypes.string,
  label: PropTypes.string,
  form: PropTypes.object,
  value: PropTypes.string,
};
InputTextHidden.defaultProps = {
  name: "",
  label: "",
  form: {},
  value: "",
};

function InputTextHidden(props) {
  const classes = useStyles();
  const { name, label, form, value } = props;
  return (
    <Controller
      control={form.control}
      as={<input type="hidden" />}
      className={classes.cssInputText}
      name={name}
      label={label}
      variant="outlined"
      margin="normal"
      value={value}
    />
  );
}

export default InputTextHidden;
