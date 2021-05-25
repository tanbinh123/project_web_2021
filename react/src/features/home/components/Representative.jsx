import { Grid, makeStyles } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import courseApi from "../../../api/courseApi";
import CardCourse from "../../../components/card/CardCourse";

const useStyles = makeStyles((theme) => ({
  root: {},
  text: {
    display: "flex",
    flexFlow: "column",
    justifyContent: "center",
    alignItems: "center",
    marginBottom: 50,
    color: "var(--colorBlack2)",
    "&>h2": {
      fontSize: 40,
    },
    "&>h5": {
      fontSize: 15,
    },
  },
}));
function Representative(props) {
  // http://localhost:25001/course/list?_limit=9&_sort=bought:desc
  const classes = useStyles();
  const [dataCourse, setDataCourse] = useState([]);
  useEffect(() => {
    (async () => {
      const res = await courseApi.getAll({ _limit: 6, _sort: "bought:desc" });
      const { data, pagination } = res;
      setDataCourse(data);
    })();
  }, []);
  return (
    <div className={classes.root}>
      <div className={classes.text}>
        <h2>Khóa học tiêu biểu</h2>
        <h5>Những khóa học có số lượng học viên đông nhất</h5>
      </div>
      <Grid container spacing={3}>
        {Array.from(dataCourse).map((x, index) => (
          <Grid key={index} item xl={4} lg={4} md={6} sm={6} xs={12}>
            <CardCourse
              id={x.id + ""}
              title={x.title}
              description={x.description}
              image={x.thumbnail}
              avatar={x.imgAvatar}
              nameAuthor={x.nameAuthor}
              rateStar={x.rateStar}
              bought={x.bought}
              price={x.price}
            />
          </Grid>
        ))}
      </Grid>
    </div>
  );
}

export default Representative;
