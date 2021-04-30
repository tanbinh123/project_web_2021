import { Grid } from "@material-ui/core";
import React from "react";
import { useForm } from "react-hook-form";
import CustomInput from "../../../components/Input/CustomInput";
import "././css/Actived.css";
import EditCss from "./css/EditCss";

Edit.propTypes = {};

function Edit(props) {
  const classes = EditCss();
  const form = useForm();
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
        <CustomInput title="Họ và Tên" name="fullName" />
      </Grid>
    </Grid>
  );
}

export default Edit;
