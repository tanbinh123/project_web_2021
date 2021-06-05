import { atom } from "recoil";
import StorageKeys from "src/constants/StorageKeys";

export const DataUser = atom({
  key: "DataUser",
  default: {
    user: JSON.parse(localStorage.getItem(StorageKeys.USER)) || {},
    profile: JSON.parse(localStorage.getItem(StorageKeys.PROFILE)) || {},
    courses: JSON.parse(localStorage.getItem(StorageKeys.COURSES)) || {},
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
export const addLocalStorage = (data, profile) => {
  if (data) {
    localStorage.setItem(StorageKeys.TOKEN, data.token);
    localStorage.setItem(StorageKeys.USER, JSON.stringify(data.user));
    /* localStorage.setItem(StorageKeys.COURSES, JSON.stringify(data.courses)); */
  }
  if (profile) {
    localStorage.setItem(StorageKeys.PROFILE, JSON.stringify(profile));
  }
};
