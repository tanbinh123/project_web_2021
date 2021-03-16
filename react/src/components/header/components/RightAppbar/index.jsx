import { MenuItem } from "@material-ui/core";
import Badge from "@material-ui/core/Badge";
import IconButton from "@material-ui/core/IconButton";
import Menu from "@material-ui/core/Menu";
import { makeStyles } from "@material-ui/core/styles";
import AccountCircle from "@material-ui/icons/AccountCircle";
import MailIcon from "@material-ui/icons/Mail";
import MenuIcon from "@material-ui/icons/Menu";
import NotificationsIcon from "@material-ui/icons/Notifications";
import classNames from "classnames";
import React, { useEffect, useRef, useState } from "react";
import { useRouteMatch } from "react-router";
import { Link } from "react-router-dom";
import Button1 from "../../../Button";
import { colorBlack1, colorWhite1, colorWhite2 } from "../../../color/color";
import CustomsDrawer from "../../../Drawer";
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
  link: {
    textDecoration: "none",
  },
}));
RightAppbar.propTypes = {};

function RightAppbar(props) {
  const classes = useStyles();

  //
  const url = useRouteMatch();
  console.log(url);

  //

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
      anchorOrigin={{ vertical: "bottom", horizontal: "center" }}
      id={menuId}
      keepMounted
      transformOrigin={{ vertical: "bottom", horizontal: "center" }}
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
  const [dataDrawer, setDataDrawer] = useState({
    anchor: "left",
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
    <>
      <div className={classNames(classes.sectionDesktop, classes.floatRight)}>
        {/* <IconButton aria-label="show 4 new mails" color="inherit">
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
        </IconButton> */}
        <Link to="/login" className={classes.link}>
          <Button1 title="Login" />
        </Link>
      </div>
      <div className={classNames(classes.sectionMobile, classes.floatRight)}>
        <InputSearchMobile />
        <IconButton
          aria-label="show more"
          aria-haspopup="true"
          onClick={toggleDrawer("left", true)}
          color="inherit"
        >
          <MenuIcon />
        </IconButton>
        <CustomsDrawer
          dataDrawer={dataDrawer}
          closeDrawer={handleCloseDrawer}
        />
      </div>
      {renderMobileMenu}
      {renderMenu}
    </>
  );
}

export default RightAppbar;
