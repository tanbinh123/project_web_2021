import {
  FormControlLabel,
  makeStyles,
  Radio,
  RadioGroup,
} from "@material-ui/core";
import React from "react";
import { Controller } from "react-hook-form";
const useStyles = makeStyles((theme) => ({
  customRadio: {
    display: "flex",
    flexFlow: "row",
  },
}));
function CustomRadioForm(props) {
  const {
    name = "",
    form = {},
    value = "",
    data = [{ value: "", title: "" }],
    flowRow = true,
  } = props;
  // console.log(data);
  const { control } = form;
  const classes = useStyles();
  return (
    <>
      <Controller
        name={name}
        control={control}
        defaultValue={value}
        render={({ field }) => (
          <RadioGroup className={flowRow && classes.customRadio} {...field}>
            {Array.from(data).map((item, index) => (
              <FormControlLabel
                key={index}
                value={item.value}
                control={<Radio />}
                label={item.title}
              />
            ))}
          </RadioGroup>
        )}
      />
    </>
  );
}

export default CustomRadioForm;
