import { unwrapResult } from "@reduxjs/toolkit";
import { useSnackbar } from "notistack";
import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory } from "react-router-dom";
import { isEmpty } from "../../../../components/tools/Tools";
import { login } from "../../userSlice";
import LoginForm from "../LoginForm";

Login.propTypes = {};

function Login(props) {
  const { enqueueSnackbar } = useSnackbar();
  const dispatch = useDispatch();
  const { push } = useHistory();
  const user = useSelector((state) => state.user.current) || {};
  // check redirect
  useEffect(() => {
    if (!isEmpty(user)) {
      push("/");
    }
  }, []);

  const handleOnSubmit = async (values) => {
    try {
      const action = login(values);
      const resultAction = await dispatch(action);
      const user = unwrapResult(resultAction);
      console.log(!!user);
      if (!!user) {
        push("/");
        // console.log(user);
        // console.log("Login Thành Công - Login success");
      } else {
        enqueueSnackbar("Đăng nhập không thành công", { variant: "error" });
      }
    } catch (error) {
      console.log(error);
      enqueueSnackbar("Đăng nhập không thành công", { variant: "error" });
    }
  };

  return <LoginForm onSubmit={handleOnSubmit} />;
}

export default Login;
