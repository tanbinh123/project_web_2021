import axiosClient from "./axiosClient";

const paymentApi = {
  getAll() {
    const url = `/payment/my/statement/list`;
    return axiosClient.get(url);
  },
};

export default paymentApi;
