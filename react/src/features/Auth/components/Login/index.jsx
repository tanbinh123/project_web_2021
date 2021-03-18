import { unwrapResult } from "@reduxjs/toolkit";
import React from "react";
import { useDispatch } from "react-redux";
import { Redirect, useHistory } from "react-router-dom";
import { login } from "../../userSlice";
import LoginForm from "../LoginForm";

Login.propTypes = {};

function Login(props) {
  const dispatch = useDispatch();
  const { push } = useHistory();

  const handleOnSubmit = async (values) => {
    try {
      const action = login(values);
      const resultAction = await dispatch(action);
      const user = unwrapResult(resultAction);
      console.log("Login Thành Công - Login success");
      push("/");
    } catch (error) {
      console.log(error);
    }
  };
  return <LoginForm onSubmit={handleOnSubmit} />;
}

export default Login;
