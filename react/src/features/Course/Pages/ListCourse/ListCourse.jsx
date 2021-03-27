import { Box, Container, Grid, makeStyles, Paper } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import courseApi from "../../../../api/courseApi";
import courseApiFake from "../../../../api/courseApiFake";
import { colorBlack1, colorWhite1 } from "../../../../components/color/color";
import Header from "../../../../components/header/index";
import RightCoures from "./components/RightCoures";

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
}));
function ListCourse(props) {
  const classes = useStyles();
  const [dataCourse, setDataCourse] = useState([]);
  const [filter, setFilter] = useState({
    _page: 1,
    _limit: 9,
  });
  useEffect(() => {
    (async () => {
      //const data = await courseApiFake.testGetAll(filter);
      const data = await courseApi.getAll(filter);
      console.log(data);
      setDataCourse(data);
    })();
  }, [filter]);
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
                <RightCoures dataCourse={dataCourse} />
              </Paper>
            </Grid>
          </Grid>
        </Container>
      </Box>
    </>
  );
}

export default ListCourse;
