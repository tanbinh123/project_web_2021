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
} from "@material-ui/core";
import { Notifications, Person } from "@material-ui/icons";
import {
  bindPopover,
  bindTrigger,
  usePopupState,
} from "material-ui-popup-state/hooks";
import React from "react";
import { useRecoilState } from "recoil";
import { DataUser } from "../../../../../app/DataUser";

const useStyles = makeStyles((theme) => ({
  buttons: {
    padding: "7px",
  },
  popover: {
    background: "var(--colorWhite0)",
    color: "var(--colorBlack2)",
  },
  avatarSmall: {
    // width: "20px",
    // height: "20px",
    marginRight: "10px",
  },
  linkNone: {
    textDecoration: "none",
    color: "var(--colorWhite0)",
    "&>div>.icon": {
      fontSize: "18px",
      marginRight: 10,
      color: "var(--colorWhite0)",
    },
  },
  rootPopover: {
    "& .MuiPaper-root": {
      background: "none",
    },
  },
  seeMore: {
    backgroundColor: "var(--colorWhite1)",
    padding: "10px 0",
    display: "flex",
    justifyContent: "center",
    cursor: "pointer",
    "&:hover": {
      color: "var(--colorOrange2)",
    },
  },
  contentNotication: {
    maxWidth: 200,
    display: "flex",
    flexFlow: "column",
    "&>.title": {
      fontWeight: 600,
      display: "-webkit-box",
      "-webkit-box-orient": "vertical",
      "-webkit-line-clamp": 1,
      overflow: "hidden",
    },
    "&>.content": {
      display: "-webkit-box",
      "-webkit-box-orient": "vertical",
      "-webkit-line-clamp": 3,
      overflow: "hidden",
    },
  },
}));
function Notications(props) {
  const classes = useStyles();
  const popupState = usePopupState({
    variant: "popover",
    popupId: "popoverNotications",
  });
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const popover = (
    <Popover
      className={classes.rootPopover}
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
        <List component="nav">
          <ListItem button onClick={popupState.close}>
            <Avatar
              className={classes.avatarSmall}
              src="https://upload-os-bbs.hoyolab.com/upload/2021/03/03/1015734/c396975a1041f466c80bd4f5b8f8e036_2256703502106078586.jpg?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,jpg"
            />
            <div className={classes.contentNotication}>
              <span className="title">Lorem ipsum dolor sit amet </span>
              <span className="content">
                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod
                repellendus psum, dolor sit amet consectetur adipisicing elit.
                Quod repellendus
              </span>
            </div>
          </ListItem>
          <ListItem button onClick={popupState.close}>
            <Avatar
              className={classes.avatarSmall}
              src="https://upload-os-bbs.hoyolab.com/upload/2021/03/03/1015734/c396975a1041f466c80bd4f5b8f8e036_2256703502106078586.jpg?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,jpg"
            />
            <div className={classes.contentNotication}>
              <span className="title">Lorem ipsum dolor sit amet </span>
              <span className="content">
                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod
                repellendus psum, dolor sit amet consectetur adipisicing elit.
                Quod repellendus
              </span>
            </div>
          </ListItem>
        </List>
        <Box className={classes.seeMore}>Xem tất cả</Box>
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
