import {
  Avatar,
  Badge,
  Box,
  IconButton,
  List,
  ListItem,
  ListItemText,
  makeStyles,
  Popover,
} from '@material-ui/core';
import { Notifications, Person } from '@material-ui/icons';
import {
  bindPopover,
  bindTrigger,
  usePopupState,
} from 'material-ui-popup-state/hooks';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router';
import { useRecoilState } from 'recoil';
import notificationApi from '../../../../../api/notificationApi';
import { DataUser } from '../../../../../app/DataUser';
import { isEmpty } from '../../../../tools/Tools';

const useStyles = makeStyles((theme) => ({
  buttons: {
    padding: '7px',
  },
  popover: {
    background: 'var(--colorWhite0)',
    color: 'var(--colorBlack2)',
  },
  avatarSmall: {
    // width: "20px",
    // height: "20px",
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
  seeMore: {
    backgroundColor: 'var(--colorWhite1)',
    padding: '10px 0',
    display: 'flex',
    justifyContent: 'center',
    cursor: 'pointer',
    '&:hover': {
      color: 'var(--colorOrange2)',
    },
  },
  contentNotication: {
    maxWidth: 200,
    display: 'flex',
    flexFlow: 'column',
    '&>.title': {
      fontWeight: 600,
      display: '-webkit-box',
      '-webkit-box-orient': 'vertical',
      '-webkit-line-clamp': 1,
      overflow: 'hidden',
    },
    '&>.content': {
      '-webkit-box-orient': 'vertical',
      '-webkit-line-clamp': 3,
      textOverflow: 'ellipsis',
      overflow: 'hidden',
    },
  },
}));
function Notications(props) {
  const classes = useStyles();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { push } = useHistory();
  const popupState = usePopupState({
    variant: 'popover',
    popupId: 'popoverNotications',
  });
  const [seeMore, setSeeMore] = useState(false);
  const handleShowMore = () => {
    setSeeMore(!seeMore);
  };
  const [dataNoti, setDataNoti] = useState([]);
  useEffect(() => {
    (async () => {
      if (!isEmpty(dataUser.token) && popupState.isOpen === true) {
        try {
          const { data } = await notificationApi.getAll();
          console.log(data);
          setDataNoti(data);
        } catch (error) {
          console.log(error);
        }
      }
    })();

    return () => {
      // setDataNoti([]);
      setSeeMore(false);
    };
  }, [popupState.isOpen]);

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
        <List component="nav">
          {Array.from(dataNoti)
            .filter((item) => item.actived)
            .splice(
              0,
              seeMore
                ? Array.from(dataNoti).filter((item) => item.actived).length
                : 3
            )
            .map((item, idx) => (
              <ListItem
                key={idx}
                button
                onClick={(e) => {
                  e.preventDefault();
                  const tmp = e.target.parentNode;
                  tmp.classList.toggle('show-all-text');
                }}
              >
                <Avatar
                  className={classes.avatarSmall}
                  src={item?.appUserSent?.avatar?.image}
                />
                <div className={classes.contentNotication}>
                  <span className="title">{item.name}</span>
                  <span className="content">{item.content}</span>
                </div>
              </ListItem>
            ))}
        </List>
        <Box
          className={classes.seeMore}
          onClick={() => {
            push('/setting-account/notification');
          }}
        >
          Xem tất cả
        </Box>
      </Box>
    </Popover>
  );
  return (
    <>
      <IconButton
        color="inherit"
        className={classes.buttons}
        {...bindTrigger(popupState)}
      >
        <Badge badgeContent={0} color="secondary">
          <Notifications />
        </Badge>
      </IconButton>
      {popover}
    </>
  );
}

export default Notications;
