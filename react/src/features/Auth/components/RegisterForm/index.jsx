import { Container, makeStyles } from "@material-ui/core";
import React from "react";
import { useForm } from "react-hook-form";
import ButtonSubmit from "../../../../components/Button/ButtonSubmit";
import PasswordField from "../../../../components/PasswordField";
import InputText from "../../../../components/TextField";
import { yupResolver } from "@hookform/resolvers/yup";
import * as yup from "yup";
import { Link } from "react-router-dom";
import {
  colorBlack1,
  colorBlack2,
  colorOrange1,
} from "../../../../components/color/color";
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
    width: "26%",
    [theme.breakpoints.only("xs")]: {
      width: "90%",
      height: "90%",
    },
    [theme.breakpoints.only("sm")]: {
      width: "36%",
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
    .email("Vui lòng nhập email"),
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
  const classes = useStyles();
  const form = useForm({
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
          <span className={classes.title}>Register</span>
          <InputText label="Username" name="username" form={form} />
          <InputText label="Email" name="email" form={form} />
          <PasswordField name="password" label="Password" form={form} />
          <PasswordField
            name="retypepassword"
            label="Retype Password"
            form={form}
          />
          <Link to="/home" className={classes.text3}></Link>
          <ButtonSubmit title="Register" />
          <span className={classes.text1}>
            Do you already have an account ?
          </span>
          <Link to="/auth/login" className={classes.textDK}>
            <span>Login</span>
          </Link>
        </form>
      </Container>
    </div>
  );
}

export default LoginForm;
