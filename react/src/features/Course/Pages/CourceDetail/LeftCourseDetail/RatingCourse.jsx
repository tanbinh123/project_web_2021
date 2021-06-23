import { Grid, makeStyles } from "@material-ui/core";
import React, { useEffect } from "react";
import { useForm } from "react-hook-form";
import * as yup from "yup";
import { yupResolver } from "@hookform/resolvers/yup";
import MenuRatting from "./Ratting/MenuRatting";
import ListRating from "./Ratting/ListRating";
import FormRating from "./Ratting/FormRating";
import { DataUser } from "../../../../../app/DataUser";
import { useRecoilState } from "recoil";
import { isEmpty } from "../../../../../components/tools/Tools";
import { useState } from "react";
import ratingApi from "../../../../../api/ratingApi";
function RatingCourse(props) {
  const { idCourse = null,onUpdate = null } = props;
  const classes = makeStyles(() => ({
    root: {
      marginTop: "30px",
    },
    contentCourse: {
      "&> h2": {
        color: "var(--colorBlack2)",
        margin: "30px 0px 20px 0px",
      },
    },
  }))();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const [fillEva, setFillEva] = useState();
  const [evaluates,setEvaluates] = useState([]);
  const handleOnChangeSelected = (value) => {
    if (value === 0) {
      setFillEva(evaluates);
    } else {
      let tmp = [];
      Array.from(evaluates).map((item, index) => {
        if (item.rating === value) {
          tmp = [...tmp, item];
        }
      });
      setFillEva(tmp);
    }
  };
  const [evaluateUser, setEvaluateUser] = useState();
  const [bought, setBought] = useState(false);
  useEffect(() => {
    (async () => {
      try {
      const res = await ratingApi.get(idCourse);
      console.log(res);
      if(!(res?.message?.en=="List ratings not ready")){
        setEvaluates(res.data);
        setFillEva(res.data);
        if (!isEmpty(dataUser.token)) {
          Array.from(res.data).map((item) => {
            if (item.username == dataUser.user.username) {
              setEvaluateUser(item);
            }
          });
        }
      }
      
      } catch (error) {
        console.log(error.message);
      }
    })();
    
    Array.from(dataUser.courses).map((item) => {
      if (item.id === idCourse) setBought(true);
    });
  }, [idCourse]);
  return (
    <Grid item xl={12} lg={12} md={12} sm={12} xs={12} className={classes.root}>
      <div className={classes.contentCourse}>
        <h2>Đánh giá</h2>
        <MenuRatting onChangeSelected={handleOnChangeSelected} />
        {bought && (
          <FormRating
            idCourse={idCourse}
            evaluateUser={evaluateUser}
            onUpdate={onUpdate}
          />
        )}
        <ListRating evaluates={fillEva} />
      </div>
    </Grid>
  );
}

export default RatingCourse;
