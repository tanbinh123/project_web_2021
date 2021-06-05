import React from "react";
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

const schema = yup.object().shape({
  username: yup.string().required("Vui lòng nhập username"),
  password: yup.string().required("Vui lòng nhập password"),
});
const Login = () => {
  const { push } = useHistory();
  // const classes = useStyles();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      username: "",
      password: "",
    },
    resolver: yupResolver(schema),
  });

  const handleOnSubmit = async (values) => {
    console.log(values);
    const res = await userApi.login(values);
    console.log(res);
  };
  return (
    <div className="c-app c-default-layout flex-row align-items-center">
      <CContainer>
        <CRow className="justify-content-center">
          <CCol md="8">
            <CCardGroup>
              <CCard className="p-4">
                <CCardBody>
                  <form onSubmit={form.handleSubmit(handleOnSubmit)}>
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
                </CCardBody>
              </CCard>
              <CCard
                className="text-white bg-primary py-5 d-md-down-none"
                style={{ width: "44%" }}
              >
                <CCardBody className="text-center">
                  <div>
                    <h2>Đăng kí</h2>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna
                      aliqua.
                    </p>
                    <Link to="/register" style={{ textDecoration: "none" }}>
                      <CustomButton title="Đăng kí" />
                    </Link>
                  </div>
                </CCardBody>
              </CCard>
            </CCardGroup>
          </CCol>
        </CRow>
      </CContainer>
    </div>
  );
};

export default Login;
