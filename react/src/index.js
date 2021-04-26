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
          <App />
        </SnackbarProvider>
      </BrowserRouter>
    </RecoilRoot>
  </>,
  document.getElementById("root")
);
