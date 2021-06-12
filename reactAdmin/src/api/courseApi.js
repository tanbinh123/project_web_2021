import axiosClient from "./axiosClient";

const courseApi = {
  getAll(params) {
    const url = "/course/list";
    return axiosClient.get(url, { params });
  },
  get(id) {
    const url = `/api/admin/course/${id}`;
    return axiosClient.get(url);
  },  
  uploadNewPoster(idCourse, data) {
    const url = `/api/admin/course/${idCourse}/img-poster`;
    return axiosClient.post(url, data,{
      headers: {
        "content-type": "multipart/form-data",
      },
    });
  }, 
  uploadNewVideoDemo(idCourse, data) {
    const url = `/api/admin/course/${idCourse}/video-demo`;
    return axiosClient.post(url, data,{
      headers: {
        "content-type": "multipart/form-data",
      },
    });
  }, 
  post(idCourse, data) {
    const url = `/api/admin/course/${idCourse}`;
    return axiosClient.post(url, data);
  }, 
  
  blockCourse(idCourse) {
    const url = `/api/admin/course/${idCourse}/block`;
    return axiosClient.post(url);
  },  
  postNewCourse( data) {
    const url = `/api/admin/course/new`;
    return axiosClient.post(url, data);
  }, 
  postLearnings(idCourse, data) {
    const url = `/api/admin/course/${idCourse}/learnings`;
    return axiosClient.post(url, data);
  }, 
  postPart(idCourse, data) {
    const url = `/api/admin/course/${idCourse}/part`;
    return axiosClient.post(url, data);
  },  
  updatePart(idCourse, idPart, data) {
    const url = `/api/admin/course/${idCourse}/${idPart}`;
    return axiosClient.post(url, data);
  },  
  deletePart(idCourse, idPart) {
    const url = `/api/admin/course/${idCourse}/${idPart}`;
    return axiosClient.delete(url);
  }, 
  categories(data) {
    const url = "/course/categories";
    return axiosClient.get(url, data);
  },

  postLesson(idCourse, idPart, data) {
    const url = `/api/admin/course/${idCourse}/${idPart}/lesson`;
    return axiosClient.post(url, data,{
      headers: {
        "content-type": "multipart/form-data",
      },
    });
  }, 
  updateLesson(idCourse, idPart, idLesson, data) {
    const url = `/api/admin/course/${idCourse}/${idPart}/${idLesson}`;
    return axiosClient.post(url, data,{
      headers: {
        "content-type": "multipart/form-data",
      },
    });
  }, 
  deleteLesson(idCourse, idPart, idLesson) {
    const url = `/api/admin/course/${idCourse}/${idPart}/${idLesson}`;
    return axiosClient.delete(url);
  }, 
 
};

export default courseApi;
