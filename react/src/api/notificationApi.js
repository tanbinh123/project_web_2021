import axiosClient from './axiosClient';

const notificationApi = {
  getAll(params) {
    const url = `/notification/list`;
    return axiosClient.get(url, { params });
  },
};

export default notificationApi;
