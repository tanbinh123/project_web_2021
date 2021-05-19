import "core-js";
import { SnackbarProvider } from "notistack";
import React from "react";
import "react-app-polyfill/ie11"; // For IE 11 support
import "react-app-polyfill/stable";
import ReactDOM from "react-dom";
import { Provider } from "react-redux";
import { BrowserRouter } from "react-router-dom";
import { RecoilRoot } from "recoil";
import App2 from "./App2";
import { icons } from "./assets/icons";
import "./polyfill";
import * as serviceWorker from "./serviceWorker";
import store from "./store";

React.icons = icons;

ReactDOM.render(
  <RecoilRoot>
    <BrowserRouter>
      <SnackbarProvider maxSnack={3}>
        <Provider store={store}>
          <App2 />
        </Provider>
      </SnackbarProvider>
    </BrowserRouter>
  </RecoilRoot>,
  document.getElementById("root")
);
serviceWorker.unregister();
