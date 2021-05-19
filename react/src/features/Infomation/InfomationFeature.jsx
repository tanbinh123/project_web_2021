import { Avatar, Box, Container, Grid } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import { Route, Switch, useRouteMatch } from "react-router";
import { Link, NavLink } from "react-router-dom";
import { useRecoilState } from "recoil";
import userApi from "../../api/userApi";
import { DataUser, removeLocalStorage } from "../../app/DataUser";
import Header from "../../components/header";
import NotFound404 from "../NotFound";
import Active from "./components/Active";
import Actived from "./components/Actived";
import Edit from "./components/Edit";
import Info from "./components/Info";
import CSSInfomationFeature from "./css/CSSInfomationFeature";
InfomationFeature.propTypes = {};
function InfomationFeature(props) {
  const classes = CSSInfomationFeature();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  console.log(dataUser);
  const { url } = useRouteMatch();
  function handleLogout() {
    removeLocalStorage();
    window.location = "/auth/login";
  }

  return (
    <div>
      <>
        <Header />
        <Box className={classes.backgroundHeader} />
        <Box className={classes.root}>
          <Container>
            <Grid container spacing={5}>
              <Grid
                item
                className={classes.left}
                xl={3}
                lg={3}
                md={3}
                sm={12}
                xs={12}
              >
                <div className={classes.leftRoot}>
                  <ul>
                    <li>
                      <Avatar
                        className={classes.avatar}
                        alt={dataUser.user.username}
                        src={dataUser.profile?.avatar?.image}
                      />
                      <div>
                        <Link to={`${url}/info`}>
                          <span>
                            {dataUser.profile?.fullname ||
                              dataUser.profile?.userName}{" "}
                            {dataUser.profile?.actived ? (
                              <i className="fas fa-check-circle green"></i>
                            ) : (
                              <i className="fas fa-times-circle red"></i>
                            )}
                          </span>
                        </Link>
                      </div>
                    </li>
                    <NavLink to={`${url}/info`}>
                      <li>Giới thiệu</li>
                    </NavLink>
                    {!dataUser.profile?.actived && (
                      <NavLink to={`${url}/active`}>
                        <li>Kích hoạt</li>
                      </NavLink>
                    )}
                    <NavLink to={`${url}/edit`}>
                      <li>Sửa thông tin cá nhân</li>
                    </NavLink>
                    <NavLink to={`${url}/change-password`}>
                      <li> Đổi mật khẩu</li>
                    </NavLink>

                    <li onClick={handleLogout}>Đăng xuất</li>
                  </ul>
                </div>
              </Grid>
              <Grid
                item
                className={classes.right}
                xl={9}
                lg={9}
                md={9}
                sm={12}
                xs={12}
              >
                <Switch>
                  <Route path={`${url}/edit`} component={Edit} exact />

                  <Route
                    path={`${url}/info`}
                    component={() => <Info profile={dataUser.profile} />}
                    exact
                  />
                  {!dataUser.profile.actived && (
                    <Route
                      path={`${url}/active`}
                      component={() => <Active profile={dataUser.profile} />}
                      exact
                    />
                  )}
                  <Route path={`${url}/`} component={NotFound404} />
                </Switch>
              </Grid>
            </Grid>
          </Container>
        </Box>
      </>
    </div>
  );
}
export default InfomationFeature;
