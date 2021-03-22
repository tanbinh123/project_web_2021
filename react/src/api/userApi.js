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
  forgotPassword(data) {
    const url = `/forgetpassword/email`;
    return axiosClient.post(url, data);
  },
  forgotPasswordCode(data) {
    const url = `/forgetpassword/code`;
    return axiosClient.post(url, data);
  },
  forgotPasswordPass(data) {
    const url = `/forgetpassword/change`;
    return axiosClient.post(url, data);
  },
};

export default userApi;
