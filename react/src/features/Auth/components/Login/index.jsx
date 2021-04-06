import { useSnackbar } from "notistack";
import React, { useEffect } from "react";
import { useHistory } from "react-router-dom";
import { useRecoilState } from "recoil";
import userApi from "../../../../api/userApi";
import { addLocalStorage, DataUser } from "../../../../app/DataUser";
import { isEmpty } from "../../../../components/tools/Tools";
import LoginForm from "../LoginForm";

Login.propTypes = {};

function Login(props) {
  const { enqueueSnackbar } = useSnackbar();
  const { push } = useHistory();
  const [user, setUser] = useRecoilState(DataUser);
  // check redirect

  useEffect(() => {
    if (!isEmpty(user)) {
      push("/");
    }
  }, [user]);

  const handleOnSubmit = async (values) => {
    const data = await userApi.login(values);
    if (!!!data.status) {
      setUser(data.user);
      addLocalStorage(data);
    } else {
      enqueueSnackbar(data.data.message.en, { variant: "error" });
    }
  };

  return <LoginForm onSubmit={handleOnSubmit} />;
}

export default Login;
