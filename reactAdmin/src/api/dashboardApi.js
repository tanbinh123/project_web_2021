import axiosClient from "./axiosClient";

const dashboardApi = {
  get10Days() {
    const url = `/api/admin/revenue/10day`;
    return axiosClient.get(url);
  },
  get10Year() {
    const url = `/api/admin/revenue/10year`;
    return axiosClient.get(url);
  },
  get12Months() {
    const url = `/api/admin/revenue/12month`;
    return axiosClient.get(url);
  },
};

export default dashboardApi;
