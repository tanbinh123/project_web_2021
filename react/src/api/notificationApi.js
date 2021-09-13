import axiosClient from './axiosClient';

const notificationApi = {
  getAll() {
    const url = `/notification/list`;
    return axiosClient.get(url);
  },
};

export default notificationApi;
