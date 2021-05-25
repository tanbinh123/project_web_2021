import { yupResolver } from "@hookform/resolvers/yup";
import { Box, LinearProgress, makeStyles } from "@material-ui/core";
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
    padding: "20px 40px 20px 40px",
    borderRadius: "10px",
    width: "400px",
    height: "70%",
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
  iconback: {
    cursor: "pointer",
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
  const { push } = useHistory();
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
        <KeyboardBackspace
          className={classes.iconback}
          onClick={() => {
            push("/auth/login");
          }}
        />
        <span className={classes.title}>Quên mật khẩu</span>
        <CustomInput label="Email" name="email" form={form} />

        <ButtonSubmit title="Gửi" />
        <span className={classes.text1}>Bạn đã nhớ mật khẩu rồi ?</span>
        <Link to="/auth/login" className={classes.textDK}>
          <span>Đăng nhập</span>
        </Link>
        <Box className={classes.divCenter}>
          {showProcess && <LinearProgress />}
        </Box>
      </form>
    </div>
  );
}

export default FormForgotPassword;
