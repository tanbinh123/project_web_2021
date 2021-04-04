import axiosClient from "./axiosClientFake";

const courseApiFake = {
  getAll() {
    const url = "/courses";
    return axiosClient.get(url);
  },
  get(id) {
    const url = `/courses/${id}`;
    return axiosClient.get(url);
  },
  testGetAll(params) {
    const url = "/courses";
    return axiosClient.get(url, { params });
  },
  search(params) {
    const url = "/courses";
    return axiosClient.get(url, { params });
  },
};

export default courseApiFake;
