import { unwrapResult } from "@reduxjs/toolkit";
import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect, useHistory } from "react-router-dom";
import { isEmpty } from "../../../../components/tools/Tools";
import { register } from "../../userSlice";
import RegisterForm from "../RegisterForm";

Register.propTypes = {};

function Register(props) {
  const dispatch = useDispatch();
  const { push } = useHistory();

  // check redirect
  const user = useSelector((state) => state.user.current);
  if (!isEmpty(user)) {
    push("/");
  }

  const handleOnSubmit = async (values) => {
    try {
      const action = register(values);
      console.log(values);
      const resultAction = await dispatch(action);
      const user = unwrapResult(resultAction);
      push("/");
    } catch (error) {
      console.log(error);
    }
  };
  return <RegisterForm onSubmit={handleOnSubmit} />;
}

export default Register;
