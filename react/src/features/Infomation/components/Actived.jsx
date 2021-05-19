import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import { Grid, makeStyles, Paper } from "@material-ui/core";
import "././css/Actived.css";
import ButtonClick from "../../../components/Button/ButtonClick";
import { useHistory, useParams } from "react-router";
import userApi from "../../../api/userApi";
import { useRecoilState } from "recoil";
import { DataUser } from "../../../app/DataUser";

Actived.propTypes = {};
const useStyles = makeStyles((theme) => ({
  root: {
    fontFamily: "'Open Sans', sans-serif",
    color: "var(--colorBlack2)",
    backgroundColor: "var(--colorBlack1)",
    height: "100vh",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    "&>.successful": {
      backgroundColor: "var(--colorWhite1)",

      display: "flex",
      flexFlow: "column",
      alignItems: "center",

      padding: "50px 70px 50px 70px",
      borderRadius: "20px",
      "&>.image": {
        width: "170px",
        marginBottom: 30,
      },
      "&>.title": {
        fontSize: "50px",
        fontWeight: "600",
        marginBottom: 10,
        textAlign: "center",
      },
      "&>.text": {
        fontSize: "20px",
        fontWeight: "300",
        textAlign: "center",
        marginBottom: 30,
      },
    },
  },
}));
function Actived(props) {
  let params = useParams();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const [loading, setLoading] = useState(true);
  const classes = useStyles();
  const { push } = useHistory();
  const handleOnClick = () => {
    push("/");
  };
  useEffect(async () => {
    if (dataUser.profile.actived) {
      push("/");
    } else {
      console.log("Goi Api");
      const payload = {
        code: `${params?.code}`,
      };
      const res = await userApi.actived(payload);
      console.log(res);
      setLoading(false);
    }
  }, []);
  // console.log(params?.code);
  return (
    <Grid container className={classes.root}>
      {loading ? (
        <div className="lds-ripple">
          <div></div>
          <div></div>
        </div>
      ) : (
        <Grid xl={8} lg={8} md={8} sm={10} xs={10} item className="successful">
          <img
            className="image"
            src="/assets/images/success.png"
            alt="success.png"
          />
          <span className="title">Thành Công !</span>
          <span className="text">Bạn đã kích hoạt tài khoản thành công</span>
          <div className="button">
            <ButtonClick title="Trang Chủ" onClick={handleOnClick} />
          </div>
        </Grid>
      )}
    </Grid>
  );
}

export default Actived;
