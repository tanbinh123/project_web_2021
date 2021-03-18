import React from "react";
import PropTypes from "prop-types";
import { useSelector } from "react-redux";
import { createStore } from "redux";
import reducer from "../Auth/userSlice";

GetDataRedux.propTypes = {};

function GetDataRedux(props) {
  const dataLogin = useSelector((state) => state.user.current);
  console.log(dataLogin);
  const tmp = createStore(reducer);
  tmp.di;
  return <div></div>;
}

export default GetDataRedux;
