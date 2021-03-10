import React from "react";
import PropTypes from "prop-types";
import Home from "./features/home";
import Header from "./components/header";

App.propTypes = {};

function App(props) {
  return (
    <div>
      <Header />
      <Home />
    </div>
  );
}

export default App;
