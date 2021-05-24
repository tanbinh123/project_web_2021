import React from "react";
import PropTypes from "prop-types";
import { Route, Switch, useRouteMatch } from "react-router";
import HomeAdmin from "./features/Home/HomeAdmin";
import NotFound404 from "../features/NotFound";
import PieChart from "../chart/PieChart";
import Charts from "../chart/Charts";

function AdminRouter(props) {
  const { path } = useRouteMatch();
  return (
    <div>
      <Switch>
        <Route path={`${path}/home`} component={HomeAdmin} exact />
        <Route path={`${path}/chart`} component={PieChart} />
        <Route path={`${path}/charts`} component={Charts} />
        <Route path={`${path}/*`} component={NotFound404} />

      </Switch>
    </div>
  );
}

export default AdminRouter;
