import axiosClient from './axiosClient';

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
  postProfile(data) {
    const url = `/profile`;
    //axiosClient.
    return axiosClient.post(url, data, {
      headers: {
        'content-type': 'multipart/form-data',
      },
    });
  },
  changePassword(data) {
    const url = `/profile/changepassword`;
    //axiosClient.
    return axiosClient.post(url, data);
  },
  checkEmail(data) {
    const url = `/home/email`;
    return axiosClient.post(url, data);
  },
  checkUsername(data) {
    const url = `/home/username`;
    return axiosClient.post(url, data);
  },
  loginByEmail(data) {
    const url = `login/email`;
    return axiosClient.post(url, data);
  },
  loginWithFirebase(data) {
    const url = `api/admin/firebase/verify`;
    return axiosClient.post(url, data);
  },
};

export default userApi;
