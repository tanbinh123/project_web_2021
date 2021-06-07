import { Avatar, Grid, makeStyles } from "@material-ui/core";
import Rating from "@material-ui/lab/Rating";
import Pagination from "@material-ui/lab/Pagination";
import React from "react";
const useStyles = makeStyles(() => ({
  listRating: {
    marginTop: 50,
  },
  itemRating: {
    padding: "20px",
    borderTop: "1px solid var(--colorGray2)",
  },
  headerItem: {
    display: "flex",
  },
  headerItemRight: {
    width: "100%",
    padding: "0 20px",
    "&>span": {
      fontSize: 16,
      fontWeight: 600,
      color: "var(--colorBlack2)",
    },
    "&>div": {
      display: "flex",
      justifyContent: "space-between",
      "&>span:last-of-type": {
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
    display: "flex",
    justifyContent: "flex-end",

    "& .MuiPaginationItem-page.Mui-selected": {
      backgroundColor: "var(--colorOrange2)",
      color: "var(--colorWhite0)",
    },
  },
}));
function ListRating(props) {
  const classes = useStyles();
  return (
    <Grid item className={classes.listRating}>
      {[1, 2, 3, 4, 5].map((item, index) => (
        <div className={classes.itemRating} key={index}>
          <div className={classes.headerItem}>
            <Avatar src="https://i.pinimg.com/originals/3b/0f/83/3b0f83d3269de58c51b5ab9a0106c8ee.jpg" />
            <div className={classes.headerItemRight}>
              <span>Heo con</span>
              <div>
                <Rating
                  defaultValue={4.5}
                  precision={0.5}
                  readOnly
                  className={classes.iconRating}
                />
                <span>6/7/2021</span>
              </div>
            </div>
          </div>
          <div className={classes.contentRating}>
            <span>
              Lorem, ipsum dolor sit amet consectetur adipisicing elit. Fugit
              reprehenderit itaque, deleniti iure exercitationem quos expedita
              officiis nesciunt. Alias, fuga! Rerum ullam, possimus assumenda
              nostrum fuga quae labore nisi deserunt.
            </span>
          </div>
        </div>
      ))}
      <Pagination count={10} className={classes.pagination} />
    </Grid>
  );
}

export default ListRating;
