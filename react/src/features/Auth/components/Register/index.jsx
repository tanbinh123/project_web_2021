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
  const [user, setUser] = useRecoilState(DataUser);

  useEffect(() => {
    if (!isEmpty(user)) {
      push("/");
    }
  }, [user]);

  const handleOnSubmit = async (values) => {
    const data = await userApi.register(values);
    if (!!!data.status) {
      setUser(data.user);
      addLocalStorage(data);
    } else {
      enqueueSnackbar(data.data.message.en, { variant: "error" });
    }
  };
  return <RegisterForm onSubmit={handleOnSubmit} />;
}

export default Register;
