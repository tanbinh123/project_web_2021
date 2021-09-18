import { Grid, makeStyles } from '@material-ui/core';
import React, { useEffect } from 'react';
import { useForm } from 'react-hook-form';
import * as yup from 'yup';
import { yupResolver } from '@hookform/resolvers/yup';
import MenuRatting from './Ratting/MenuRatting';
import ListRating from './Ratting/ListRating';
import FormRating from './Ratting/FormRating';
import { DataUser } from '../../../../../app/DataUser';
import { useRecoilState } from 'recoil';
import { isEmpty } from '../../../../../components/tools/Tools';
import { useState } from 'react';
import ratingApi from '../../../../../api/ratingApi';
import { useParams, useRouteMatch } from 'react-router';
function RatingCourse(props) {
  const { rateStar = 0 } = props;
  const idCourse = Number(useParams()?.idCourse);
  const classes = makeStyles(() => ({
    root: {
      marginTop: '30px',
      marginBottom: '50px',
    },
    contentCourse: {
      borderBottom: '1px solid var(--colorGray2)',
      paddingBottom: '50px',
      '&> h2': {
        color: 'var(--colorBlack2)',
        margin: '30px 0px 20px 0px',
      },
    },
  }))();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const [star, setStar] = useState(0);
  const [listRating, setListRating] = useState([]);
  const [userRating, setUserRating] = useState({});
  const handleOnChangeSelected = (value) => {
    setStar(value);
  };
  const [bought, setBought] = useState(false);
  useEffect(() => {
    if (idCourse) {
      getDataRating();
      Array.from(dataUser.courses).map((item) => {
        if (item.id === idCourse) {
          console.log(item);
          setBought(true);
        }
      });
    }
    return () => {
      setListRating([]);
      setUserRating({});
      setStar(0);
    };
  }, [idCourse]);
  const getDataRating = async () => {
    try {
      const { data, pagination } = await ratingApi.get(idCourse);
      setListRating(data);
      if (!isEmpty(dataUser.token)) {
        Array.from(data).map((item) => {
          if (item.username == dataUser.user.username) {
            setUserRating(item);
          }
        });
      }
    } catch (error) {
      console.log(error.message);
    }
  };
  return (
    <Grid item xl={12} lg={12} md={12} sm={12} xs={12} className={classes.root}>
      <div className={classes.contentCourse}>
        <h2>Đánh giá</h2>
        <MenuRatting
          onChangeSelected={handleOnChangeSelected}
          rateStar={rateStar}
        />
        {bought && (
          <FormRating
            idCourse={idCourse}
            userRating={userRating}
            onUpdate={() => {
              getDataRating();
            }}
          />
        )}
        <ListRating idCourse={idCourse} star={star} listRating={listRating} />
      </div>
    </Grid>
  );
}

export default RatingCourse;
