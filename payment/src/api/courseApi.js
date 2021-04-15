import axiosClient from "./axiosClient";

const courseApi = {
  getAll() {
    const url = "/test/products";
    return axiosClient.get(url);
  }
};

export default courseApi;
