import React, { Suspense } from "react";
import { HashRouter, Route, Switch } from "react-router-dom";
import { TheLayout } from "./containers";
import Login from "./views/pages/login/Login";
import Page404 from "./views/pages/page404/Page404";
import Page500 from "./views/pages/page500/Page500";
import Register from "./views/pages/register/Register";
import "./scss/style.scss";
import "./index.css";
const loading = (
  <div className="pt-3 text-center">
    <div className="sk-spinner sk-spinner-pulse"></div>
  </div>
);
function App2(props) {
  return (
    <div className="root">
      <HashRouter>
        <Suspense fallback={loading}>
          <Switch>
            <Route
              exact
              path="/login"
              name="Login Page"
              render={(props) => <Login {...props} />}
            />
            <Route
              exact
              path="/register"
              name="Register Page"
              render={(props) => <Register {...props} />}
            />
            <Route
              exact
              path="/404"
              name="Page 404"
              render={(props) => <Page404 {...props} />}
            />
            <Route
              exact
              path="/500"
              name="Page 500"
              render={(props) => <Page500 {...props} />}
            />
            <Route
              path="/"
              name="Home"
              render={(props) => <TheLayout {...props} />}
            />
          </Switch>
        </Suspense>
      </HashRouter>
    </div>
  );
}

export default App2;
