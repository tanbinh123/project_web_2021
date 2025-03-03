import {
  Avatar,
  Box,
  IconButton,
  List,
  ListItem,
  ListItemText,
  makeStyles,
  Popover,
} from '@material-ui/core';
import { ArrowDropDown, ExitToApp, Person } from '@material-ui/icons';
import {
  bindPopover,
  bindTrigger,
  usePopupState,
} from 'material-ui-popup-state/hooks';
import React from 'react';
import { Link, useHistory } from 'react-router-dom';
import { useRecoilState } from 'recoil';
import { DataUser, removeLocalStorage } from '../../../../app/DataUser';
import { isEmpty } from '../../../tools/Tools';
import CourseBought from './components/CourseBought';
import Notications from './components/Notications';

const useStyles = makeStyles((theme) => ({
  avatar: {
    backgroundColor: 'var(--colorWhite1)',
    height: '35px',
    width: '35px',
    marginTop: '5px',
  },
  username: {
    color: 'var(--colorWhite1)',
    fontSize: '.875rem',
    fontWeight: '600',
    marginLeft: '10px',
    lineHeight: '44px',
  },
  lineBorder: {
    position: 'relative',
    marginLeft: '5px',
    '&::before': {
      content: '""',
      display: 'block',
      position: 'absolute',
      top: '12px',
      width: '1px',
      height: '23px',
      background: 'var(--colorWhite2)',
    },
  },
  iconDropDown: {
    fontSize: '35px',
  },
  buttons: {
    padding: '7px',
  },
  popover: {
    background: 'var(--colorBlack1)',
    color: 'var(--colorWhite1)',
  },
  avatarSmall: {
    width: '20px',
    height: '20px',
    marginRight: '10px',
  },
  linkNone: {
    textDecoration: 'none',
    color: 'var(--colorWhite0)',
    '&>div>.icon': {
      fontSize: '18px',
      marginRight: 10,
      color: 'var(--colorWhite0)',
    },
  },
  rootPopover: {
    '& .MuiPaper-root': {
      background: 'none',
    },
  },
}));

function RightAppHadLogin(props) {
  const classes = useStyles();
  const popupState = usePopupState({
    variant: 'popover',
    popupId: 'demoPopover',
  });
  const { host, pathname, protocol, hostname } = window.location;

  const [dataUser, setDataUser] = useRecoilState(DataUser);
  // console.log(dataUser);
  const { push } = useHistory();
  const handleLogOut = () => {
    setDataUser({
      user: {},
      profile: {},
      courses: [],
      token: '',
    });
    removeLocalStorage();
    push('/');
    popupState.close();
  };
  const popover = (
    <Popover
      className={classes.rootPopover}
      {...bindPopover(popupState)}
      anchorOrigin={{
        vertical: 'bottom',
        horizontal: 'center',
      }}
      transformOrigin={{
        vertical: 'top',
        horizontal: 'center',
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
          {dataUser.user?.admin ? (
            <a
              href={`${protocol}//${hostname}:26001/login`}
              target="_blank"
              rel="noreferrer"
              className={classes.linkNone}
            >
              <ListItem button onClick={popupState.close}>
                <i className="fas fa-user-cog icon"></i>
                <ListItemText primary="Admin" />
              </ListItem>
            </a>
          ) : (
            ''
          )}

          <ListItem button divider onClick={handleLogOut}>
            <ExitToApp className={classes.avatarSmall} fontSize="small" />
            <ListItemText primary="Đăng Xuất" />
          </ListItem>
        </List>
      </Box>
    </Popover>
  );

  return (
    <>
      <Avatar
        className={classes.avatar}
        alt={dataUser.profile?.userName}
        src={dataUser.profile?.avatar?.image}
      />
      <span className={classes.username}>
        {!isEmpty(dataUser.profile.fullname)
          ? dataUser.profile.fullname
          : dataUser.profile.userName}
      </span>
      <Box className={classes.lineBorder}></Box>
      <CourseBought />
      <Notications />
      <IconButton
        className={classes.buttons}
        color="inherit"
        {...bindTrigger(popupState)}
      >
        <ArrowDropDown className={classes.iconDropDown} />
      </IconButton>
      {popover}
    </>
  );
}

export default RightAppHadLogin;
