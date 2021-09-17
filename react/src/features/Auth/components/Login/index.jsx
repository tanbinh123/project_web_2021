import { useSnackbar } from 'notistack';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import { useRecoilState } from 'recoil';
import userApi from '../../../../api/userApi';
import { addLocalStorage, DataUser } from '../../../../app/DataUser';
import { isEmpty, validateEmail } from '../../../../components/tools/Tools';
import LoginForm from '../LoginForm';
import { GoogleAuthProvider, signInWithPopup } from 'firebase/auth';
import { auth } from '../../../../firebase/config';

function Login(props) {
  const { enqueueSnackbar } = useSnackbar();
  const { push } = useHistory();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  // check redirect
  const GGProvider = new GoogleAuthProvider();
  useEffect(() => {
    window.scrollTo(0, 0);
    if (!isEmpty(dataUser.user)) {
      push('/');
    }
  }, [dataUser.user]);
  const handleOnSubmit = async (values) => {
    if (validateEmail(values.username)) {
      const data = await userApi.loginByEmail({
        email: values.username,
        password: values.password,
      });
      console.log(data);
      if (!!!data.status) {
        addLocalStorage(data);
        //set token de lay profile

        setDataUser(data);
        addLocalStorage(data);
        console.log('localStorage', data);
      } else {
        enqueueSnackbar(data.data.message.vi, { variant: 'error' });
      }
    } else {
      const data = await userApi.login(values);
      console.log(data);
      if (!!!data.status) {
        addLocalStorage(data);
        //set token de lay profile

        setDataUser(data);
        addLocalStorage(data);
        console.log('localStorage', data);
      } else {
        enqueueSnackbar(data.data.message.vi, { variant: 'error' });
      }
    }
  };
  const handleLoginWithSocial = async (social) => {
    try {
      if (social === 'google') {
        const { user } = await signInWithPopup(auth, GGProvider);
        const { accessToken } = user;
        loginWithFirebase(accessToken);
      }
    } catch (error) {
      console.log(error);
    }
  };
  const loginWithFirebase = async (accessToken) => {
    const data = await userApi.loginWithFirebase({
      accessToken: accessToken,
    });
    console.log(data);
    if (!!!data.status) {
      addLocalStorage(data);
      //set token de lay profile

      setDataUser(data);
      addLocalStorage(data);
      console.log('localStorage', data);
    } else {
      enqueueSnackbar(data.data.message.vi, { variant: 'error' });
    }
  };
  return (
    <LoginForm
      onSubmit={handleOnSubmit}
      loginWithSocial={handleLoginWithSocial}
    />
  );
}

export default Login;
