import React from "react";
import PropTypes from "prop-types";
import { useDispatch, useSelector } from "react-redux";
import { createStore } from "redux";
import reducer, { tang } from "../Auth/userSlice";

GetDataRedux.propTypes = {};

function GetDataRedux(props) {
  //   const dataLogin = useSelector((state) => state.user.current);
  //   const dataLogin1 = useSelector((state) => state.user.setting);
  //   console.log(dataLogin);
  //   const dispatch = useDispatch();
  //   const handleClick = () => {
  //     dispatch(tang(3));
  //   };
  return <div>{/* <button onClick={handleClick}>click me</button> */}</div>;
}

export default GetDataRedux;
