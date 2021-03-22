import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import { useHistory } from "react-router";
import userApi from "../../api/userApi";
import StorageKeys from "../../constants/StorageKeys";

export const register = createAsyncThunk("/register", async (payload) => {
  //call api
  const data = await userApi.register(payload);
  // save to local storage
  localStorage.setItem("access_token", data.jwt);
  localStorage.setItem("user", JSON.stringify(data.user));
  return data.user;
});
export const login = createAsyncThunk("/login", async (payload) => {
  //call api
  const data = await userApi.login(payload);
  // save to local storage
  localStorage.setItem(StorageKeys.TOKEN, data.token);
  localStorage.setItem(StorageKeys.USER, JSON.stringify(data.user));
  console.log("sang data", data);
  return data.user;
});
const userSlice = createSlice({
  name: "user",
  initialState: {
    current: JSON.parse(localStorage.getItem(StorageKeys.USER)) || {},
    setting: {
      // sang: 2,
    },
  },
  reducers: {
    logout(state, action) {
      localStorage.removeItem(StorageKeys.TOKEN);
      localStorage.removeItem(StorageKeys.USER);
      state.current = {};
    },
  },
  extraReducers: {
    //users/register
    [register.fulfilled]: (state, action) => {
      state.current = action.payload;
    },
    [login.fulfilled]: (state, action) => {
      state.current = action.payload;
    },
  },
});
const { reducer, actions } = userSlice;
export const { logout } = actions;
export default reducer;
