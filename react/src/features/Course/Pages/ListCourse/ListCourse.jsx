import { Box, Container, Grid, makeStyles, Paper } from "@material-ui/core";
import { Pagination } from "@material-ui/lab";
import { parse } from "query-string";
import React, { useEffect, useState } from "react";
import courseApi from "../../../../api/courseApi";
import courseApiFake from "../../../../api/courseApiFake";
import {
  colorBlack1,
  colorOrange2,
  colorWhite1,
} from "../../../../components/color/color";
import Header from "../../../../components/header/index";
import RightCoures from "./components/RightCoures";
import SkeletonCourse from "./components/SkeletonCourse";
import TabPrice from "./components/TabPrice";

ListCourse.propTypes = {};
const useStyles = makeStyles((theme) => ({
  root: {
    background: colorWhite1,
    padding: "50px 0px 20px 0px",
  },
  left: {
    display: "block",
    [theme.breakpoints.down("sm")]: {
      display: "none",
    },
  },
  right: {},
  backgroundHeader: {
    height: "64px",
    background: colorBlack1,
  },
  pagination: {
    display: "flex",
    flexFlow: "row nowrap",
    flex: "1 1 auto",
    justifyContent: "center",
    padding: "20px 0px 50px 0px",
    "&> nav > ul> li> .MuiPaginationItem-textPrimary.Mui-selected": {
      color: "#fff",
      backgroundColor: colorOrange2,
    },
  },
}));
function ListCourse(props) {
  const classes = useStyles();
  const [dataCourse, setDataCourse] = useState([]);
  const [pagination, setPagination] = useState({
    _page: 1,
    _limit: 9,
    _totalRows: 10,
  });
  const [loading, setLoading] = useState(true);
  const [filter, setFilters] = useState({
    _page: 1,
    _limit: 9,
  });
  useEffect(() => {
    (async () => {
      try {
        // const { data, pagination } = await courseApiFake.testGetAll(filter);
        const { data, pagination } = await courseApi.getAll(filter);
        // const data = await courseApi.getAll(filter);
        setDataCourse(data);
        setPagination(pagination);
        console.log(data);
      } catch (error) {
        console.log(error);
      }
      setLoading(false);
    })();
  }, [filter]);

  function handlePageChange(e, page) {
    setFilters((prevFilters) => ({
      ...prevFilters,
      _page: page,
    }));
  }
  function handleSortChange(values) {
    const tmp = parse(values);
    setFilters((prevFilters) => ({
      ...prevFilters,
      _sort: tmp._sort,
      _order: tmp._order,
    }));
  }

  return (
    <>
      <Header />
      <Box className={classes.backgroundHeader} />
      <Box className={classes.root}>
        <Container>
          <Grid container spacing={2}>
            <Grid item className={classes.left} xl={3} lg={3} md={3}>
              <Paper elevation={0}>left course</Paper>
            </Grid>
            <Grid
              item
              className={classes.right}
              xl={9}
              lg={9}
              md={9}
              sm={12}
              xs={12}
            >
              <Paper elevation={0}>
                <TabPrice onChange={handleSortChange} />
                {loading ? (
                  <SkeletonCourse />
                ) : (
                  <RightCoures dataCourse={dataCourse} />
                )}
                <Box className={classes.pagination}>
                  <Pagination
                    color="primary"
                    count={Math.ceil(pagination._totalRows / pagination._limit)}
                    page={pagination._page}
                    onChange={handlePageChange}
                  ></Pagination>
                </Box>
              </Paper>
            </Grid>
          </Grid>
        </Container>
      </Box>
    </>
  );
}

export default ListCourse;
