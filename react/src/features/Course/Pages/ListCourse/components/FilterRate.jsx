import { Slider } from '@material-ui/core';
import { Rating } from '@material-ui/lab';
import React from 'react';
import CustomButton from '../../../../../components/Button/CustomButton';
import { convertVND, isEmpty } from '../../../../../components/tools/Tools';

export default function FilterRate(props) {
  const { onChange = null, queryRate = -1, name = '' } = props;
  // console.log(queryRate);
  const [valueStar, setValueStar] = React.useState(-1);
  React.useEffect(() => {
    setValueStar(Number(queryRate));
    return () => {
      // setValueStar(-1);
    };
  }, [queryRate]);
  console.log('value', valueStar);
  return (
    <div className="filter-rate">
      <p className="title">Lọc theo đánh giá</p>
      <Rating
        name={`${name}-rating`}
        className="rating"
        key={`${name}-${queryRate}`}
        // defaultValue={Number(queryRate)}
        value={valueStar}
        onChange={(e, value) => {
          console.log(value);
          setValueStar(value);
        }}
      />
      <div className="bottom">
        <div>
          {valueStar !== 0 && (
            <CustomButton
              title="Hủy"
              onClick={() => {
                setValueStar(-1);
                if (onChange) onChange(-1);
              }}
            />
          )}
        </div>
        <CustomButton
          title="Áp dụng"
          onClick={() => {
            // console.log(value);
            if (onChange) onChange(valueStar);
          }}
        />
      </div>
    </div>
  );
}
