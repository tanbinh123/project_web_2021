import { atom } from "recoil";
import StorageKeys from "../constants/StorageKeys";

export const DataUser = atom({
  key: "DataUser",
  default: JSON.parse(localStorage.getItem(StorageKeys.USER)) || {},
});
export const removeLocalStorage = () => {
  localStorage.removeItem(StorageKeys.TOKEN);
  localStorage.removeItem(StorageKeys.USER);
};
export const addLocalStorage = (data) => {
  localStorage.setItem(StorageKeys.TOKEN, data.token);
  localStorage.setItem(StorageKeys.USER, JSON.stringify(data.user));
};
