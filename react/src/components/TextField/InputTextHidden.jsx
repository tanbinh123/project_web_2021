import { makeStyles } from "@material-ui/core";
import PropTypes from "prop-types";
import React from "react";
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
      render={({ field }) => {
        <input type="hidden" {...field} />;
      }}
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
