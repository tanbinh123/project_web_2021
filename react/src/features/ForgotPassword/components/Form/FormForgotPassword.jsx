import { yupResolver } from "@hookform/resolvers/yup";
import { Box, LinearProgress, makeStyles } from "@material-ui/core";
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
import InputText from "../../../../components/TextField";
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
    width: "27%",
    height: "70%",
    [theme.breakpoints.only("xs")]: {
      width: "80%",
      height: "80%",
    },
    [theme.breakpoints.only("sm")]: {
      width: "40%",
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
    marginBottom: "18%",
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
  divCenter: {
    textAlign: "center",
    marginTop: "20px",
  },
}));
//proptypes
FormForgotPassword.propTypes = {};

//yup

const schema = yup.object().shape({
  email: yup
    .string()
    .required("Vui lòng nhập email")
    .email("Vui lòng nhập đúng email"),
});
//function
function FormForgotPassword(props) {
  const { onSubmit, showProcess } = props;
  const classes = useStyles();
  const form = useForm({
    defaultValues: {
      email: "",
    },
    resolver: yupResolver(schema),
  });

  function handleOnSubmit(values) {
    const tmpShow = true;
    if (!onSubmit) return;
    onSubmit(values, tmpShow);
  }
  return (
    <div className={classes.root}>
      <form
        className={classes.cssForm}
        onSubmit={form.handleSubmit(handleOnSubmit)}
      >
        <span className={classes.title}>Forgot Password</span>
        <InputText label="Email" name="email" form={form} />

        <ButtonSubmit title="Submit" />
        <span className={classes.text1}>Did you remember the account?</span>
        <Link to="/auth/login" className={classes.textDK}>
          <span>Login</span>
        </Link>
        <Box className={classes.divCenter}>
          {showProcess && <LinearProgress />}
        </Box>
      </form>
    </div>
  );
}

export default FormForgotPassword;
