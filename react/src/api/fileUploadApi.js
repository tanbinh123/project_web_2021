import axiosClient from "./axiosClient";

const fileUploadApi = {
  upload(data) {
    const url = `/test/upload/multipartfile`;
    return axiosClient.post(url, data, {
      headers: {
        "content-type": "multipart/form-data",
      },
    });
  },
};

export default fileUploadApi;
