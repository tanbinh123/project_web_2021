import axiosClient from "./axiosClient";

const ratingApi = {
  get(id) {
    const url = `course/${id}/ratings/`;
    return axiosClient.get(url);
  },
};

export default ratingApi;
