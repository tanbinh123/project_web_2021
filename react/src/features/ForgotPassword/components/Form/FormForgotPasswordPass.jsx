import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import React from "react";
import { useForm } from "react-hook-form";
import { Link } from "react-router-dom";
import * as yup from "yup";
import ButtonSubmit from "../../../../components/Button/ButtonSubmit";
import {
  colorBlack1,
  colorBlack2,
  colorOrange1,
} from "../../../../components/color/color";
import CustomInput from "../../../../components/Input/CustomInput";
import CustomInputHidden from "../../../../components/Input/CustomInputHidden";
//css
const useStyles = makeStyles((theme) => ({
  root: {
    // backgroundImage: 'url("../assets/images/noell.jpg")',
    minHeight: "100vh",

    position: "relative",

    backgroundPosition: "center",
    // backgroundRepeat: "no-repeat",
    // backgroundSize: "cover",
    background:
      'linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url("../assets/images/noell.jpg")',
  },
  cssForm: {
    background: "white",
    position: "absolute",
    left: "50%",
    top: "50%",
    transform: "translate(-50%, -50%)",
    padding: "20px 40px 20px 40px",
    borderRadius: "10px",
    width: "400px",
    height: "75%",
    [theme.breakpoints.down("sm")]: {
      width: "90%",
    },
  },
  title: {
    fontFamily: "Poppins",
    fontSize: "40px",
    textAlign: "center",
    display: "block",
    fontWeight: "700",
    margin: "50px 0 30px 0",
  },
  text1: {
    fontSize: "18px",
    marginTop: "40px",
    display: "block",
    textAlign: "center",
    color: colorBlack1,
  },
  textDK: {
    fontSize: "16px",
    fontWeight: 600,
    display: "block",
    textAlign: "center",
    textDecoration: "none",
    color: colorBlack2,
    "&:hover": {
      color: colorOrange1,
    },
  },
  text3: {
    margin: "10px 0px 10px 0px",
    display: "block",
    textAlign: "right",
    textDecoration: "none",
    color: colorBlack2,
    "&:hover": {
      color: colorOrange1,
    },
  },
}));
//proptypes
FormForgotPasswordPass.propTypes = {};

//yup

const schema = yup.object().shape({
  username: yup.string(),
  code: yup.string(),
  password: yup
    .string()
    .required("Vui lòng nhập password")
    .min(3, "Vui lòng nhập hơn 3 kí tự"),
  retypepassword: yup
    .string()
    .required("Vui lòng nhập password")
    .oneOf([yup.ref("password")], "password không giống nhau"),
});
//function
function FormForgotPasswordPass(props) {
  const { onSubmit, data } = props;
  const classes = useStyles();
  const form = useForm({
    defaultValues: {
      username: data.username,
      code: data.code,
      password: "",
      retypepassword: "",
    },
    resolver: yupResolver(schema),
  });

  function handleOnSubmit(values) {
    if (!onSubmit) return;
    onSubmit(values);
  }
  return (
    <div className={classes.root}>
      <form
        className={classes.cssForm}
        onSubmit={form.handleSubmit(handleOnSubmit)}
      >
        <span className={classes.title}>Quên mật khẩu</span>
        <CustomInputHidden value={data.username} name="username" form={form} />
        <CustomInputHidden value={data.code} name="code" form={form} />
        <CustomInput
          label="Mật khẩu"
          name="password"
          type="password"
          form={form}
        />
        <CustomInput
          label="Nhập lại mật khẩu"
          name="retypepassword"
          type="password"
          form={form}
        />
        <ButtonSubmit title="Gửi" />
        <span className={classes.text1}>Bạn đã nhớ mật khẩu rồi ?</span>
        <Link to="/auth/login" className={classes.textDK}>
          <span>Đăng nhập</span>
        </Link>
      </form>
    </div>
  );
}

export default FormForgotPasswordPass;
