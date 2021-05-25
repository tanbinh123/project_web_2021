import { yupResolver } from "@hookform/resolvers/yup";
import { Container, makeStyles } from "@material-ui/core";
import { KeyboardBackspace } from "@material-ui/icons";
import React from "react";
import { useForm } from "react-hook-form";
import { Link, useHistory } from "react-router-dom";
import * as yup from "yup";
import ButtonSubmit from "../../../../components/Button/ButtonSubmit";
import {
  colorBlack1,
  colorBlack2,
  colorOrange1,
} from "../../../../components/color/color";
import CustomInput from "../../../../components/Input/CustomInput";
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
    padding: "20px",
    borderRadius: "10px",
    width: "400px",
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
    color: "var(--colorBlack1)",
  },
  textDK: {
    fontSize: "16px",
    fontWeight: 600,
    display: "block",
    textAlign: "center",
    textDecoration: "none",
    color: "var(--colorBlack2)",
    "&:hover": {
      color: "var(--colorOrange1)",
    },
  },
  text3: {
    margin: "10px 0px 10px 0px",
    display: "block",
    textAlign: "right",
    textDecoration: "none",
    color: "var(--colorBlack2)",
    "&:hover": {
      color: "var(--colorOrange1)",
    },
  },
  iconback: {
    cursor: "pointer",
  },
}));
//proptypes
LoginForm.propTypes = {};

//yup

const schema = yup.object().shape({
  username: yup
    .string()
    .required("Vui lòng nhập username")
    .min(3, "Vui lòng nhập hơn 3 kí tự"),
  email: yup
    .string()
    .required("Vui lòng nhập dữ liệu")
    .email("Vui lòng nhập email")
    .test("check account used", "account used ", async (email) => {
      if (email === "sang@gmail.com") {
        return false;
      }
      return true;
    }),
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
function LoginForm(props) {
  const { onSubmit } = props;
  const { push } = useHistory();
  const classes = useStyles();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      username: "",
      email: "",
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
      <Container maxWidth="sm">
        <form
          className={classes.cssForm}
          onSubmit={form.handleSubmit(handleOnSubmit)}
        >
          <KeyboardBackspace
            className={classes.iconback}
            onClick={() => {
              push("/");
            }}
          />
          <span className={classes.title}>Đăng ký</span>
          <CustomInput label="Tên đăng nhập" name="username" form={form} />
          <CustomInput label="Email" name="email" form={form} />
          <CustomInput
            name="password"
            label="Mật khẩu"
            type="password"
            form={form}
          />
          <CustomInput
            name="retypepassword"
            label="Nhập lại mật khẩu"
            type="password"
            form={form}
          />
          <Link to="/home" className={classes.text3}></Link>
          <ButtonSubmit title="Đăng ký" />
          <span className={classes.text1}>
            Bạn đã có tài khoản rồi ?
          </span>
          <Link to="/auth/login" className={classes.textDK}>
            <span>Đăng nhập</span>
          </Link>
        </form>
      </Container>
    </div>
  );
}

export default LoginForm;
