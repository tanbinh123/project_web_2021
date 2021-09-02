import { Grid, makeStyles } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import { useRecoilState } from "recoil";
import courseApi from "../../../api/courseApi";
import { DataUser } from "../../../app/DataUser";
import CardCourse from "../../../components/card/CardCourse";
import { isEmpty } from "../../../components/tools/Tools";

const useStyles = makeStyles((theme) => ({
  root: {
    marginTop: 50,
    paddingBottom:50,
  },
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
function BoughtHome(props) {
  const classes = useStyles();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  return (
    <div className={classes.root}>
      {
        <div className={classes.text}>
          <h2>Khóa học Đã mua</h2>
          <h5>Những khóa học mà bạn đã mua</h5>
        </div>
      }
      <Grid container spacing={3}>
        {Array.from(dataUser.courses).map((x, index) => (
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

export default BoughtHome;
