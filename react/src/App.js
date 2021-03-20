import { Box } from "@material-ui/core";
import React from "react";
import { Route, Switch } from "react-router-dom";
import Login from "./features/Auth/components/Login";
import Register from "./features/Auth/components/Register";
import Home from "./features/home";
import PopoverPopupState from "./features/test/Popover";

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
      {/* <Box style={{ textAlign: "center" }}>
        {" "}
        <PopoverPopupState title="Open" />
      </Box> */}
    </div>
  );
}

export default App;
