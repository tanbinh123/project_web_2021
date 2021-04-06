import Divider from "@material-ui/core/Divider";
import Drawer from "@material-ui/core/Drawer";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";
import { makeStyles } from "@material-ui/core/styles";
import MailIcon from "@material-ui/icons/Mail";
import InboxIcon from "@material-ui/icons/MoveToInbox";
import clsx from "clsx";
import React from "react";
import PropTypes from "prop-types";
import { Person } from "@material-ui/icons";
import InputSearchAppbar from "../header/components/InputSearch";
const useStyles = makeStyles({
  list: {
    width: 250,
  },
  fullList: {
    width: "auto",
  },
});
CustomDrawer.propTypes = {
  dataDrawer: PropTypes.object,
  closeDrawer: PropTypes.func,
};
CustomDrawer.defaultProps = {
  dataDrawer: {},
  closeDrawer: null,
};

function CustomDrawer(props) {
  const { dataDrawer, closeDrawer } = props;
  const classes = useStyles();
  const toggleDrawer = (anchor, open) => (event) => {
    if (
      event.type === "keydown" &&
      (event.key === "Tab" || event.key === "Shift")
    ) {
      return;
    }
    if (!closeDrawer) return;
    console.log(open);
    closeDrawer(anchor, open);
  };
  const list = (anchor) => (
    <div
      className={clsx(classes.list, {
        [classes.fullList]: anchor === "top" || anchor === "bottom",
      })}
      role="presentation"
      onClick={toggleDrawer(anchor, false)}
      onKeyDown={toggleDrawer(anchor, false)}
    >
      <List>
        <ListItem button>
          <ListItemIcon>
            <Person />
          </ListItemIcon>
          <ListItemText>Thanh Sang</ListItemText>
        </ListItem>
      </List>
      <Divider />
      <List>
        {["All mail", "Trash", "Spam"].map((text, index) => (
          <ListItem button key={text}>
            <ListItemIcon>
              {index % 2 === 0 ? <InboxIcon /> : <MailIcon />}
            </ListItemIcon>
            <ListItemText primary={text} />
          </ListItem>
        ))}
      </List>
    </div>
  );
  return (
    <>
      <Drawer
        anchor={dataDrawer.anchor}
        open={dataDrawer.isOpen}
        onClose={toggleDrawer(dataDrawer.anchor, !dataDrawer.isOpen)}
      >
        {list(dataDrawer.anchor)}
      </Drawer>
    </>
  );
}

export default CustomDrawer;
