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
import CustomSelectForm from "src/components/form/CustomSelectForm";
import { isEmpty } from "src/Tool/Tools";
import * as yup from "yup";
const scheme = yup.object().shape({
  // name: yup.string().required("Vui lòng nhập tên thể loại"),
});

const UserUpdateRole = (props) => {
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
      margin: "10px 0px",
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
    itemFormInput: {
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      "&>span:first-of-type": {
        width: "200px",
        textAlign: "right",
        marginRight: "25px",
      },
      "&>div": {
        width: "200px",
        marginLeft: "25px",
      },
    },
    lastItem: {
      display: "flex",
      justifyContent: "center",
      marginBlock: "20px",
      "&>button": {
        margin: "25px",
      },
    },
  }))();

  const { id } = useParams();
  const { push, goBack } = useHistory();
  const { enqueueSnackbar } = useSnackbar();
  const [user, setUser] = useState({});
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      id: 0,
      role: false,
    },
    resolver: yupResolver(scheme),
  });

  useEffect(() => {
    (async () => {
      try {
        const res = await userApi.adminGetOneUser(id);
        console.log(res);
        setUser(res);
        form.setValue("role", res?.isAdmin);
        form.setValue("id", res?.id);
      } catch (error) {
        console.log(error);
      }
    })();
    return () => {
      setUser({});
    };
  }, [id]);
  const handleOnSubmit = async (value) => {
    try {
      const { role, id } = value;
      if (user.isAdmin === role) {
        enqueueSnackbar("Vui lòng chọn khác quyền hiện có", {
          variant: "error",
        });
        return;
      }
      if (role) {
        const res = await userApi.setRoleAdmin(id);
        if (!res.status) {
          enqueueSnackbar("Cập nhật quyền thành công", { variant: "success" });
          setUser({ ...user, isAdmin: role });
        } else {
          enqueueSnackbar(res?.data?.message?.en, { variant: "error" });
        }
      } else {
        const res = await userApi.removeRoleAdmin(id);
        console.log(res);
        if (!res.status) {
          enqueueSnackbar("Cập nhật quyền thành công", { variant: "success" });
          setUser({ ...user, isAdmin: role });
        } else {
          enqueueSnackbar(res?.data?.message?.en, { variant: "error" });
        }
      }
    } catch (error) {
      enqueueSnackbar(error?.message, { variant: "error" });
    }
  };
  return (
    <>
      <Grid container className={classes.root} spacing={3}>
        <Grid item xl={12} lg={12} md={12} xs={12} sm={12}>
          <CCard>
            <CCardHeader>
              <span className="title">Form thể loại</span>
            </CCardHeader>
            <CCardBody>
              <form
                onSubmit={form.handleSubmit(handleOnSubmit)}
                className={classes.form}
              >
                <div className={classes.itemForm}>
                  <span>ID</span>
                  <span>{user.id}</span>
                </div>
                <div className={classes.itemForm}>
                  <span>Tài Khoản</span>
                  <span>{user.userName}</span>
                </div>

                <div className={classes.itemFormInput}>
                  <span>Quyền tài khoản</span>
                  <CustomSelectForm
                    form={form}
                    name="role"
                    label="Quyền tài khoản"
                    data={[
                      { value: true, title: "Admin" },
                      { value: false, title: "User" },
                    ]}
                  />
                </div>
                <div className={classes.lastItem}>
                  <CustomButton
                    title="Quay Lại"
                    onClick={() => {
                      goBack();
                    }}
                  />
                  <CustomButton title="Xác nhận" type="submit" />
                </div>
              </form>
            </CCardBody>
            {/* <CCardFooter></CCardFooter> */}
          </CCard>
        </Grid>
      </Grid>
    </>
  );
};

export default UserUpdateRole;
