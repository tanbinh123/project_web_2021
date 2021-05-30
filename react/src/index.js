import DateFnsUtils from "@date-io/date-fns";
import { MuiPickersUtilsProvider } from "@material-ui/pickers";
import { SnackbarProvider } from "notistack";
import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter } from "react-router-dom";
import { RecoilRoot } from "recoil";
import App from "./App";
import "./index.css";

ReactDOM.render(
  <>
    <RecoilRoot>
      <BrowserRouter>
        <SnackbarProvider maxSnack={3}>
          <MuiPickersUtilsProvider utils={DateFnsUtils}>
            <App />
          </MuiPickersUtilsProvider>
        </SnackbarProvider>
      </BrowserRouter>
    </RecoilRoot>
  </>,
  document.getElementById("root")
);
