import { Slider } from '@material-ui/core';
import React from 'react';
import CustomButton from '../../../../../components/Button/CustomButton';
import { convertVND } from '../../../../../components/tools/Tools';

export default function FilterPrice() {
  const minNunber = 0;
  const maxNumber = 3000000;
  const [value, setValue] = React.useState([0, 100]);
  const [price, setPrice] = React.useState([minNunber, maxNumber]);
  const handleChange = (event, newValue) => {
    setValue(newValue);
    setPrice([
      scale(value[0], 0, 100, 0, 3000000),
      scale(value[1], 0, 100, 0, 3000000),
    ]);
  };
  function scale(number, inMin, inMax, outMin, outMax) {
    return ((number - inMin) * (outMax - outMin)) / (inMax - inMin) + outMin;
  }
  return (
    <div className="filter-price">
      <p className="title">Lọc theo giá</p>
      <p className="price">
        {convertVND(price[0])} - {convertVND(price[1])}
      </p>
      <p className="range-price">
        Khoảng giá: {convertVND(price[1] - price[0])}
      </p>
      <Slider
        className="slider"
        value={value}
        onChange={handleChange}
        aria-labelledby="range-slider"
        step={0.1}
      />
      <div className="bottom">
        <CustomButton title="Áp dụng" />
      </div>
    </div>
  );
}
