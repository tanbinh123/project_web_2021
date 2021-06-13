import { Grid } from "@material-ui/core";
import React from "react";
import { useRecoilState } from "recoil";
import { DataUser } from "../../../app/DataUser";
import "././css/Actived.css";
import CourseBoughtCss from "./css/CourseBoughtCss";

function CourseBoughtFull(props) {
  const classes = CourseBoughtCss();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { courses } = dataUser;

  return (
    <Grid container className={classes.rightRoot}>
      <Grid
        item
        xl={12}
        lg={12}
        md={12}
        sm={12}
        xs={12}
        className="backround__header"
      >
        <ul>
          <li>
            <span>Edit Profile</span>
          </li>
          <li>
            <span>Chỉnh sửa thông tin cá nhân</span>
          </li>
        </ul>
      </Grid>
      <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
        {Array.from(courses).map((item, index) => (
          <div className={classes.itemCourse}>
            <div className={classes.bg_image}>
              <img src={item.thumbnail} alt="" className="__image" />
            </div>
            <div className={classes.rightItem}>
              <span className="title">{item.title}</span>
              <span className="content">{item.description}</span>
            </div>
          </div>
        ))}
      </Grid>
    </Grid>
  );
}
export default CourseBoughtFull;
