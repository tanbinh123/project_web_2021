import { Avatar, Grid } from "@material-ui/core";
import React from "react";
import { useForm } from "react-hook-form";
import CustomInput from "../../../components/Input/CustomInput";
import "././css/Actived.css";
import EditCss from "./css/EditCss";
import { yupResolver } from "@hookform/resolvers/yup";
import * as yup from "yup";

Edit.propTypes = {};
const schema = yup.object().shape({
  // firstName: yup.string().required(),
});
function Edit(props) {
  const classes = EditCss();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {},
    resolver: yupResolver(schema),
  });
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
        <form>
          <Avatar className={classes.Avatar} />
          <CustomInput
            title="Họ và Tên"
            name="fullName"
            label="Fullname"
            form={form}
          />
        </form>
      </Grid>
    </Grid>
  );
}
export default Edit;
