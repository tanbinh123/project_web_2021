import Button from "@material-ui/core/Button";
import React, { useState } from "react";
import DrawerTest from "./DrawerTest";

export default function TestFeatures() {
  const [state, setState] = React.useState({
    top: false,
    left: false,
    bottom: false,
    right: false,
  });
  const [openDrawer, setOpenDrawer] = useState({});

  const toggleDrawer = (anchor, isOpen) => (event) => {
    if (
      event.type === "keydown" &&
      (event.key === "Tab" || event.key === "Shift")
    ) {
      return;
    }

    setState({ ...state, [anchor]: isOpen });
    setOpenDrawer({ [anchor]: isOpen });
  };

  return (
    <div>
      <Button onClick={toggleDrawer("left", true)}>left</Button>
      {console.log(openDrawer["left"])}
      {openDrawer["left"] && <DrawerTest DrawerState={openDrawer} />}
      {console.log(openDrawer["left"])}
    </div>
  );
}
