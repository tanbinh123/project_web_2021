import { Slider } from '@material-ui/core';
import React from 'react';
import CustomButton from '../../../../../components/Button/CustomButton';
import { convertVND, isEmpty } from '../../../../../components/tools/Tools';

export default function FilterPrice(props) {
  const minNunber = 0;
  const maxNumber = 3000000;
  const { onChange = null, queryPrice = [minNunber, maxNumber] } = props;
  const [value, setValue] = React.useState([
    Math.ceil(scale(queryPrice[0], minNunber, maxNumber, 0, 100)),
    Math.ceil(scale(queryPrice[1], minNunber, maxNumber, 0, 100)),
  ]);

  const [price, setPrice] = React.useState([queryPrice[0], queryPrice[1]]);
  React.useEffect(() => {
    setValue([
      Math.ceil(scale(queryPrice[0], minNunber, maxNumber, 0, 100)),
      Math.ceil(scale(queryPrice[1], minNunber, maxNumber, 0, 100)),
    ]);
    setPrice([queryPrice[0], queryPrice[1]]);
  }, [queryPrice[0], queryPrice[1]]);
  const handleChange = (event, newValue) => {
    setValue(newValue);
    setPrice([
      Math.ceil(scale(value[0], 0, 100, minNunber, maxNumber)),
      Math.ceil(scale(value[1], 0, 100, minNunber, maxNumber)),
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
        <CustomButton
          title="Áp dụng"
          onClick={() => {
            if (onChange) onChange(price);
          }}
        />
      </div>
    </div>
  );
}
