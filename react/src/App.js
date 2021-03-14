import React from "react";
import Header from "./components/header";
import Home from "./features/home";
import { Route, Switch } from "react-router-dom";
import LoginFeatures from "./features/login";

App.propTypes = {};

function App(props) {
  return (
    <div>
      <Switch>
        <Route path="/login" component={LoginFeatures} exact />
        <Route path="/" component={Home} />
      </Switch>

      {/* test zone */}
      {/* <TestFeatures /> */}
    </div>
  );
}

export default App;
