import axiosClient from './axiosClient';

const homeApi = {
  getInfo() {
    const url = `/home/home`;
    return axiosClient.get(url);
  },
};

export default homeApi;
