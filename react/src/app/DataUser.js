import { atom } from "recoil";
import StorageKeys from "../constants/StorageKeys";

export const DataUser = atom({
  key: "DataUser",
  default: {
    user: JSON.parse(localStorage.getItem(StorageKeys.USER)) || {},
    profile: JSON.parse(localStorage.getItem(StorageKeys.PROFILE)) || {},
  },
});
export const removeLocalStorage = () => {
  localStorage.removeItem(StorageKeys.TOKEN);
  localStorage.removeItem(StorageKeys.USER);
  localStorage.removeItem(StorageKeys.PROFILE);
  localStorage.clear();
};
export const addLocalStorage = (data, profile) => {
  localStorage.setItem(StorageKeys.TOKEN, data.token);
  localStorage.setItem(StorageKeys.USER, JSON.stringify(data.user));
  localStorage.setItem(StorageKeys.PROFILE, JSON.stringify(profile));
};
