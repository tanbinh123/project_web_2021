import { CCard, CCardBody, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { Avatar, Grid, makeStyles } from "@material-ui/core";
import { useSnackbar } from "notistack";
import React, { useState } from "react";
import { useEffect } from "react";
import { useForm } from "react-hook-form";
import {
  useHistory,
  useLocation,
  useParams,
  useRouteMatch,
} from "react-router-dom";
import categoriesApi from "src/api/categoriesApi";
import userApi from "src/api/userApi";
import CustomButton from "src/components/CustomButton";
import CustomInput from "src/components/CustomInput";
import { isEmpty } from "src/Tool/Tools";
import * as yup from "yup";
const scheme = yup.object().shape({
  name: yup.string().required("Vui lòng nhập tên thể loại"),
});

const UserDetailt = (props) => {
  const classes = makeStyles(() => ({
    footer: {
      display: "flex",
      justifyContent: "space-between",
    },
    visiable: {
      visibility: "hidden",
    },
    form: {
      marginBlock: "20px",
    },
    itemForm: {
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      "&>span:first-of-type": {
        width: "200px",
        textAlign: "right",
        marginRight: "25px",
      },
      "&>span:last-of-type": {
        width: 200,
        fontWeight: 600,
        marginLeft: "25px",
      },
    },
    lastItem: {
      display: "flex",
      justifyContent: "center",
      marginBlock: "20px",
    },
  }))();

  const { id } = useParams();
  const { push, goBack } = useHistory();
  const { enqueueSnackbar } = useSnackbar();
  const [user, setUser] = useState({});
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      name: "",
    },
    resolver: yupResolver(scheme),
  });

  useEffect(() => {
    (async () => {
      const res = await userApi.adminGetOneUser(id);
      console.log(res);
      setUser(res);
    })();
  }, [id]);
  return (
    <>
      <Grid container className={classes.root} spacing={3}>
        <Grid item xl={12} lg={12} md={12} xs={12} sm={12}>
          <CCard>
            <CCardHeader>
              <span className="title">Chi tiết tài khoản</span>
            </CCardHeader>
            <CCardBody>
              <div className={classes.form}>
                <div className={classes.itemForm}>
                  <span>ID</span>
                  <span>{user.id}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Tài Khoản</span>
                  <span>{user.userName}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Hình avatar</span>
                  <span>
                    <Avatar src={user?.avatar?.image} />
                  </span>
                </div>
                <div className={classes.itemForm}>
                  <span>Tên</span>
                  <span>{user.fullname}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Email</span>
                  <span>{user.userName}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Facebook</span>
                  <span>{user.facebook}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Giới tính</span>
                  <span>{user.gender}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Ngày sinh</span>
                  <span>{user.birthDay}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Địa chỉ</span>
                  <span>{user.location}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Số điện thoại</span>
                  <span>{user.phone}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Quyền</span>
                  <span>{user.isAdmin ? "ADMIN" : "USER"}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Mô tả</span>
                  <span>{user.description}</span>
                </div>

                <div className={classes.itemForm}>
                  <span>Trạng thái</span>
                  <span>
                    {user.actived ? "Đã kích hoạt" : "Chưa kích hoạt"}
                  </span>
                </div>

                <div className={classes.lastItem}>
                  <CustomButton
                    title="Quay Lại"
                    onClick={() => {
                      goBack();
                    }}
                  />
                </div>
              </div>
            </CCardBody>
            {/* <CCardFooter></CCardFooter> */}
          </CCard>
        </Grid>
      </Grid>
    </>
  );
};

export default UserDetailt;
