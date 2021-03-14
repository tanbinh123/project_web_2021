import React from "react";
import PropTypes from "prop-types";
import Home from "./features/home";
import Header from "./components/header";
import { Container } from "@material-ui/core";
import TestFeatures from "./features/test";

App.propTypes = {};

function App(props) {
  return (
    <div>
      {/* <Header />
      <Home /> */}
      <TestFeatures />
    </div>
  );
}

export default App;
