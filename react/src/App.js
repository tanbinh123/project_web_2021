import React from "react";
import { Route, Switch } from "react-router-dom";
import Login from "./features/Auth/components/Login";
import Register from "./features/Auth/components/Register";
import Home from "./features/home";
import GetDataRedux from "./features/test/GetDataRedux";

App.propTypes = {};

function App(props) {
  return (
    <div>
      <Switch>
        <Route path="/auth/login" component={Login} />
        <Route path="/auth/register" component={Register} />
        <Route path="/" component={Home} />
      </Switch>

      {/* test zone */}
      {/* <TestFeatures /> */}
      <GetDataRedux />
    </div>
  );
}

export default App;
