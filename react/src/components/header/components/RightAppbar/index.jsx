import {
  Avatar,
  Box,
  List,
  ListItem,
  ListItemText,
  MenuItem,
  Popover,
} from "@material-ui/core";
import Badge from "@material-ui/core/Badge";
import IconButton from "@material-ui/core/IconButton";
import Menu from "@material-ui/core/Menu";
import { makeStyles } from "@material-ui/core/styles";
import { ArrowDropDown, Bookmark, ExitToApp, Person } from "@material-ui/icons";
import AccountCircle from "@material-ui/icons/AccountCircle";
import MailIcon from "@material-ui/icons/Mail";
import MenuIcon from "@material-ui/icons/Menu";
import NotificationsIcon from "@material-ui/icons/Notifications";
import classNames from "classnames";
import {
  bindPopover,
  bindTrigger,
  usePopupState,
} from "material-ui-popup-state/hooks";
import React, { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory } from "react-router";
import { Link } from "react-router-dom";
import { useRecoilState } from "recoil";
import { DataUser, removeLocalStorage } from "../../../../app/DataUser";
import Button1 from "../../../Button";
import { colorBlack1, colorWhite1, colorWhite2 } from "../../../color/color";
import CustomsDrawer from "../../../Drawer";
import { isEmpty } from "../../../tools/Tools";
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
    justifyContent: "flex-end",
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
  avatar: {
    backgroundColor: colorWhite1,

    height: "35px",
    width: "35px",

    marginTop: "5px",
  },
  username: {
    color: colorWhite1,
    fontSize: ".875rem",
    fontWeight: "600",
    marginLeft: "10px",
    lineHeight: "44px",
  },
  lineBorder: {
    position: "relative",
    marginLeft: "5px",
    "&::before": {
      content: '""',
      display: "block",
      position: "absolute",
      top: "12px",
      width: "1px",
      height: "23px",
      background: colorWhite2,
    },
  },
  iconDropDown: {
    fontSize: "35px",
  },
  buttons: {
    padding: "7px",
  },
  popover: {
    background: colorBlack1,
    color: colorWhite1,
  },
  avatarSmall: {
    width: "20px",
    height: "20px",
    marginRight: "10px",
  },
  linkNone: {
    textDecoration: "none",
    color: "var(--colorWhite0)",
  },
}));
RightAppbar.propTypes = {};

function RightAppbar(props) {
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const classes = useStyles();
  const { push } = useHistory();
  //
  // const url = useRouteMatch();

  //
  const popupState = usePopupState({
    variant: "popover",
    popupId: "demoPopover",
  });
  const [anchorEl, setAnchorEl] = React.useState(null);
  const [mobileMoreAnchorEl, setMobileMoreAnchorEl] = React.useState(null);

  // const isMenuOpen = Boolean(anchorEl);
  const isMobileMenuOpen = Boolean(mobileMoreAnchorEl);

  const handleProfileMenuOpen = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleMobileMenuClose = () => {
    setMobileMoreAnchorEl(null);
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
  const handleLogOut = () => {
    setDataUser({ user: {} });
    removeLocalStorage();
    push("/");
    popupState.close();
  };
  const rightHadLogin = (
    <>
      <Avatar
        className={classes.avatar}
        alt={dataUser.user.username}
        src={dataUser.user.avatar}
      />
      <span className={classes.username}>{dataUser.user.username}</span>
      <Box className={classes.lineBorder}></Box>
      <IconButton color="inherit" className={classes.buttons}>
        <Badge badgeContent={4} color="secondary">
          <Bookmark />
        </Badge>
      </IconButton>
      <IconButton color="inherit" className={classes.buttons}>
        <Badge badgeContent={17} color="secondary">
          <NotificationsIcon />
        </Badge>
      </IconButton>
      <IconButton
        className={classes.buttons}
        color="inherit"
        {...bindTrigger(popupState)}
      >
        <ArrowDropDown className={classes.iconDropDown} />
      </IconButton>
    </>
  );
  //menu after login
  const popover = (
    <Popover
      {...bindPopover(popupState)}
      anchorOrigin={{
        vertical: "bottom",
        horizontal: "center",
      }}
      transformOrigin={{
        vertical: "top",
        horizontal: "center",
      }}
    >
      <Box className={classes.popover} p={1}>
        <List component="nav" aria-label="mailbox folders">
          <Link to="/setting-account/info" className={classes.linkNone}>
            <ListItem button onClick={popupState.close}>
              <Avatar className={classes.avatarSmall}>
                <Person fontSize="small" />
              </Avatar>
              <ListItemText primary="Cá Nhân" />
            </ListItem>
          </Link>
          <ListItem button divider onClick={handleLogOut}>
            <ExitToApp className={classes.avatarSmall} fontSize="small" />
            <ListItemText primary="Đăng Xuất" />
          </ListItem>
          <ListItem button divider>
            <Link
              style={{ textDecoration: "none", color: "white" }}
              to="/form-upload-one"
              className={classes.linkNone}
            >
              <ListItemText primary="FORM UPPLOAD ONE" />
            </Link>
          </ListItem>
          <ListItem button divider>
            <Link
              style={{ textDecoration: "none", color: "white" }}
              to="/form-upload-test"
              className={classes.linkNone}
            >
              <ListItemText primary="FORM UPPLOAD Test" />
            </Link>
          </ListItem>
        </List>
      </Box>
    </Popover>
  );
  const rightNotLogin = (
    <>
      <Link to="/auth/login" className={classes.link}>
        <Button1 title="Login" />
      </Link>
    </>
  );
  return (
    <>
      <div className={classNames(classes.sectionDesktop, classes.floatRight)}>
        {isEmpty(dataUser.user) ? rightNotLogin : rightHadLogin}
      </div>
      <div className={classNames(classes.sectionMobile)}>
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
      {popover}
    </>
  );
}

export default RightAppbar;
