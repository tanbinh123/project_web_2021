import { Grid, LinearProgress } from "@material-ui/core";
import React, { useState } from "react";
import {
  useHistory,

  useRouteMatch
} from "react-router";
import userApi from "../../../api/userApi";
import ButtonClick from "../../../components/Button/ButtonClick";
import ActiveCss from "./css/ActiveCss";
Active.propTypes = {};

function Active(props) {
  const classes = ActiveCss();

  const { push } = useHistory();
  const { url } = useRouteMatch();
  const [progress, setProgress] = useState({ isProcessing: false });

  // useEffect(() => {
  //   if (isEmpty(props?.profile)) {
  //     push("/setting-account/info");
  //   }
  // }, []);
  const handleOnCLick = async () => {
    setProgress({ isProcessing: true });
    const payload = {
      url: `http://localhost:3000/setting-account/active`,
    };
    const res = await userApi.active(payload);
    console.log(res);
    setProgress({ isProcessing: false });
  };
  console.log(url);

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
            Email của bạn là : <span>{props?.profile?.email}</span>
          </span>
        </div>
        <div>
          <ButtonClick title="Kích hoạt" onClick={handleOnCLick} />
        </div>
        {progress.isProcessing && <LinearProgress />}
      </Grid>
    </Grid>
  );
}

export default Active;
