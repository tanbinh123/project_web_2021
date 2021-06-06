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
  categories(data) {
    const url = "/course/categories";
    return axiosClient.get(url, data);
  },
  
 
};

export default courseApi;
