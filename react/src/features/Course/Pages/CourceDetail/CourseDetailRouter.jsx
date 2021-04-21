import React from "react";
import { Route, Switch, useParams, useRouteMatch } from "react-router-dom";
import CourseDetail from "./CourseDetail";
import Lecture from "./Lecture/Lecture";

CourseDetailRouter.propTypes = {};
function CourseDetailRouter(props) {
  const { path, url } = useRouteMatch();
  const { idCourse } = useParams();
  return (
    <>
      <Switch>
        <Route path={`${path}`} component={CourseDetail} exact />
        <Route path={`${url}/lecture/:idLecture`} component={Lecture} exact />
      </Switch>
    </>
  );
}

export default CourseDetailRouter;
