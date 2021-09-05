import { MenuItem } from '@material-ui/core';
import Badge from '@material-ui/core/Badge';
import IconButton from '@material-ui/core/IconButton';
import Menu from '@material-ui/core/Menu';
import { makeStyles } from '@material-ui/core/styles';
import AccountCircle from '@material-ui/icons/AccountCircle';
import MailIcon from '@material-ui/icons/Mail';
import MenuIcon from '@material-ui/icons/Menu';
import NotificationsIcon from '@material-ui/icons/Notifications';
import classNames from 'classnames';
import { usePopupState } from 'material-ui-popup-state/hooks';
import React, { useEffect, useRef, useState } from 'react';
import { useHistory } from 'react-router';
import { Link } from 'react-router-dom';
import { useRecoilState } from 'recoil';
import { DataUser, removeLocalStorage } from '../../../../app/DataUser';
import Button1 from '../../../Button';
import { colorBlack1, colorWhite1, colorWhite2 } from '../../../color/color';
import MenuMoblie from '../MenuMobile/MenuMoblie';
import { isEmpty } from '../../../tools/Tools';
import RightAppHadLogin from './RightAppHadLogin';
// css
const useStyles = makeStyles((theme) => ({
  floatRight: {
    float: 'right',
  },
  sectionDesktop: {
    display: 'none',
    [theme.breakpoints.up('md')]: {
      display: 'flex',
    },
  },
  sectionMobile: {
    display: 'flex',
    justifyContent: 'flex-end',
    [theme.breakpoints.up('md')]: {
      display: 'none',
    },
  },

  customsAppbar: {
    boxShadow: 'none',
  },
  customsAppBarTop: {
    background: 'transparent',
    transition: 'background-color .3s linear',
  },
  customsAppBarBottom: {
    backgroundColor: colorBlack1,
    transition: 'background-color .3s linear',
  },
  link: {
    textDecoration: 'none',
  },
}));
RightAppbar.propTypes = {};
function RightAppbar(props) {
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const classes = useStyles();
  const navRef = useRef();
  const [navBackground, setNavBackground] = useState('customsAppBarTop');
  navRef.current = navBackground;
  useEffect(() => {
    function handleScrollAppBar() {
      const isHeight = window.scrollY > 238;
      if (isHeight) {
        setNavBackground('customsAppBarBottom');
      } else {
        setNavBackground('customsAppBarTop');
      }
    }
    document.addEventListener('scroll', handleScrollAppBar);
    return () => {
      document.removeEventListener('scroll', handleScrollAppBar);
    };
  }, []);
  const [dataDrawer, setDataDrawer] = useState({
    anchor: 'left',
    isOpen: false,
  });
  const toggleDrawer = (anchor, isOpen) => (event) => {
    if (
      event.type === 'keydown' &&
      (event.key === 'Tab' || event.key === 'Shift')
    ) {
      return;
    }
    setDataDrawer({ ...dataDrawer, anchor: anchor, isOpen: isOpen });
  };
  function handleCloseDrawer(anchor, isOpen) {
    setDataDrawer({ ...dataDrawer, anchor: anchor, isOpen: isOpen });
  }
  //menu after login
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
        {isEmpty(dataUser.user) ? rightNotLogin : <RightAppHadLogin />}
      </div>
      <div className={classNames(classes.sectionMobile)}>
        <IconButton
          aria-label="show more"
          aria-haspopup="true"
          onClick={toggleDrawer('left', true)}
          color="inherit"
        >
          <MenuIcon />
        </IconButton>
        <MenuMoblie dataDrawer={dataDrawer} closeDrawer={handleCloseDrawer} />
      </div>
    </>
  );
}
export default RightAppbar;
