import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import {
  FormControl,
  InputLabel,
  makeStyles,
  MenuItem,
  Select,
  Tab,
  Tabs,
} from "@material-ui/core";
import { colorOrange2 } from "../../../../../components/color/color";
import { parse, stringify } from "query-string";

TabPrice.propTypes = {};

const useStyles = makeStyles((theme) => ({
  root: {
    paddingTop: 10,
  },
  customTab: {
    "& > div  > span ": {
      backgroundColor: colorOrange2,
    },
    "& .MuiTab-textColorPrimary.Mui-selected": {
      color: colorOrange2,
    },
    display: "block",
    [theme.breakpoints.down("sm")]: {
      display: "none",
    },
  },
  formControl: {
    display: "flex",
    justifyContent: "center",
    margin: "15px 20px 0px 20px",

    display: "none",
    [theme.breakpoints.down("sm")]: {
      display: "flex",
    },
  },
}));

function TabPrice(props) {
  const classes = useStyles();
  const { onChange, value } = props;
  const [values, setValues] = useState("1");

  useEffect(() => {
    const tmpValue = parse(value);
    const tmpSting = "_sort=" + tmpValue._sort + "&_order=" + tmpValue._order;
    let result = "";
    switch (tmpSting) {
      case "_sort=updateAt&_order=desc":
        result = "1";
        break;
      case "_sort=bought&_order=desc":
        result = "2";
        break;
      case "_sort=rateStar&_order=desc":
        result = "3";
        break;
      case "_sort=price&_order=desc":
        result = "4";
        break;
      case "_sort=price&_order=asc":
        result = "5";
        break;
      default:
        result = "1";
        break;
    }
    setValues(result);
  }, [value]);

  function handleOnChangeValue(e, value) {
    const tmpValue = e.target?.value || value;
    let tmp;
    switch (tmpValue) {
      case "1":
        tmp = "_sort=updateAt&_order=desc";
        break;
      case "2":
        tmp = "_sort=bought&_order=desc";
        break;
      case "3":
        tmp = "_sort=rateStar&_order=desc";
        break;
      case "4":
        tmp = "_sort=price&_order=desc";
        break;
      case "5":
        tmp = "_sort=price&_order=asc";
        break;
      default:
        tmp = "_sort=updateAt&_order=desc";
        break;
    }
    setValues(tmpValue);
    if (onChange) {
      onChange(tmp);
    }
  }
  return (
    <div className={classes.root}>
      <FormControl variant="outlined" className={classes.formControl}>
        <InputLabel id="demo-simple-select-filled-label">Sắp xếp</InputLabel>
        <Select
          labelId="demo-simple-select-filled-label"
          label="Sắp xếp"
          id="demo-simple-select-filled"
          value={values}
          onChange={handleOnChangeValue}
        >
          <MenuItem value="1">Mới nhất</MenuItem>
          <MenuItem value="2">Phổ biến</MenuItem>
          <MenuItem value="3">Đánh giá cao</MenuItem>
          <MenuItem value="4">Giá cao</MenuItem>
          <MenuItem value="5">Giá thấp</MenuItem>
        </Select>
      </FormControl>
      <Tabs
        className={classes.customTab}
        value={values}
        indicatorColor="primary"
        textColor="primary"
        onChange={handleOnChangeValue}
      >
        <Tab label="Mới nhất" value="1" />
        <Tab label="Phổ biến" value="2" />
        <Tab label="Đánh giá cao" value="3" />
        <Tab label="Giá cao" value="4" />
        <Tab label="Giá thấp" value="5" />
      </Tabs>
    </div>
  );
}

export default TabPrice;
