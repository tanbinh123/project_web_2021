import axiosClient from "./axiosClient";

const dashboardApi = {
  get10Days() {
    const url = `http://api/admin/revenue/10day`;
    return axiosClient.get(url);
  },
  get10Year() {
    const url = `http://api/admin/revenue/10year`;
    return axiosClient.get(url);
  },
  get12Months() {
    const url = `http://api/admin/revenue/10month`;
    return axiosClient.get(url);
  },
};

export default dashboardApi;
