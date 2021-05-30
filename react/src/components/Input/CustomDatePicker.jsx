import { createMuiTheme, ThemeProvider } from "@material-ui/core";
import "date-fns";
import { KeyboardDatePicker } from "@material-ui/pickers";
import React, { useEffect, useState } from "react";
const materialTheme = createMuiTheme({
  overrides: {
    MuiPickersToolbar: {
      toolbar: {
        backgroundColor: "#2980b9",
      },
    },
    MuiPickersCalendarHeader: {
      switchHeader: {
        // backgroundColor: lightBlue.A200,
        // color: "white",
      },
    },
    MuiPickersDay: {
      day: {
        color: "#2980b9",
      },
      daySelected: {
        backgroundColor: "#2980b9",
      },
      dayDisabled: {
        color: "#2980b9",
      },
      current: {
        color: "#2980b9",
      },
    },
    MuiPickersModal: {
      dialogAction: {
        color: "#2980b9",
      },
    },
  },
});
function CustomDatePicker(props) {
  const {
    name = "",
    label = "",
    value,
    fullWidth = true,
    margin = "normal",
    id = `date-picker-${name}`,
    format = "dd/MM/yyyy",
    onChange = {},
  } = props;
  const [error, setError] = useState({
    status: false,
    message: "",
  });
  useEffect(() => {
    if (value == "Invalid Date") {
      setError({ ...error, status: true, message: "Định dạng dd/mm/yyyy" });
    } else if (value == "" || isNaN(value) || value == null) {
      setError({ ...error, status: true, message: "Vui lòng nhập ngày sinh" });
    } else if (!value instanceof Date) {
      setError({ ...error, status: true, message: "Định dạng dd/MM/yyyy" });
    } else {
      setError({ ...error, status: false, message: "" });
    }
  }, [value]);
  return (
    <>
      <ThemeProvider theme={materialTheme}>
        <KeyboardDatePicker
          name={name}
          value={value}
          onChange={(value) => {
            if (onChange) onChange(value);
          }}
          fullWidth={fullWidth}
          margin={margin}
          id={id}
          label={label}
          format={format}
          KeyboardButtonProps={{
            "aria-label": "change date",
          }}
          // onError={handleOnError}
          error={error.status}
          helperText={error.message}
        />
      </ThemeProvider>
    </>
  );
}

export default CustomDatePicker;
