import { Avatar, Grid } from '@material-ui/core';
import { Camera } from '@material-ui/icons';
import React from 'react';
import { isEmpty } from '../../../components/tools/Tools';
import InfoCss from './css/InfoCss';
Info.propTypes = {};

function Info(props) {
  const classes = InfoCss();
  //isEmpty(props.profile)||console.log("info", props.profile);
  console.log(props?.profile);
  return (
    <div className={classes.rightRoot}>
      <Grid container className="backround__header">
        <Grid item xl={9} lg={9} md={9} sm={9} xs={12}>
          <ul>
            <li>
              <Avatar
                className={classes.avatarRight}
                alt={props?.profile?.username}
                src={props?.profile?.avatar?.image}
              >
                <Camera />
              </Avatar>
            </li>
            <li>
              <span>
                {props?.profile?.fullname || props?.profile?.username}
              </span>
            </li>
          </ul>
        </Grid>

        <Grid item xl={3} lg={3} md={3} sm={3} xs={12}>
          <ul>
            <li>
              <span>
                Giới tính: {/* <i className="fas fa-mars"></i> */}
                {props?.profile?.gender === 'NAM' ? (
                  <i className="fas fa-mars"></i>
                ) : (
                  <i className="fas fa-venus" title="Nữ"></i>
                )}
              </span>
            </li>
            <li>Ngày sinh: {props?.profile?.birthDay}</li>
            <li>
              <a href={`tel:+${props?.profile?.phone}`}>
                <span>SĐT: {props?.profile?.phone}</span>
              </a>
            </li>
            <li>
              <ul>
                <li>
                  <a
                    href={`http://${props?.profile?.facebook}`}
                    target="_blank"
                    rel="noopener noreferrer"
                  >
                    <i className="fab fa-facebook-square"></i>
                  </a>
                </li>
                <li>
                  <a
                    href={`mailto:${props?.profile?.email}`}
                    target="_blank"
                    rel="noopener noreferrer"
                  >
                    <i className="fab fa-google"></i>
                  </a>
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
            <span>{props?.profile?.description}</span>
          </li>
        </ul>
      </div>
    </div>
  );
}

export default Info;
