import { Drawer, MenuItem } from "@material-ui/core";
import Badge from "@material-ui/core/Badge";
import IconButton from "@material-ui/core/IconButton";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";
import Menu from "@material-ui/core/Menu";
import { makeStyles } from "@material-ui/core/styles";
import { Search } from "@material-ui/icons";
import AccountCircle from "@material-ui/icons/AccountCircle";
import MailIcon from "@material-ui/icons/Mail";
import MenuIcon from "@material-ui/icons/Menu";
import InboxIcon from "@material-ui/icons/MoveToInbox";
import NotificationsIcon from "@material-ui/icons/Notifications";
import classNames from "classnames";
import React, { useEffect, useRef, useState } from "react";
import { colorBlack1, colorWhite1, colorWhite2 } from "../../../color/color";
import InputSearchAppbar from "../InputSearch";
import InputSearchMobile from "../InputSearchMobile";

// css
const useStyles = makeStyles((theme) => ({
  floatLeft: {
    float: "left",
  },
  floatRight: {
    float: "right",
  },
  sectionDesktop: {
    display: "none",
    [theme.breakpoints.up("md")]: {
      display: "flex",
    },
  },
  sectionMobile: {
    display: "flex",
    [theme.breakpoints.up("md")]: {
      display: "none",
    },
  },
  showDesktop: {
    display: "none",
    [theme.breakpoints.up("sm")]: {
      display: "flex",
    },
  },
  customsAppbar: {
    boxShadow: "none",
  },
  customsAppBarTop: {
    background: "transparent",
    transition: "background-color .3s linear",
  },
  customsAppBarBottom: {
    backgroundColor: colorBlack1,
    transition: "background-color .3s linear",
  },
  listDrawer: {
    width: 200,
    backgroundColor: colorWhite2,
  },
  paper: {
    background: colorWhite1,
  },
}));
RightAppbar.propTypes = {};

function RightAppbar(props) {
  const classes = useStyles();
  const [anchorEl, setAnchorEl] = React.useState(null);
  const [mobileMoreAnchorEl, setMobileMoreAnchorEl] = React.useState(null);

  const isMenuOpen = Boolean(anchorEl);
  const isMobileMenuOpen = Boolean(mobileMoreAnchorEl);

  const handleProfileMenuOpen = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleMobileMenuClose = () => {
    setMobileMoreAnchorEl(null);
  };

  const handleMenuClose = () => {
    setAnchorEl(null);
    handleMobileMenuClose();
  };

  const handleMobileMenuOpen = (event) => {
    setMobileMoreAnchorEl(event.currentTarget);
  };
  const navRef = useRef();
  const [navBackground, setNavBackground] = useState("customsAppBarTop");
  navRef.current = navBackground;
  useEffect(() => {
    function handleScrollAppBar() {
      const isHeight = window.scrollY > 238;
      if (isHeight) {
        setNavBackground("customsAppBarBottom");
      } else {
        setNavBackground("customsAppBarTop");
      }
    }
    document.addEventListener("scroll", handleScrollAppBar);
    return () => {
      document.removeEventListener("scroll", handleScrollAppBar);
    };
  }, []);
  const menuId = "primary-search-account-menu";
  const renderMenu = (
    <Menu
      anchorEl={anchorEl}
      anchorOrigin={{ vertical: "top", horizontal: "left" }}
      id={menuId}
      keepMounted
      transformOrigin={{ vertical: "top", horizontal: "right" }}
      open={isMenuOpen}
      onClose={handleMenuClose}
    >
      <MenuItem onClick={handleMenuClose}>Profile</MenuItem>
      <MenuItem onClick={handleMenuClose}>My account</MenuItem>
    </Menu>
  );

  const mobileMenuId = "primary-search-account-menu-mobile";
  const renderMobileMenu = (
    <Menu
      anchorEl={mobileMoreAnchorEl}
      anchorOrigin={{ vertical: "top", horizontal: "right" }}
      id={mobileMenuId}
      keepMounted
      transformOrigin={{ vertical: "top", horizontal: "right" }}
      open={isMobileMenuOpen}
      onClose={handleMobileMenuClose}
    >
      <MenuItem>
        <IconButton aria-label="show 4 new mails" color="inherit">
          <Badge badgeContent={4} color="secondary">
            <MailIcon />
          </Badge>
        </IconButton>
        <p>Messages</p>
      </MenuItem>
      <MenuItem>
        <IconButton aria-label="show 11 new notifications" color="inherit">
          <Badge badgeContent={11} color="secondary">
            <NotificationsIcon />
          </Badge>
        </IconButton>
        <p>Notifications</p>
      </MenuItem>
      <MenuItem onClick={handleProfileMenuOpen}>
        <IconButton
          aria-label="account of current user"
          aria-controls="primary-search-account-menu"
          aria-haspopup="true"
          color="inherit"
        >
          <AccountCircle />
        </IconButton>
        <p>Profile</p>
      </MenuItem>
    </Menu>
  );
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
        <InputSearchAppbar />
      </div>
    </div>
  );
  return (
    <>
      <div className={classNames(classes.sectionDesktop, classes.floatRight)}>
        <IconButton aria-label="show 4 new mails" color="inherit">
          <Badge badgeContent={4} color="secondary">
            <MailIcon />
          </Badge>
        </IconButton>
        <IconButton aria-label="show 17 new notifications" color="inherit">
          <Badge badgeContent={17} color="secondary">
            <NotificationsIcon />
          </Badge>
        </IconButton>
        <IconButton
          edge="end"
          aria-label="account of current user"
          aria-controls={menuId}
          aria-haspopup="true"
          onClick={handleProfileMenuOpen}
          color="inherit"
        >
          <AccountCircle />
        </IconButton>
      </div>
      <div className={classNames(classes.sectionMobile, classes.floatRight)}>
        <InputSearchMobile />
        <IconButton
          aria-label="show more"
          aria-controls={mobileMenuId}
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
      </div>
      {renderMobileMenu}
      {renderMenu}
    </>
  );
}

export default RightAppbar;
