import { useSnackbar } from "notistack";
import React, { useEffect } from "react";
import { useHistory } from "react-router-dom";
import { useRecoilState } from "recoil";
import userApi from "../../../../api/userApi";
import { addLocalStorage, DataUser } from "../../../../app/DataUser";
import { isEmpty } from "../../../../components/tools/Tools";
import RegisterForm from "../RegisterForm";

Register.propTypes = {};

function Register(props) {
  const { enqueueSnackbar } = useSnackbar();
  const { push } = useHistory();

  // check redirect
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  useEffect(() => {
    if (!isEmpty(dataUser.user)) {
      push("/");
    }
  }, [dataUser.user]);

  const handleOnSubmit = async (values) => {
    const data = await userApi.register(values);
    if (!!!data.status) {
      addLocalStorage(data);
      //set token de lay profile
      const dataLogin = await userApi.login(values);
      setDataUser(dataLogin);
      addLocalStorage(dataLogin);
      console.log("localStorage", dataLogin);
    } else {
      enqueueSnackbar(data.data.message.vi, { variant: "error" });
    }
  };
  return <RegisterForm onSubmit={handleOnSubmit} />;
}

export default Register;
