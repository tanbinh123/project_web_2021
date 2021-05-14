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
  check(data) {
    const url = `/payment/access`;
    return axiosClient.post(url,data);
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
