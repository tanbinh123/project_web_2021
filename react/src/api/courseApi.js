import axiosClient from "./axiosClient";

const courseApi = {
  getAll() {
    const url = "/course/list";
    return axiosClient.get(url);
  },
  get(id) {
    const url = `/course/${id}`;
    return axiosClient.get(url);
  },
};

export default courseApi;
