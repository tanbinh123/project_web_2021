import { unwrapResult } from "@reduxjs/toolkit";
import { useSnackbar } from "notistack";
import React from "react";
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

  if (!isEmpty(user)) {
    push("/");
  }

  const handleOnSubmit = async (values) => {
    try {
      const action = login(values);
      const resultAction = await dispatch(action);
      const response = unwrapResult(resultAction);
      // console.log(response.data?.message);
      if (!!!response.status) {
        push("/");
        // console.log(user);
        // console.log("Login Thành Công - Login success");
      } else {
        enqueueSnackbar(response.data.message.en, { variant: "error" });
      }
    } catch (error) {
      console.log(error);
    }
  };

  return <LoginForm onSubmit={handleOnSubmit} />;
}

export default Login;
