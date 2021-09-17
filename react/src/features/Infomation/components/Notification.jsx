import { Grid } from '@material-ui/core';
import { Pagination } from '@material-ui/lab';
import { useSnackbar } from 'notistack';
import { parse, stringify } from 'query-string';
import React, { useMemo, useState } from 'react';
import { useHistory, useLocation } from 'react-router';
import notificationApi from '../../../api/notificationApi';
import userApi from '../../../api/userApi';
import { convertVND, DateToString } from '../../../components/tools/Tools';
import '././css/Actived.css';

function Notification(props) {
  // const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { enqueueSnackbar } = useSnackbar();
  const [pagination, setPagination] = useState({
    _page: 1,
    _limit: 5,
    _totalRows: 10,
  });
  const [dataNotification, setDatNotification] = useState([]);
  const location = useLocation();
  const history = useHistory();

  React.useEffect(() => {
    window.scrollTo(0, 0);
    getDataNotification();
    return () => {
      setDatNotification([]);
      setPagination({});
    };
  }, [location.search]);
  const queryParams = useMemo(() => {
    const params = parse(location.search);
    return {
      ...params,
      _page: Number.parseInt(params._page) || 1,
      _limit: Number.parseInt(params._limit) || 5,
    };
  }, [location.search]);
  const getDataNotification = async () => {
    const res = await notificationApi.getAll(queryParams);
    console.log(res);
    if (!!!res.status) {
      const { data, pagination } = res;
      setDatNotification(data);
      setPagination(pagination);
      // console.log(data);
      // console.log(pagination);
    } else {
      enqueueSnackbar(res?.data?.message?.en, { variant: 'error' });
    }
  };
  function handlePageChange(e, page) {
    // setFilters((prevFilters) => ({
    //   ...prevFilters,
    //   _page: page,
    // }));
    const filters = {
      ...queryParams,
      _page: page,
    };
    history.push({
      pathname: history.location.pathname,
      search: stringify(filters),
    });
  }
  return (
    <Grid container className="history-payment">
      <Grid
        item
        xl={12}
        lg={12}
        md={12}
        sm={12}
        xs={12}
        className="backround__header"
      >
        <ul>
          <li>
            <span>Thông báo</span>
          </li>
          <li>
            <span>Xem tất cả thông báo của bạn</span>
          </li>
        </ul>
      </Grid>
      <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
        <div className="form">
          <div className="container-table">
            <div className="custom-table">
              <div className="row header blue">
                <div className="cell">Người gửi</div>
                <div className="cell">Tiêu đề</div>
                <div className="cell">Nội dung</div>
                <div className="cell">Ngày gửi</div>
              </div>

              {Array.from(dataNotification).map((item, idx) => (
                <div className="row" key={idx}>
                  <div className="cell" data-title="Người gửi">
                    {item?.appUserSent?.userName}
                  </div>
                  <div className="cell" data-title="Tiêu đề">
                    {item.name}
                  </div>
                  <div className="cell" data-title="Nội dung">
                    {item?.content}
                  </div>
                  <div className="cell" data-title="Ngày gửi">
                    {item?.updateAt}
                  </div>
                </div>
              ))}
            </div>
          </div>
          <div className="last-row-form">
            <Pagination
              color="primary"
              count={Math.ceil(pagination._totalRows / pagination._limit)}
              page={pagination._page || 1}
              onChange={handlePageChange}
            />
          </div>
        </div>
      </Grid>
    </Grid>
  );
}
export default Notification;
