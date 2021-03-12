import { Drawer, IconButton } from "@material-ui/core";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";
import { makeStyles } from "@material-ui/core/styles";
import InboxIcon from "@material-ui/icons/MoveToInbox";
import React, { useState } from "react";
import { colorBlack1, colorWhite1, colorWhite2 } from "../color/color";

import MenuIcon from "@material-ui/icons/Menu";
const useStyles = makeStyles((theme) => ({
  listDrawer: {
    width: 200,
    backgroundColor: colorWhite2,
  },
  paper: {
    background: colorWhite1,
  },
}));
CustomsDrawer.propTypes = {};

function CustomsDrawer(props) {
  const classes = useStyles();
  const [isDrawer, setIsDrawer] = useState({
    left: false,
  });
  const toggleDrawer = (anchor, open) => (event) => {
    if (
      event.type === "keydown" &&
      (event.key === "Tab" || event.key === "Shift")
    ) {
      return;
    }

    setIsDrawer({ ...isDrawer, [anchor]: open });
  };
  const list = (anchor) => (
    <div className="backgroundList" style={{ backgroundColor: colorBlack1 }}>
      <div
        className={classes.listDrawer}
        role="presentation"
        onClick={toggleDrawer(anchor, false)}
        onKeyDown={toggleDrawer(anchor, false)}
      >
        <List>
          <ListItem>
            <ListItemIcon>
              <InboxIcon />
            </ListItemIcon>
            <ListItemText primary="Thông Báo" />
          </ListItem>
        </List>
      </div>
    </div>
  );
  return (
    <>
      <IconButton
        aria-label="show more"
        aria-haspopup="true"
        onClick={toggleDrawer("left", true)}
        color="inherit"
      >
        <MenuIcon />
      </IconButton>
      <Drawer
        classes={{ paper: classes.paper }}
        anchor="left"
        open={isDrawer["left"]}
        onClose={toggleDrawer("left", false)}
      >
        {list("left")}
      </Drawer>
    </>
  );
}

export default CustomsDrawer;
