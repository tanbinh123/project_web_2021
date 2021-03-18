import { unwrapResult } from "@reduxjs/toolkit";
import React from "react";
import { useDispatch } from "react-redux";
import { Redirect } from "react-router-dom";
import { register } from "../../userSlice";
import RegisterForm from "../RegisterForm";

Register.propTypes = {};

function Register(props) {
  const dispatch = useDispatch();

  const handleOnSubmit = async (values) => {
    try {
      const action = register(values);
      console.log(values);
      const resultAction = await dispatch(action);
      const user = unwrapResult(resultAction);
    } catch (error) {
      console.log(error);
    }
  };
  return <RegisterForm onSubmit={handleOnSubmit} />;
}

export default Register;
