import React from "react";
import { Route, Switch, useRouteMatch } from "react-router-dom";
import CourseDetailRouter from "./Pages/CourceDetail/CourseDetailRouter";
import ListCourse from "./Pages/ListCourse/ListCourse";

CourseFeatures.propTypes = {};
function CourseFeatures(props) {
  const { path } = useRouteMatch();
  // console.log(path);
  return (
    <>
      <Switch>
        <Route path={`${path}`} component={ListCourse} exact />
        <Route path={`${path}/:idCourse`} component={CourseDetailRouter} />
      </Switch>
    </>
  );
}

export default CourseFeatures;
