import { Avatar } from '@material-ui/core';
import Divider from '@material-ui/core/Divider';
import Drawer from '@material-ui/core/Drawer';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import { makeStyles } from '@material-ui/core/styles';
import { AccountCircle, ExitToApp } from '@material-ui/icons';
import InboxIcon from '@material-ui/icons/MoveToInbox';
import clsx from 'clsx';
import PropTypes from 'prop-types';
import React from 'react';
import { useHistory } from 'react-router';
import { Link } from 'react-router-dom';
import { useRecoilState } from 'recoil';
import NotificationsIcon from '@material-ui/icons/Notifications';
import BookmarkIcon from '@material-ui/icons/Bookmark';
import ListIcon from '@material-ui/icons/List';
import {
  DataUser,
  emptyUser,
  removeLocalStorage,
} from '../../../../app/DataUser';
import { isEmpty } from '../../../tools/Tools';
import CustomDialog from '../../../Dialog/CustomDialog';
const useStyles = makeStyles({
  list: {
    width: 250,
  },
  fullList: {
    width: 'auto',
  },
  avatar: {
    marginRight: 20,
  },
  textName: {
    fontFamily: "'Open Sans', sans-serif",
    fontSize: 18,
    fontWeight: '600 !important',
    color: 'var(--colorBlack1)',
  },
  listContent: {
    '&>ul>div': {
      fontFamily: "'Open Sans', sans-serif",
      fontSize: 18,
      fontWeight: 500,
      color: 'var(--colorBlack1)',
      '&>a': {
        textDecoration: 'none',
        display: 'flex',
        alignItems: 'center',
      },
    },
  },
});
MenuMoblie.propTypes = {
  dataDrawer: PropTypes.object,
  closeDrawer: PropTypes.func,
};
MenuMoblie.defaultProps = {
  dataDrawer: {},
  closeDrawer: null,
};

function MenuMoblie(props) {
  const { dataDrawer, closeDrawer } = props;
  //dialog
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { courses } = dataUser;
  const [seeMore, setSeeMore] = React.useState(false);
  const handleShowMore = () => {
    setSeeMore(!seeMore);
  };
  const classes = useStyles();
  const { push } = useHistory();
  const [isOpenDialog, setOpenDialog] = React.useState(false);
  const toggleDrawer = (anchor, open) => (event) => {
    if (
      event.type === 'keydown' &&
      (event.key === 'Tab' || event.key === 'Shift')
    ) {
      return;
    }
    if (!closeDrawer) return;
    closeDrawer(anchor, open);
  };
  const login = (anchor) => (
    <div
      className={clsx(classes.list, {
        [classes.fullList]: anchor === 'top' || anchor === 'bottom',
      })}
      role="presentation"
      onClick={toggleDrawer(anchor, false)}
      onKeyDown={toggleDrawer(anchor, false)}
    >
      <div className={classes.listContent}>
        <List>
          <ListItem button>
            <Link to="/setting-account/info">
              <Avatar
                className={classes.avatar}
                alt={dataUser.user.username}
                src={dataUser.user.avatar}
              />
              <span className={classes.textName}>{dataUser.user.username}</span>
            </Link>
          </ListItem>
        </List>
        <Divider />
        <List>
          {/* <ListItem button>
            <ListItemIcon>
              <NotificationsIcon />
            </ListItemIcon>
            <span>Thông báo</span>
          </ListItem> */}
          <ListItem
            button
            onClick={(e) => {
              setOpenDialog(true);
            }}
          >
            <ListItemIcon>
              <BookmarkIcon />
            </ListItemIcon>
            <span>Khóa học của tôi</span>
          </ListItem>
          <ListItem
            button
            onClick={() => {
              push('/course');
            }}
          >
            <ListItemIcon>
              <ListIcon />
            </ListItemIcon>
            <span>Khóa học</span>
          </ListItem>
        </List>
        <Divider />
        <List>
          <ListItem
            button
            onClick={() => {
              setDataUser(emptyUser);
              removeLocalStorage();
              push('/');
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
        [classes.fullList]: anchor === 'top' || anchor === 'bottom',
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
              push('/auth/login');
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
              push('/course');
            }}
          >
            <ListItemIcon>
              <ListIcon />
            </ListItemIcon>
            <span>Khóa học</span>
          </ListItem>
        </List>
      </div>
    </div>
  );
  const dataDialog = (
    <div className="dialog-course-bought-mobile">
      {Array.from(courses)
        .splice(0, seeMore ? courses.length : 3)
        .map((item, index) => (
          <Link key={item.id} className="link" to={`/course/${item.id}`}>
            <ListItem button onClick={() => {}}>
              <Avatar className="avatar" src={item.thumbnail} />
              <div className="content">
                <span className="title">{item.title}</span>
                <span className="description">{item.description}</span>
              </div>
            </ListItem>
          </Link>
        ))}
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
      <CustomDialog
        title="Khóa học của tôi"
        id="my-course-bought"
        open={isOpenDialog}
        content={dataDialog}
        onClose={() => {
          setOpenDialog(false);
        }}
      />
    </>
  );
}

export default MenuMoblie;
