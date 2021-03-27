import axiosClient from "./axiosClient";

const courseApi = {
  getAll(params) {
    const url = "/course/list";
    return axiosClient.get(url,{params});
  },
  get(id) {
    const url = `/course/${id}`;
    return axiosClient.get(url);
  },
  testGetAll(params) {
    const url = "/courses";
    return axiosClient.get(url, { params });
  },
};

export default courseApi;
