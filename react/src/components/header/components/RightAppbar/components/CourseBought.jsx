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
import { Bookmark, Notifications, Person } from '@material-ui/icons';
import {
  bindPopover,
  bindTrigger,
  usePopupState,
} from 'material-ui-popup-state/hooks';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { useRecoilState } from 'recoil';
import { DataUser } from '../../../../../app/DataUser';

const useStyles = makeStyles((theme) => ({
  title: {
    display: 'flex',
    justifyContent: 'center',
    fontSize: '16px',
    fontWeight: '600',
    borderBottom: '1px solid var(--colorGray2)',
    paddingBottom: '5px',
  },
  link: {
    textDecoration: 'none',
    color: 'var(--colorBlack2)',
  },
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
    marginRight: '15px',
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
    fontFamily: "'Open Sans', sans-serif",
    '& .MuiPaper-root': {
      background: 'none',
    },
    // "& .MuiPopover-paper": {
    //   outline: "0",
    //   position: "absolute",
    //   maxWidth: "calc(100% - 32px)",
    //   minWidth: "16px",
    //   maxHeight: "calc(100% - 400px)",
    //   minHeight: "16px",
    //   overflowX: "hidden",
    //   overflowY: "auto",
    // },
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
      marginBottom: '10px',
      fontSize: 14,
      fontWeight: 600,
      display: '-webkit-box',
      '-webkit-box-orient': 'vertical',
      '-webkit-line-clamp': 1,
      overflow: 'hidden',
    },
    '&>.content': {
      fontSize: 14,
      fontWeight: 400,
      display: '-webkit-box',
      '-webkit-box-orient': 'vertical',
      '-webkit-line-clamp': 3,
      overflow: 'hidden',
      letterSpacing: '1px',
    },
  },
}));
function CourseBought(props) {
  const classes = useStyles();
  const popupState = usePopupState({
    variant: 'popover',
    popupId: 'popoverNotications',
  });
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { courses } = dataUser;
  // console.log(courses);
  const [seeMore, setSeeMore] = useState(false);
  useEffect(() => {
    return () => {
      setSeeMore(false);
    };
  }, [popupState.isOpen]);
  const handleShowMore = () => {
    setSeeMore(!seeMore);
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
        <Box className={classes.title}>Khóa học đã mua</Box>
        <List component="nav">
          {Array.from(courses)
            .splice(0, seeMore ? courses.length : 3)
            .map((item, index) => (
              <Link
                key={item.id}
                className={classes.link}
                to={`/course/${item.id}`}
              >
                <ListItem button onClick={popupState.close}>
                  <Avatar
                    className={classes.avatarSmall}
                    src={item.thumbnail}
                  />
                  <div className={classes.contentNotication}>
                    <span className="title">{item.title}</span>
                    <span className="content">{item.description}</span>
                  </div>
                </ListItem>
              </Link>
            ))}
        </List>
        <Box className={classes.seeMore} onClick={handleShowMore}>
          {seeMore ? 'Ẩn bớt' : 'Xem tất cả'}
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
        <Badge badgeContent={courses.length} color="secondary">
          <Bookmark />
        </Badge>
      </IconButton>
      {popover}
    </>
  );
}

export default CourseBought;
