import React from "react";
import PropTypes from "prop-types";
import Header from "../../components/header";
import {
  Avatar,
  Box,
  Container,
  Grid,
  makeStyles,
  Paper,
} from "@material-ui/core";
import CSSInfomationFeature from "./css/CSSInfomationFeature";
import { useRecoilState } from "recoil";
import { DataUser } from "../../app/DataUser";
import { Camera } from "@material-ui/icons";
import Info from "./components/Info";
import { Route, Switch, useRouteMatch } from "react-router";
import { Link, NavLink } from "react-router-dom";
import Edit from "./components/Edit";
import NotFound404 from "../NotFound";
import Active from "./components/Active";

InfomationFeature.propTypes = {};
function InfomationFeature(props) {
  const classes = CSSInfomationFeature();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { url } = useRouteMatch();
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
                        src={
                          "https://upload-os-bbs.hoyolab.com/upload/2021/03/03/1015734/c396975a1041f466c80bd4f5b8f8e036_2256703502106078586.jpg?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,jpg"
                        }
                      />
                      <div>
                        <Link to={`${url}/info`}>
                          <span>
                            {dataUser.user.username}{" "}
                            {dataUser.user.actived ? (
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
                    {!dataUser.user.actived && (
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

                    <li>Đăng xuất</li>
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
                  <Route path={`${url}/info`} component={Info} exact />
                  <Route path={`${url}/active`} component={Active} exact />
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
