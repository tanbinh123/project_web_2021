import Button from "@material-ui/core/Button";
import React, { useState } from "react";
import DrawerTest from "./DrawerTest";

export default function TestFeatures() {
  const [dataDrawer, setDataDrawer] = useState({
    anchor: "",
    isOpen: false,
  });

  const toggleDrawer = (anchor, isOpen) => (event) => {
    if (
      event.type === "keydown" &&
      (event.key === "Tab" || event.key === "Shift")
    ) {
      return;
    }

    setDataDrawer({ ...dataDrawer, anchor: anchor, isOpen: isOpen });
  };
  function handleCloseDrawer(anchor, isOpen) {
    setDataDrawer({ ...dataDrawer, anchor: anchor, isOpen: isOpen });
  }

  return (
    <div>
      <Button onClick={toggleDrawer("left", true)}>top</Button>
      {dataDrawer.isOpen && (
        <DrawerTest dataDrawer={dataDrawer} closeDrawer={handleCloseDrawer} />
      )}
    </div>
  );
}
