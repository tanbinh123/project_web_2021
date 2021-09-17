import { makeStyles } from '@material-ui/core';
import classNames from 'classnames';
import React from 'react';
import CustomButton from '../../../../../components/Button/CustomButton';

//LeftCourse.propTypes = {};
const useStyles = makeStyles((theme) => ({
  root: {
    fontFamily: 'Open Sans, sans-serif',
    padding: '40px 15px 30px 15px',
    backgroundColor: '#fff',
    borderRadius: '10px',
    '&> .__title': {
      display: 'flex',
      justifyContent: 'center',
      fontSize: '23px',
      marginBottom: '20px',
      color: 'var(--colorBlack2)',
    },

    '& ul': {
      listStyle: 'none',
      display: 'flex',
      flexFlow: 'column',
      alignItems: 'flex-star',
      justifyContent: 'center',
      '& li': {
        marginLeft: '20px',
        margin: '10px 0px',
        fontSize: '17px',
        cursor: 'pointer',
        color: 'var(--colorBlack2)',
        '&:hover': {
          color: 'var(--colorOrange2)',
        },
      },
    },
  },
  actived: {
    color: 'var(--colorOrange2) !important',
  },
  footer: {
    display: 'flex',
    justifyContent: 'flex-end',
    marginTop: '20px',
  },
}));

function FilterCategory(props) {
  const classes = useStyles();
  const { categories = [], onChange, categorie = -1 } = props;
  const [isShow, setIsShow] = React.useState(false);
  // console.log("init LeftCourse", categories);
  const handleOnClickCategory = (value) => {
    onChange(value);
  };
  // props.categories.map

  return (
    <div className={classes.root}>
      <h3 className="__title">Danh Mục</h3>
      <ul>
        {Array.from(categories)
          .splice(0, isShow ? categories.length : 3)
          .map((item, index) => (
            <li
              key={item.id}
              onClick={() => {
                handleOnClickCategory(item);
              }}
              className={classNames(categorie == item.id && classes.actived)}
            >
              {item.name}
            </li>
          ))}
        <li
          onClick={() => {
            handleOnClickCategory({ id: -1 });
          }}
          className={classNames(categorie == -1 && classes.actived)}
        >
          Tất cả
        </li>
      </ul>
      <div className={classes.footer}>
        <CustomButton
          title={isShow ? 'Ẩn bớt' : 'Hiện tất cả'}
          onClick={() => {
            setIsShow(!isShow);
          }}
        />
      </div>
    </div>
  );
}

export default FilterCategory;
