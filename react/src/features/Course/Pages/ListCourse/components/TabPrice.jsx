import { makeStyles, Tab, Tabs } from "@material-ui/core";
import { parse } from "query-string";
import React, { useEffect, useState } from "react";
import { colorOrange2 } from "../../../../../components/color/color";

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
  const [values, setValues] = useState("updateAt:desc");

  useEffect(() => {
    const tmpValue = parse(value);
    
    setValues(tmpValue._sort||"updateAt:desc");
  }, [value]);

  function handleOnChangeValue(e, value) {   
    
    setValues(value);
    if (onChange) {
      onChange(value);
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
      <Tab label="Mới nhất" value="updateAt:desc"/>
      <Tab label="Phổ biến" value="bought:desc" />
      <Tab label="Đánh giá cao" value="rateStar:desc" />
      <Tab label="Giá cao" value="price:desc"/>
      <Tab label="Giá thấp" value="price:asc"/>
    </Tabs>
  );
}

export default TabPrice;
