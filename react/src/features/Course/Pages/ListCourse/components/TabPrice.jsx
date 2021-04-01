import React, { useState } from "react";
import PropTypes from "prop-types";
import { Tab, Tabs } from "@material-ui/core";

TabPrice.propTypes = {};

function TabPrice(props) {
  const { onChange } = props;
  const [values, setValues] = useState("1");
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
