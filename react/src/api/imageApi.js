import axiosClient from './axiosClient';

const imageApi = {
  getAll() {
    const url = `/api/admin/image/list`;
    return axiosClient.get(url);
  },
  getImageByTagName(tagname) {
    const url = `/api/admin/image/tagname?tagname=${tagname}`;
    return axiosClient.get(url);
  },
};

export default imageApi;
