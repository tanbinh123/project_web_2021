import React from "react";
import "./index.css";
import { Route, Switch } from "react-router-dom";
import Login from "./features/Auth/components/Login";
import Register from "./features/Auth/components/Register";
import CourseFeatures from "./features/Course";
import ForgotPassword from "./features/ForgotPassword";
import Home from "./features/home";
import NotFound404 from "./features/NotFound";
import SimpleReactFileUpload from "./features/test/FormUpload/SimpleReactFileUpload";
import UploadOneFile from "./features/test/FormUpload/UploadOneFile";
App.propTypes = {};

function App(props) {
  return (
    <div>
      <Switch>
        <Route path="/auth/login" component={Login} exact />
        <Route path="/auth/register" component={Register} exact />
        <Route path="/course" component={CourseFeatures} exact />
        <Route path="/form-upload-one" component={UploadOneFile} exact />
        <Route
          path="/form-upload-test"
          component={SimpleReactFileUpload}
          exact
        />
        <Route path="/forgot-password" component={ForgotPassword} exact />
        <Route path="/" component={Home} exact />
        <Route path="/*" component={NotFound404} />
        <Route path="/auth/*" component={NotFound404} />
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
