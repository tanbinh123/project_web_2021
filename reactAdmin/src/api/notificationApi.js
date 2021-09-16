import axiosClient from "./axiosClient";

const notificationApi = {
  getAll(params) {
    const url = `/notification/admin/list`;
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
  updateNotification(notificationId,data) {
    // {content,subject,userId}
    const url = `/notification/update/${notificationId}`;
    return axiosClient.post(url, data);
  },
  deleteNotification(notificationId) {
    // {content,subject,userId}
    const url = `/notification/delete/${notificationId}`;
    return axiosClient.delete(url);
  },
};

export default notificationApi;
