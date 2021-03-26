import axiosClient from "./axiosClientFake";

const courseApi = {
  getAll() {
    const url = "/course/list";
    return axiosClient.get(url);
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
