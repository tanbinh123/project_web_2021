import { Avatar, Grid, makeStyles } from '@material-ui/core';
import Rating from '@material-ui/lab/Rating';
import Pagination from '@material-ui/lab/Pagination';
import React, { useEffect, useState } from 'react';
import { toDate } from '../../../../../../components/tools/Tools';
import ratingApi from '../../../../../../api/ratingApi';
import { useParams } from 'react-router';
const useStyles = makeStyles(() => ({
  listRating: {
    marginTop: 50,
  },
  itemRating: {
    padding: '20px',
    borderTop: '1px solid var(--colorGray2)',
  },
  headerItem: {
    display: 'flex',
  },
  headerItemRight: {
    width: '100%',
    padding: '0 20px',
    '&>span': {
      fontSize: 16,
      fontWeight: 600,
      color: 'var(--colorBlack2)',
    },
    '&>div': {
      display: 'flex',
      justifyContent: 'space-between',
      '&>span:last-of-type': {
        fontWeight: 400,
        fontSize: 15,
      },
    },
  },
  iconRating: {
    fontSize: 20,
  },
  contentRating: {
    padding: 20,
  },
  pagination: {
    display: 'flex',
    justifyContent: 'flex-end',

    '& .MuiPaginationItem-page.Mui-selected': {
      backgroundColor: 'var(--colorOrange2)',
      color: 'var(--colorWhite0)',
    },
  },
}));
function ListRating(props) {
  const { star = 0, listRating = [] } = props;
  // console.log(listRating);
  const classes = useStyles();
  const limit = 3;
  const [indexRating, setIndexRating] = useState(0);
  const [page, setPage] = useState(1);
  const handleOnChange = (e, page) => {
    setIndexRating((page - 1) * limit);
    setPage(page);
  };
  useEffect(() => {
    setIndexRating(0);
    setPage(1);
    return () => {
      setIndexRating(0);
      setPage(1);
    };
  }, [useParams()?.idCourse]);

  return (
    <Grid item className={classes.listRating}>
      {Array.from(listRating)
        .filter((item) => {
          if (star != 0) {
            return item.rating === star;
          } else {
            return true;
          }
        })
        .splice(indexRating, limit)
        .map((item, index) => (
          <div className={classes.itemRating} key={index}>
            <div className={classes.headerItem}>
              <Avatar src={item.avatar} />
              <div className={classes.headerItemRight}>
                <span>{item.fullname}</span>
                <div>
                  <Rating
                    key={item.id}
                    defaultValue={item.rating}
                    value={item.rating}
                    precision={0.5}
                    readOnly
                    className={classes.iconRating}
                  />
                  <span></span>
                </div>
              </div>
            </div>
            <div className={classes.contentRating}>
              <span>{item.content}</span>
            </div>
          </div>
        ))}
      <Pagination
        count={Math.ceil(
          Array.from(listRating).filter((item) => {
            if (star != 0) {
              return item.rating === star;
            } else {
              return true;
            }
          }).length / limit
        )}
        className={classes.pagination}
        onChange={handleOnChange}
        page={page}
      />
    </Grid>
  );
}

export default ListRating;
