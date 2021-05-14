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
  categories(data) {
    const url = '/course/categories';
    return axiosClient.get(url, data);
  },
  testGetAll(params) {
    const url = "/courses";
    return axiosClient.get(url, { params });
  },
};

export default courseApi;
