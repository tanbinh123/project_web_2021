import axiosClient from './axiosClient';

const ratingApi = {
  get(id) {
    const url = `course/${id}/ratings/`;
    return axiosClient.get(url, { _limit: 100 });
  },
};

export default ratingApi;
