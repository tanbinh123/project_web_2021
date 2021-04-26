import axios from "axios";

const axiosClient = axios.create({
  baseURL: "http://192.168.0.222:25001/",
  // baseURL: "http://192.168.0.111:25001/",
  // baseURL: "http://192.168.0.222:80/",
  //  baseURL: "http://192.168.0.111:80/",
  headers: {
    Authorization: `Bearer ${localStorage.getItem("access_token")}`,
    // "Content-Type": "applicatinon/json",
  },
});
//Interceptors
// Add a request interceptor
axiosClient.interceptors.request.use(
  function (config) {
    // console.log(config);
    // Do something before request is sent
    return config;
  },
  function (error) {
    // Do something with request error
    return Promise.reject(error);
  }
);

// Add a response interceptor
axiosClient.interceptors.response.use(
  function (response) {
    if (response && response.data) {
      return response.data;
    }
    return response;
  },
  function (error) {
    if (error && error.response) {
      return error.response;
    }
    return Promise.reject(error);
  }
);
export default axiosClient;
