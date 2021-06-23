import axiosClient from "./axiosClient";

const categoriesApi = {
  getAll() {
    const url = `/course/categories`;
    return axiosClient.get(url);
  },
  add(data) {
    //{name:""}
    const url = `/category/new`;
    return axiosClient.post(url, data);
  },
  update(idCategory, data) {
    //{name:""}
    const url = `/category/${idCategory}`;
    return axiosClient.post(url, data);
  },
};

export default categoriesApi;
