import { Grid, makeStyles } from "@material-ui/core";
import React from "react";
import { useForm } from "react-hook-form";
import * as yup from "yup";
import { yupResolver } from "@hookform/resolvers/yup";
function Ratting(props) {
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
  const schema = yup.object().shape({
    // username: yup.string().required("Vui lòng nhập username"),
  });
  const form = useForm({
    mode: "onBlur",
    defaultValues: {},
    resolver: yupResolver(schema),
  });

  return (
    <div>
      <Grid
        item
        xl={12}
        lg={12}
        md={12}
        sm={12}
        xs={12}
        className={classes.root}
      >
        <div className={classes.contentCourse}>
          <h2>Đánh giá</h2>
          <form>
            <div></div>
          </form>
        </div>
      </Grid>
    </div>
  );
}

export default Ratting;
