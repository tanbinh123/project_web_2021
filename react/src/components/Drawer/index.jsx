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
import { AccountCircle, ExitToApp, Person } from "@material-ui/icons";
import { useRecoilState } from "recoil";
import { DataUser, removeLocalStorage } from "../../app/DataUser";
import { isEmpty } from "../tools/Tools";
import { Avatar } from "@material-ui/core";
import { useHistory } from "react-router";
const useStyles = makeStyles({
  list: {
    width: 250,
  },
  fullList: {
    width: "auto",
  },
  avatar: {
    marginRight: 20,
  },
  textName: {
    fontFamily: "'Open Sans', sans-serif",
    fontSize: 18,
    fontWeight: "600 !important",
    color: "var(--colorBlack1)",
  },
  listContent: {
    "&>ul>div>span": {
      fontFamily: "'Open Sans', sans-serif",
      fontSize: 18,
      fontWeight: 500,
      color: "var(--colorBlack1)",
    },
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
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const classes = useStyles();
  const { push } = useHistory();
  const toggleDrawer = (anchor, open) => (event) => {
    if (
      event.type === "keydown" &&
      (event.key === "Tab" || event.key === "Shift")
    ) {
      return;
    }
    if (!closeDrawer) return;
    closeDrawer(anchor, open);
  };
  const login = (anchor) => (
    <div
      className={clsx(classes.list, {
        [classes.fullList]: anchor === "top" || anchor === "bottom",
      })}
      role="presentation"
      onClick={toggleDrawer(anchor, false)}
      onKeyDown={toggleDrawer(anchor, false)}
    >
      <div className={classes.listContent}>
        <List>
          <ListItem button>
            <Avatar
              className={classes.avatar}
              alt={dataUser.user.username}
              src={dataUser.user.avatar}
            />
            <span className={classes.textName}>{dataUser.user.username}</span>
          </ListItem>
        </List>
        <Divider />
        <List>
          <ListItem button>
            <ListItemIcon>
              <InboxIcon />
            </ListItemIcon>
            <span>Thông báo</span>
          </ListItem>
          <ListItem button>
            <ListItemIcon>
              <InboxIcon />
            </ListItemIcon>
            <span>Khóa học của tôi</span>
          </ListItem>
          <ListItem button>
            <ListItemIcon>
              <InboxIcon />
            </ListItemIcon>
            <span>Giỏ hàng</span>
          </ListItem>
          <ListItem
            button
            onClick={() => {
              push("/course");
            }}
          >
            <ListItemIcon>
              <InboxIcon />
            </ListItemIcon>
            <span>Khóa học</span>
          </ListItem>
        </List>
        <Divider />
        <List>
          <ListItem
            button
            onClick={() => {
              setDataUser({ user: {} });
              removeLocalStorage();
              push("/");
            }}
          >
            <ListItemIcon>
              <ExitToApp />
            </ListItemIcon>
            <span>Đăng xuất</span>
          </ListItem>
        </List>
      </div>
    </div>
  );
  const unlogin = (anchor) => (
    <div
      className={clsx(classes.list, {
        [classes.fullList]: anchor === "top" || anchor === "bottom",
      })}
      role="presentation"
      onClick={toggleDrawer(anchor, false)}
      onKeyDown={toggleDrawer(anchor, false)}
    >
      <div className={classes.listContent}>
        <List>
          <ListItem
            button
            onClick={() => {
              push("/auth/login");
            }}
          >
            <ListItemIcon>
              <AccountCircle />
            </ListItemIcon>
            <span>Đăng nhập</span>
          </ListItem>
        </List>
        <Divider />
        <List>
          <ListItem
            button
            onClick={() => {
              push("/course");
            }}
          >
            <ListItemIcon>
              <InboxIcon />
            </ListItemIcon>
            <span>Khóa học</span>
          </ListItem>
        </List>
      </div>
    </div>
  );
  return (
    <>
      <Drawer
        anchor={dataDrawer.anchor}
        open={dataDrawer.isOpen}
        onClose={toggleDrawer(dataDrawer.anchor, !dataDrawer.isOpen)}
      >
        {!isEmpty(dataUser.user)
          ? login(dataDrawer.anchor)
          : unlogin(dataDrawer.anchor)}
      </Drawer>
    </>
  );
}

export default CustomDrawer;
