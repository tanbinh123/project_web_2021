import axiosClient from "./axiosClient";

const notificationApi = {
  getAll({ params }) {
    const url = `/notification/list`;
    return axiosClient.get(url, { params });
  },
  new(data) {
    // {content,subject}
    const url = `/notification/new`;
    return axiosClient.post(url, data);
  },
  newToUser(data) {
    // {content,subject,userId}
    const url = `/notification/one/new`;
    return axiosClient.post(url, data);
  },
};

export default notificationApi;
