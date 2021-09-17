import axiosClient from './axiosClient';

const courseApi = {
  getAll(params) {
    const url = '/course/list';
    return axiosClient.get(url, { params });
  },
  get(id) {
    const url = `/course/${id}`;
    return axiosClient.get(url);
  },
  check(data) {
    const url = `/payment/access`;
    return axiosClient.post(url, data);
  },
  courseAccess(data) {
    const url = `/course/access/fullcourse`;
    return axiosClient.post(url, data);
  },

  payment(data) {
    const url = `/payment`;
    return axiosClient.post(url, data);
  },
  categories(data) {
    const url = '/course/categories';
    return axiosClient.get(url, data);
  },
  testGetAll(params) {
    const url = '/courses';
    return axiosClient.get(url, { params });
  },
  getCoursesBought(params) {
    const url = '/course/course-bought';
    return axiosClient.get(url, { params });
  },

  postRating(courseId, data, idRating) {
    //const url = `/course/${courseId}/rating/idratingcu`;
    let url;
    if (idRating) {
      url = `/course/${courseId}/rating/${idRating}`;
    } else {
      url = `/course/${courseId}/rating`;
    }
    return axiosClient.post(url, data);
  },
  getRandomCourse(params) {
    const url = '/course/list/random';
    return axiosClient.get(url, { params });
  },
};

export default courseApi;
