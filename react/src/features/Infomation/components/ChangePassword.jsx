import { yupResolver } from "@hookform/resolvers/yup";
import { Grid } from "@material-ui/core";
import React from "react";
import { useForm } from "react-hook-form";
import { useRecoilState } from "recoil";
import * as yup from "yup";
import { DataUser } from "../../../app/DataUser";
import CustomButton from "../../../components/Button/CustomButton";
import CustomInput from "../../../components/Input/CustomInput";
import "././css/Actived.css";
import ChangePasswordCss from "./css/ChangePasswordCss";
import userApi from "../../../api/userApi";
import { useSnackbar } from "notistack";

const schema = yup.object().shape({
  password: yup.string().required("Vui lòng nhập password"),
  retypePassword: yup.string().required("Vui lòng nhập lại password"),
});

function ChangePassword(props) {
  const classes = ChangePasswordCss();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { courses } = dataUser;
  const { enqueueSnackbar } = useSnackbar();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      password: "",
      retypePassword: "",
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = (values) => {
    console.log("postChangePassword",values);//HOANG
    // field Request
    /* password: password cũ
    newPassword: password mới */

    (async () => {
      const rp = await userApi.changePassword(values);
      console.log(rp);
      if (!rp.status) {
        console.log(rp);
        enqueueSnackbar("Thay đổi mật khẩu thành công", { variant: "success" });
       
      }
    })();
  };
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
            <span>Đổi mật khẩu</span>
          </li>
          <li>
            <span>Đổi mật khẩu của tài khoản bạn</span>
          </li>
        </ul>
      </Grid>
      <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
        <form
          onSubmit={form.handleSubmit(handleOnSubmit)}
          className={classes.form}
        >
          <div className={classes.rowForm}>
            <span>Mật khẩu mới</span>
            <CustomInput
              title="Mật khẩu mới"
              label="Mật khẩu mới"
              name="password"
              type="password"
              form={form}
            />
          </div>
          <div className={classes.rowForm}>
            <span>Nhập lại mật khẩu mới</span>
            <CustomInput
              title="Nhập lại mật khẩu mới"
              label="Nhập lại mật khẩu mới"
              name="retypePassword"
              type="password"
              form={form}
            />
          </div>
          <div className={classes.lastRow}>
            <CustomButton title="Gửi" type="submit" />
          </div>
        </form>
      </Grid>
    </Grid>
  );
}
export default ChangePassword;
