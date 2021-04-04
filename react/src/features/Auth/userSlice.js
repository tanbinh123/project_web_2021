import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import userApi from "../../api/userApi";
import StorageKeys from "../../constants/StorageKeys";

export const register = createAsyncThunk("/register", async (payload) => {
  //call api
  const data = await userApi.register(payload);
  // save to local storage
  console.log(data);
  if (!!!data?.status) {
    localStorage.setItem(StorageKeys.TOKEN, data.token);
    localStorage.setItem(StorageKeys.USER, JSON.stringify(data.user));
  }
  return data.user;
});
export const login = createAsyncThunk("/login", async (payload) => {
  //call api
  const data = await userApi.login(payload);
  console.log(!!!data?.status);
  if (!!!data?.status) {
    localStorage.setItem(StorageKeys.TOKEN, data.token);
    localStorage.setItem(StorageKeys.USER, JSON.stringify(data.user));
  }
  // save to local storage

  return data;
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
      state.current = action.payload.user;
    },
  },
});
const { reducer, actions } = userSlice;
export const { logout } = actions;
export default reducer;
