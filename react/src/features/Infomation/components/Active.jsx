import { Grid, LinearProgress } from "@material-ui/core";
import React, { useEffect } from "react";
import { useHistory, useRouteMatch } from "react-router";
import { useRecoilState } from "recoil";
import userApi from "../../../api/userApi";
import { DataUser } from "../../../app/DataUser";
import ButtonClick from "../../../components/Button/ButtonClick";
import ActiveCss from "./css/ActiveCss";
Active.propTypes = {};

function Active(props) {
  const classes = ActiveCss();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { push } = useHistory();
  const { url } = useRouteMatch();
  useEffect(() => {
    if (dataUser.user.actived) {
      push("/setting-account/info");
    }
  }, []);
  const handleOnCLick = async () => {
    const payload = {
      url: `http://192.168.0.222:3000/actived`,
    };
    const res = await userApi.active(payload);
    console.log(res);
  };
  return (
    <Grid container className={classes.rightRoot}>
      <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
        <ul>
          <li>
            <span>Tài khoản chưa được kích hoạt</span>
          </li>
          <li>
            <span>Vui lòng kích hoạt tài khoản để sử dụng hết tính năng</span>
          </li>
        </ul>
      </Grid>
      <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
        <div>
          <span>
            Email của bạn là : <span>anonkill1999@gmail.com</span>
          </span>
        </div>
        <div>
          <ButtonClick title="Kích hoạt" onClick={handleOnCLick} />
        </div>
        <LinearProgress />
      </Grid>
    </Grid>
  );
}

export default Active;
