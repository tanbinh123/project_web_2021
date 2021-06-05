import {
  FormControl,
  FormHelperText,
  InputLabel,
  MenuItem,
  Select,
} from "@material-ui/core";
import React from "react";
import { Controller } from "react-hook-form";

function CustomSelect(props) {
  const {
    name = "",
    value = "",
    data = [{ value: "", title: "" }],
    label = "",
    id = `id-select-${name}`,
    fullWidth = true,
    onChange = null,
  } = props;
  // console.log(data);
  return (
    <>
      <FormControl fullWidth={fullWidth}>
        <InputLabel id={id}>{label}</InputLabel>
        <Select
          name={name}
          value={value}
          labelId={id}
          id="simple-select"
          onChange={(event) => {
            if (onChange) onChange(event);
          }}
        >
          {Array.from(data).map((item, index) => (
            <MenuItem key={index} value={item.value}>
              {item.title}
            </MenuItem>
          ))}
        </Select>
      </FormControl>
    </>
  );
}

export default CustomSelect;
