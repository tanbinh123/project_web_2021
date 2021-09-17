import { Slider } from '@material-ui/core';
import { Rating } from '@material-ui/lab';
import React from 'react';
import CustomButton from '../../../../../components/Button/CustomButton';
import { convertVND, isEmpty } from '../../../../../components/tools/Tools';

export default function FilterRate(props) {
  const { onChange = null, queryRate = -1 } = props;
  // console.log(queryRate);
  const [value, setValue] = React.useState(-1);
  React.useEffect(() => {
    setValue(Number(queryRate));
    return () => {
      setValue(-1);
    };
  }, [queryRate]);
  // console.log('value', value);
  return (
    <div className="filter-rate">
      <p className="title">Lọc theo đánh giá</p>
      <Rating
        name="rating"
        className="rating"
        key={Number(queryRate)}
        defaultValue={Number(queryRate)}
        value={value}
        onChange={(e, value) => {
          setValue(value);
        }}
      />
      <div className="bottom">
        <div>
          {value !== 0 && (
            <CustomButton
              title="Hủy"
              onClick={() => {
                setValue(-1);
                if (onChange) onChange(-1);
              }}
            />
          )}
        </div>
        <CustomButton
          title="Áp dụng"
          onClick={() => {
            // console.log(value);
            if (onChange) onChange(value);
          }}
        />
      </div>
    </div>
  );
}
