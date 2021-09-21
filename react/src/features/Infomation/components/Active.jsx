import { Grid, LinearProgress } from '@material-ui/core';
import { useSnackbar } from 'notistack';
import React, { useState } from 'react';
import { useHistory, useRouteMatch } from 'react-router';
import userApi from '../../../api/userApi';
import ButtonClick from '../../../components/Button/ButtonClick';
import ActiveCss from './css/ActiveCss';
Active.propTypes = {};

function Active(props) {
  const classes = ActiveCss();

  const { push } = useHistory();
  const { url } = useRouteMatch();
  const [progress, setProgress] = useState({ isProcessing: false });
  const { enqueueSnackbar } = useSnackbar();
  // useEffect(() => {
  //   if (isEmpty(props?.profile)) {
  //     push("/setting-account/info");
  //   }
  // }, []);
  const { host, pathname, protocol } = window.location;
  // console.log(`${protocol}//${host}/setting-account/active`);
  // returnUrl: `${protocol}//${host}${pathname}`,
  const handleOnCLick = async () => {
    try {
      setProgress({ isProcessing: true });
      const payload = {
        url: `${protocol}//${host}/setting-account/active`,
      };
      const res = await userApi.active(payload);
      // console.log(res);
      if (!!!res?.status) {
        enqueueSnackbar(res?.message?.en, { variant: 'success' });
      } else {
        enqueueSnackbar(res?.data?.message?.en, { variant: 'error' });
      }
    } catch (error) {
      console.log(error);
      enqueueSnackbar(error.message, { variant: 'error' });
    }
    setProgress({ isProcessing: false });
  };
  // console.log(url);

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
