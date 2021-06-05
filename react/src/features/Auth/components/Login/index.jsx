import { useSnackbar } from "notistack";
import React, { useEffect, useState } from "react";
import { useHistory } from "react-router-dom";
import { useRecoilState } from "recoil";
import userApi from "../../../../api/userApi";
import { addLocalStorage, DataUser } from "../../../../app/DataUser";
import { isEmpty } from "../../../../components/tools/Tools";
import LoginForm from "../LoginForm";

function Login(props) {
  const { enqueueSnackbar } = useSnackbar();
  const { push } = useHistory();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  // check redirect

  useEffect(() => {
    if (!isEmpty(dataUser.user)) {
      push("/");
    }
  }, [dataUser.user]);
  const handleOnSubmit = async (values) => {
    const data = await userApi.login(values);
    console.log(data);
    if (!!!data.status) {
      addLocalStorage(data);
      //set token de lay profile
      
      setDataUser({
        ...dataUser,
        user: data.user,        
        profile: data.profile,
      });
      addLocalStorage(data, data.profile);
      console.log("localStorage", data);
    } else {
      enqueueSnackbar(data.data.message.vi, { variant: "error" });
    }
  };
  return <LoginForm onSubmit={handleOnSubmit} />;
}

export default Login;
