import { unwrapResult } from "@reduxjs/toolkit";
import { useSnackbar } from "notistack";
import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory } from "react-router-dom";
import { isEmpty } from "../../../../components/tools/Tools";
import { register } from "../../userSlice";
import RegisterForm from "../RegisterForm";

Register.propTypes = {};

function Register(props) {
  const { enqueueSnackbar } = useSnackbar();
  const dispatch = useDispatch();
  const { push } = useHistory();

  // check redirect
  const user = useSelector((state) => state.user.current) || {};
  useEffect(() => {
    if (!isEmpty(user)) {
      push("/");
    }
  }, []);
  const handleOnSubmit = async (values) => {
    try {
      const action = register(values);
      console.log(values);
      const resultAction = await dispatch(action);
      const user = unwrapResult(resultAction);
      if (!!user) {
        push("/");
        // console.log(user);
        // console.log("Login Thành Công - Login success");
      } else {
        enqueueSnackbar("Đăng kí không thành công", { variant: "error" });
      }
    } catch (error) {
      console.log(error);
      enqueueSnackbar("Đăng kí không thành công", { variant: "error" });
    }
  };
  return <RegisterForm onSubmit={handleOnSubmit} />;
}

export default Register;
