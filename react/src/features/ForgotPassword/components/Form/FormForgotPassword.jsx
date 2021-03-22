import {
  Box,
  CircularProgress,
  Container,
  Grid,
  makeStyles,
} from "@material-ui/core";
import React, { useState } from "react";
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
      height: "80%",
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
    marginTop: "40px",
    display: "block",
    textAlign: "center",
    color: colorBlack1,
  },
  textDK: {
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
  divCenter: {
    textAlign: "center",
    marginTop: "20px",
  },
}));
//proptypes
FormForgotPassword.propTypes = {};

//yup

const schema = yup.object().shape({
  emailOrUsername: yup
    .string()
    .required("Vui lòng nhập email")
    .email("Vui lòng nhập đúng email"),
});
//function
function FormForgotPassword(props) {
  const { onSubmit, complete } = props;
  const classes = useStyles();
  const [show, setShow] = useState(false);
  const form = useForm({
    defaultValues: {
      emailOrUsername: "",
    },
    resolver: yupResolver(schema),
  });

  function handleOnSubmit(values) {
    setShow(true);
    if (!onSubmit) return;
    onSubmit(values);
  }
  return (
    <div className={classes.root}>
      <form
        className={classes.cssForm}
        onSubmit={form.handleSubmit(handleOnSubmit)}
      >
        <span className={classes.title}>Forgot Password</span>
        <InputText label="Email" name="emailOrUsername" form={form} />
        <Box className={classes.divCenter}>{show && <CircularProgress />}</Box>
        <ButtonSubmit title="Submit" />
        <span className={classes.text1}>Did you remember the account?</span>
        <Link to="/auth/login" className={classes.textDK}>
          <span>Login</span>
        </Link>
      </form>
    </div>
  );
}

export default FormForgotPassword;
