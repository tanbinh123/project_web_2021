import axiosClient from "./axiosClient";

const fileUploadApi = {
  upload(data) {
    const url = `/test/upload`;
    return axiosClient.post(url, data);
  },
};

export default fileUploadApi;
