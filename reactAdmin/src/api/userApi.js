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
    const url = `/forgotpassword/email`;
    return axiosClient.post(url, data);
  },
  forgotPasswordCode(data) {
    const url = `/forgotpassword/code`;
    return axiosClient.post(url, data);
  },
  forgotPasswordPass(data) {
    const url = `/forgotpassword/change`;
    return axiosClient.post(url, data);
  },
  active(data) {
    const url = `/active`;
    return axiosClient.post(url, data);
  },
  actived(data) {
    const url = `/active/confirm`;
    return axiosClient.post(url, data);
  },
  profile() {
    const url = `/profile`;
    return axiosClient.get(url);
  },
  getListAccount(params) {
    const url = `/api/admin/user/list`;
    return axiosClient.get(url, { params });
  },
  adminGetOneUser(id) {
    const url = `/api/admin/user/${id}`;
    return axiosClient.get(url);
  },
};

export default userApi;
