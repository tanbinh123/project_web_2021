import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import { makeStyles, Tab, Tabs } from "@material-ui/core";
import { colorOrange2 } from "../../../../../components/color/color";
import { parse, stringify } from "query-string";

TabPrice.propTypes = {};

const useStyles = makeStyles((theme) => ({
  customTab: {
    "& > div  > span ": {
      backgroundColor: colorOrange2,
    },
    "& .MuiTab-textColorPrimary.Mui-selected": {
      color: colorOrange2,
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
    let tmp;
    switch (value) {
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
    setValues(value);
    if (onChange) {
      onChange(tmp);
    }
  }
  return (
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
  );
}

export default TabPrice;
