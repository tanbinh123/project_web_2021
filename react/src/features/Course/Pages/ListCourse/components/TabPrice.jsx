import {
  FormControl,
  InputLabel,
  makeStyles,
  MenuItem,
  Select,
  Tab,
  Tabs,
} from '@material-ui/core';
import { parse } from 'query-string';
import React, { useEffect, useState } from 'react';
import { colorOrange2 } from '../../../../../components/color/color';

//TabPrice.propTypes = {};

const useStyles = makeStyles((theme) => ({
  root: {
    paddingTop: 10,
  },
  customTab: {
    '& > div  > div>button ': {
      minWidth: 120,
    },
    '& > div  > span ': {
      backgroundColor: colorOrange2,
    },
    '& .MuiTab-textColorPrimary.Mui-selected': {
      color: colorOrange2,
    },
    display: 'block',
    [theme.breakpoints.down('sm')]: {
      display: 'none',
    },
  },
  formControl: {
    //display: "flex",
    justifyContent: 'center',
    margin: '15px 20px 0px 20px',

    display: 'none',
    [theme.breakpoints.down('sm')]: {
      display: 'flex',
    },
  },
}));

function TabPrice(props) {
  const classes = useStyles();
  const { onChange, value } = props;
  const [values, setValues] = useState('updateAt:desc');

  useEffect(() => {
    const tmpValue = parse(value);

    setValues(tmpValue._sort || 'updateAt:desc');
  }, [value]);
  function handleOnChangeValue(e, value) {
    setValues(value);
    if (onChange) {
      onChange(value);
    }
  }
  function handleOnChangeSelectValue(e) {
    const tmpValue = e.target.value;
    setValues(tmpValue);
    if (onChange) {
      onChange(tmpValue);
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
          onChange={handleOnChangeSelectValue}
        >
          <MenuItem value="updateAt:desc">Mới nhất</MenuItem>
          <MenuItem value="bought:desc">Phổ biến</MenuItem>
          <MenuItem value="rateStar:desc">Đánh giá cao</MenuItem>
          <MenuItem value="price:desc">Giá cao</MenuItem>
          <MenuItem value="price:asc">Giá thấp</MenuItem>
          <MenuItem value="discount:desc">Giảm giá cao</MenuItem>
          <MenuItem value="discount:asc">Giảm giá thấp</MenuItem>
        </Select>
      </FormControl>
      <Tabs
        className={classes.customTab}
        value={values}
        indicatorColor="primary"
        textColor="primary"
        onChange={handleOnChangeValue}
      >
        <Tab label="Mới nhất" value="updateAt:desc" />
        <Tab label="Phổ biến" value="bought:desc" />
        <Tab label="Đánh giá cao" value="rateStar:desc" />
        <Tab label="Giá cao" value="price:desc" />
        <Tab label="Giá thấp" value="price:asc" />
        <Tab label="Giảm giá cao" value="discount:desc" />
        <Tab label="Giảm giá thấp" value="discount:asc" />
      </Tabs>
    </div>
  );
}

export default TabPrice;
