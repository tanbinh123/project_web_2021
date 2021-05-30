import {
  FormControl,
  FormHelperText,
  InputLabel,
  MenuItem,
  Select,
} from "@material-ui/core";
import React from "react";
import { Controller } from "react-hook-form";

function CustomSelectForm(props) {
  const {
    name = "",
    form = {},
    value = "",
    data = [{ value: "", title: "" }],
    label = "",
    id = `id-select-${name}`,
    fullWidth = true,
  } = props;
  // console.log(data);
  const { control, formState } = form;
  return (
    <>
      <Controller
        name={name}
        control={control}
        defaultValue={value}
        render={({ field }) => (
          <FormControl fullWidth={fullWidth} error={!!formState.errors?.[name]}>
            <InputLabel id={id}>{label}</InputLabel>
            <Select labelId={id} id="simple-select" {...field}>
              {Array.from(data).map((item, index) => (
                <MenuItem key={index} value={item.value}>
                  {item.title}
                </MenuItem>
              ))}
            </Select>
            {!!formState.errors?.[name] && (
              <FormHelperText>
                {formState.errors?.[name]?.message}
              </FormHelperText>
            )}
          </FormControl>
        )}
      />
    </>
  );
}

export default CustomSelectForm;
