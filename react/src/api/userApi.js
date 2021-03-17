import axiosClient from "./axiosClient";

const userApi = {
  register(data) {
    const url = `/signup`;
    return axiosClient.post(url, data);
  },
  login(data) {
    const url = `/login`;
    return axiosClient.post(url, data);
  },
  getDataUser() {
    const url = `/resource/user`;
    return axiosClient.get(url);
  },
};

export default userApi;
