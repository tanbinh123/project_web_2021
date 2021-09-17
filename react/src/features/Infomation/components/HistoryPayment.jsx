import { Grid } from '@material-ui/core';
import { Pagination } from '@material-ui/lab';
import { useSnackbar } from 'notistack';
import { parse, stringify } from 'query-string';
import React, { useMemo, useState } from 'react';
import { useHistory, useLocation } from 'react-router';
import userApi from '../../../api/userApi';
import { convertVND, DateToString } from '../../../components/tools/Tools';
import '././css/Actived.css';

function HistoryPayment(props) {
  // const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { enqueueSnackbar } = useSnackbar();
  const [pagination, setPagination] = useState({
    _page: 1,
    _limit: 5,
    _totalRows: 10,
  });
  const [dataPayment, setDataPayment] = useState([]);
  const location = useLocation();
  const history = useHistory();

  React.useEffect(() => {
    getDataHistoryPayment();
    return () => {
      setDataPayment([]);
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
  const getDataHistoryPayment = async () => {
    const res = await userApi.getPayment(queryParams);
    if (!!!res.status) {
      const { data, pagination } = res;
      setDataPayment(data);
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
            <span>Lịch sử thanh toán</span>
          </li>
          <li>
            <span>Xem lại lịch sử thanh toán của bạn</span>
          </li>
        </ul>
      </Grid>
      <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
        <div className="form">
          <div className="container-table">
            <div className="custom-table">
              <div className="row header blue">
                <div className="cell">ID</div>
                <div className="cell">Tổng tiền</div>
                <div className="cell">Khóa học đã mua</div>
                <div className="cell">Ngày mua</div>
              </div>

              {Array.from(dataPayment).map((item, idx) => (
                <div className="row" key={idx}>
                  <div className="cell" data-title="ID">
                    {item.id}
                  </div>
                  <div className="cell" data-title="Tổng tiền">
                    {convertVND(item?.payment?.amount / 100)}
                  </div>
                  <div className="cell" data-title="Khóa học đã mua">
                    <a
                      href={item?.payment?.urReturn}
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      {item?.coursePojo?.title}
                    </a>
                  </div>
                  <div className="cell" data-title="Ngày mua">
                    {DateToString(item?.createTime)}
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
export default HistoryPayment;
