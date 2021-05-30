import React, { useEffect, useState } from "react";
import { useRouteMatch } from "react-router";
import SockJS from "sockjs-client";
import Stomp from "webstomp-client";

const SOCKET_URL = "http://localhost:25001/notifications";
function Socket(props) {
  const { path } = useRouteMatch();
  const [message, setMessage] = useState("You server message here.");
  console.log("socket", message);

  useEffect(() => {
    var connected = false;
    var socket = "";
    var stompClient = "";
    const send = () => {
      let send_message = "hello !";
      if (stompClient && stompClient.connected) {
        const msg = { name: send_message };
        stompClient.send("/swns/start", JSON.stringify(msg), {});
      }
    };
    const connect = () => {
      socket = new SockJS(SOCKET_URL);
      stompClient = Stomp.over(socket);
      stompClient.connect(
        {},
        (frame) => {
          connected = true;
          stompClient.subscribe("/user/notification/item", (tick) => {
            console.log(tick);
          });

          send();
        },
        (error) => {
          console.log(error);
          connected = false;
        }
      );
    };
    const disconnect = () => {
      if (stompClient) {
        stompClient.disconnect();
      }
      connected = false;
    };

    connect();
    send();
  }, []);

  return <div></div>;
}

export default Socket;
