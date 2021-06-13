import { atom } from "recoil";
import { isEmpty } from "../components/tools/Tools";
import StorageKeys from "../constants/StorageKeys";

export const DataUser = atom({
  key: "DataUser",
  default: {
    user: JSON.parse(localStorage.getItem(StorageKeys.USER)) || {},
    profile: JSON.parse(localStorage.getItem(StorageKeys.PROFILE)) || {},
    courses: JSON.parse(localStorage.getItem(StorageKeys.COURSES)) || [],
    token: localStorage.getItem(StorageKeys.TOKEN) || "",
  },
});
export const removeLocalStorage = () => {
  // localStorage.removeItem(StorageKeys.TOKEN);
  // localStorage.removeItem(StorageKeys.USER);
  // localStorage.removeItem(StorageKeys.PROFILE);
  // localStorage.removeItem(StorageKeys.COURSES);
  localStorage.clear();
};
export const addLocalStorage = (data) => {
  if (!isEmpty(data.token)) {
    localStorage.setItem(StorageKeys.TOKEN, data.token);
    localStorage.setItem(StorageKeys.USER, JSON.stringify(data.user));
    localStorage.setItem(StorageKeys.COURSES, JSON.stringify(data.courses));
    localStorage.setItem(StorageKeys.PROFILE, JSON.stringify(data.profile));
  }
};
export const emptyUser = {
  user: {},
  profile: {},
  courses: [],
  token: "",
};
