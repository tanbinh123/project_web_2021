import axios from "axios";
import { removeLocalStorage } from "../app/DataUser";

const axiosClient = axios.create({
  baseURL: "http://localhost:25001/",
  //baseURL: "http://192.168.0.222:25001/",
  // baseURL: "http://192.168.0.111:25001/",
  // baseURL: "http://192.168.0.222:80/",
  //  baseURL: "http://192.168.0.111:80/",
  // headers: {
  //   Authorization: `Bearer ${localStorage.getItem("access_token")}`,
  //   // "Content-Type": "applicatinon/json",
  // },
});
//Interceptors
// Add a request interceptor
axiosClient.interceptors.request.use(
  function (config) {
    // console.log(config);
    // Do something before request is

    config.headers.Authorization = `Bearer ${localStorage.getItem(
      "access_token"
    )}`;
    return config;
  },
  function (error) {
    // Do something with request error
    console.log("error1", { error });
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
    if (error.response && error.response.status === 401) {
      console.log("token expire");
      window.location = "/auth/login";
      removeLocalStorage();
    }

    if (error && error.response) {
      const response = error.response.status;
      return error.response;
    }
    return Promise.reject(error);
  }
);
export default axiosClient;
