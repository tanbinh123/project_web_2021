import React from "react";
import PropTypes from "prop-types";
import { useRecoilState } from "recoil";
import {
  Avatar,
  Box,
  Container,
  Grid,
  makeStyles,
  Paper,
} from "@material-ui/core";
import { Camera } from "@material-ui/icons";
import { DataUser } from "../../../app/DataUser";
import InfoCss from "./css/InfoCss";
import { isEmpty } from "../../../components/tools/Tools";
Info.propTypes = {};

function Info(props) {
  const classes = InfoCss();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  isEmpty(props.profile)||console.log("info", props.profile);
  return (
    <div className={classes.rightRoot}>
      <Grid container className="backround__header">
        <Grid item xl={9} lg={9} md={9} sm={9} xs={12}>
          <ul>
            <li>
              <Avatar
                className={classes.avatarRight}
                alt={dataUser.user.username}
                src={
                  "https://upload-os-bbs.hoyolab.com/upload/2021/03/03/1015734/c396975a1041f466c80bd4f5b8f8e036_2256703502106078586.jpg?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,jpg"
                }
              >
                <Camera />
              </Avatar>
            </li>
            <li>
              <span>{dataUser.user.username}</span>
            </li>
          </ul>
        </Grid>

        <Grid item xl={3} lg={3} md={3} sm={3} xs={12}>
          <ul>
            <li>
              <span>
                Giới tính: {/* <i className="fas fa-mars"></i> */}

                {props?.profile?.gender==='NAM'?
                <i className="fas fa-mars"></i>:
                <i className="fas fa-venus" title="Nữ"></i>}
               
              </span>
            </li>
            <li>Ngày sinh: {props?.profile?.birthDay}</li>
            <li>
              <span>SĐT: {props?.profile?.phone}</span>
            </li>
            <li>
              <ul>
                <li>
                  <i className="fab fa-facebook-square"></i>
                </li>
                <li>
                  <i className="fab fa-google"></i>
                </li>
              </ul>
            </li>
          </ul>
        </Grid>
      </Grid>
      <div>
        <ul>
          <li>
            <span>Giới Thiệu</span>
          </li>
          <li>
            <span>
              {props?.profile?.description}
            </span>
          </li>
        </ul>
      </div>
    </div>
  );
}

export default Info;
