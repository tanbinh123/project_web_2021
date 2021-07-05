import React, { useEffect } from "react";
import { Link, useHistory } from "react-router-dom";
import {
  CButton,
  CCard,
  CCardBody,
  CCardGroup,
  CCol,
  CContainer,
  CForm,
  CInput,
  CInputGroup,
  CInputGroupPrepend,
  CInputGroupText,
  CRow,
} from "@coreui/react";
import CIcon from "@coreui/icons-react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import * as yup from "yup";
import CustomInput from "src/components/CustomInput";
import CustomButton from "src/components/CustomButton";
import userApi from "src/api/userApi";
import { makeStyles } from "@material-ui/core";
import classNames from "classnames";
import { addLocalStorage, DataUser } from "src/app/DataUser";
import { useRecoilState } from "recoil";
import { useSnackbar } from "notistack";
import { isEmpty } from "src/Tool/Tools";

const useStyles = makeStyles(() => ({
  background: {
    background: "rgb(114,210,181)",
    background:
      "linear-gradient(127deg, rgba(114,210,181,1) 0%, rgba(97,172,182,1) 0%, rgba(163,234,243,1) 100%)",
  },
  form: {},
}));

const schema = yup.object().shape({
  username: yup.string().required("Vui lòng nhập tài khoản"),
  password: yup.string().required("Vui lòng nhập mật khẩu"),
});
const Login = () => {
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { enqueueSnackbar } = useSnackbar();
  const { push } = useHistory();
  const classes = useStyles();
  if (!isEmpty(dataUser.token)) push("/");

  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      username: "",
      password: "",
    },
    resolver: yupResolver(schema),
  });

  const handleOnSubmit = async (values) => {
    // console.log(values);
    try {
      const res = await userApi.login(values);
      if (res.status == 400) {
        enqueueSnackbar(res.data.message.vi, { variant: "error" });
      } else {
        if (res.user.admin) {
          console.log(res);
          addLocalStorage(res);
          setDataUser(res);
          push("/");
        } else {
          enqueueSnackbar("Không đủ quyền truy cập", { variant: "error" });
        }
      }
    } catch (error) {
      enqueueSnackbar(error.message, { variant: "error" });
      console.log(error);
    }
  };
  return (
    <div
      className={classNames(
        "c-app c-default-layout flex-row align-items-center",
        classes.background
      )}
    >
      <CContainer>
        <CRow className="justify-content-center">
          <CCol md="4">
            <CCardGroup>
              <CCard className="p-4">
                <form
                  className={classes.form}
                  onSubmit={form.handleSubmit(handleOnSubmit)}
                >
                  <h1>Đăng nhập</h1>
                  <p className="text-muted">Đăng nhập tài khoản của bạn</p>
                  <CInputGroup className="mb-3">
                    <CustomInput
                      title="Tài khoản"
                      label="Tài khoản"
                      name="username"
                      form={form}
                    />
                  </CInputGroup>
                  <CInputGroup className="mb-4">
                    <CustomInput
                      title="Mật khẩu"
                      label="Mật khẩu"
                      name="password"
                      type="password"
                      form={form}
                    />
                  </CInputGroup>
                  <CRow>
                    <CCol xs="6">
                      <CustomButton type="submit" title="Đăng nhập" />
                    </CCol>
                    <CCol xs="6" className="text-right"></CCol>
                  </CRow>
                </form>
              </CCard>
            </CCardGroup>
          </CCol>
        </CRow>
      </CContainer>
    </div>
  );
};

export default Login;
