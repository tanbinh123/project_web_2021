import { Slider } from '@material-ui/core';
import { Rating } from '@material-ui/lab';
import React from 'react';
import CustomButton from '../../../../../components/Button/CustomButton';
import { convertVND, isEmpty } from '../../../../../components/tools/Tools';

export default function FilterRate(props) {
  const { onChange = null } = props;
  const [value, setValue] = React.useState(0);

  return (
    <div className="filter-rate">
      <p className="title">Lọc theo đánh giá</p>
      <Rating
        name="rating"
        className="rating"
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
                setValue(0);
                if (onChange) onChange();
              }}
            />
          )}
        </div>
        <CustomButton
          title="Áp dụng"
          onClick={() => {
            console.log(value);
            // if (onChange) onChange();
          }}
        />
      </div>
    </div>
  );
}
