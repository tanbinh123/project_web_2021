import {
  Button,
  ThemeProvider,
  createMuiTheme,
  makeStyles,
} from "@material-ui/core";
import React, { useState } from "react";
import PropTypes from "prop-types";
import classNames from "classnames";
import { Controller } from "react-hook-form";
const useStyles = makeStyles((theme) => ({
  CustomButton: {
    background: "linear-gradient(45deg, #3498db 30%, #3498db 90%)",
    backgroundSize: "200%",
    transition: "0.3s",
    "&:hover": {
      backgroundPosition: "right",
    },
    border: 0,
    color: "white",
    height: 40,
    padding: "0 30px",
    boxShadow: "0 3px 5px 2px rgba(52, 152, 219,0.5)",
    borderRadius: "25px",
    marginTop: "20px",
    marginBottom: "20px",
    width: "100%",
    position: "relative",
    lineHeight: "40px",
  },
  CustomButton__label: {
    position: "absolute",
    width: "100%",
    height: "100%",
  },
}));
ButtonUploadFW.propTypes = {
  title: PropTypes.string,
  name: PropTypes.string,
  form: PropTypes.object,
};

ButtonUploadFW.defaultProps = {
  title: "",
  name: "",
  form: {},
};
function ButtonUploadFW(props) {
  const { title, name, form, onChange } = props;
  const [newTitle, setNewTitle] = useState(title);
  const classes = useStyles();
  const handleOnChange = (e) => {
    if (!onChange) return;
    const file = e.target.files[0];
    console.log(file);
    if (file) {
      onChange(file);
      setNewTitle(file.name);
    }
  };
  return (
    <>
      <input
        type="file"
        onChange={handleOnChange}
        control={form.control}
        style={{ display: "none" }}
        accept="video/*"
        id="contained-button-file"
        multiple
        name={name}
      />

      <Button className={classes.CustomButton}>
        <label
          className={classes.CustomButton__label}
          htmlFor="contained-button-file"
        >
          <span>{newTitle}</span>
        </label>
      </Button>
    </>
  );
}

export default ButtonUploadFW;
