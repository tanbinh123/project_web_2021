import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import userApi from "../../api/userApi";

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
  localStorage.setItem("access_token", data.token);
  localStorage.setItem("account", JSON.stringify(data.user));
  return data.user;
});
const userSlice = createSlice({
  name: "user",
  initialState: {
    current: {},
    setting: {},
  },
  reducers: {},
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
const { reducer } = userSlice;
export default reducer;
