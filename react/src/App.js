import React from 'react';
import { Route, Switch } from 'react-router-dom';
import AdminRouter from './admin/AdminRouter';
import './cssreset.css';
import Login from './features/Auth/components/Login';
import Register from './features/Auth/components/Register';
import CourseFeatures from './features/Course';
import ForgotPassword from './features/ForgotPassword';
import Home from './features/home';
import Actived from './features/Infomation/components/Actived';
import InfomationFeature from './features/Infomation/InfomationFeature';
import NotFound404 from './features/NotFound';
import CssColor from './features/test/CssColor';
import UploadOneFile from './features/test/FormUpload/UploadOneFile';
import SetValue from './features/test/SetValue';
import TestSearch from './features/test/TestSearch';
import './index.css';
import './assets/css/main.css';
import Footer from './components/Footer/Footer';

App.propTypes = {};

function App(props) {
  return (
    <div>
      {/* <Socket/> */}

      <Switch>
        <Route path="/auth/login" component={Login} exact />
        <Route path="/auth/register" component={Register} exact />
        <Route path="/course" component={CourseFeatures} />
        <Route path="/setting-account/active/:code" component={Actived} exact />
        <Route path="/setting-account" component={InfomationFeature} />
        <Route path="/form-upload-one" component={UploadOneFile} exact />
        {/* <Route
          path="/form-upload-test"
          component={SimpleReactFileUpload}
          exact
        /> */}
        <Route path="/forgot-password" component={ForgotPassword} exact />
        <Route path="/" component={Home} exact />
        <Route path="/testsearch" component={TestSearch} exact />
        <Route path="/testcolor" component={CssColor} exact />
        <Route path="/setvalue" component={SetValue} exact />
        <Route path="/admin" component={AdminRouter} />

        <Route path="/*" component={NotFound404} />
        <Route path="/auth/*" component={NotFound404} />
      </Switch>

      {/* test zone */}
      {/* <Box style={{ textAlign: "center" }}>
        {" "}
        <PopoverPopupState title="Open" />
      </Box> */}
      <Footer />
    </div>
  );
}

export default App;
