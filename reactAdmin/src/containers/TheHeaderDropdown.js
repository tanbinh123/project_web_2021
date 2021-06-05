import React, { useEffect } from "react";
import {
  CBadge,
  CDropdown,
  CDropdownItem,
  CDropdownMenu,
  CDropdownToggle,
  CImg,
} from "@coreui/react";
import CIcon from "@coreui/icons-react";
import { useRecoilState } from "recoil";
import { DataUser, removeLocalStorage } from "src/app/DataUser";
import { useHistory } from "react-router";
import { isEmpty } from "src/Tool/Tools";
import { Avatar, makeStyles } from "@material-ui/core";

const useStyles = makeStyles(() => ({
  itemMenu: {
    "&>i": {
      marginRight: "15px",
    },
  },
}));

const TheHeaderDropdown = () => {
  const classes = useStyles();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { push } = useHistory();
  useEffect(() => {
    if (isEmpty(dataUser.token)) push("/login");
    console.log(dataUser);
  }, [dataUser.token]);

  return (
    <CDropdown inNav className="c-header-nav-items mx-2" direction="down">
      <CDropdownToggle className="c-header-nav-link" caret={false}>
        <div className="c-avatar">
          <Avatar src={dataUser.user.avatar} />
        </div>
      </CDropdownToggle>
      <CDropdownMenu className="pt-0" placement="bottom-end">
        <CDropdownItem header tag="div" color="light" className="text-center">
          <strong>Tài khoản</strong>
        </CDropdownItem>
        <CDropdownItem className={classes.itemMenu}>
          <i className="fas fa-user"></i>
          Thông tin tài khoản
        </CDropdownItem>
        {/* <CDropdownItem>
          <CIcon name="cil-envelope-open" className="mfe-2" />
          Messages
          <CBadge color="success" className="mfs-auto">
            42
          </CBadge>
        </CDropdownItem>
        <CDropdownItem>
          <CIcon name="cil-task" className="mfe-2" />
          Tasks
          <CBadge color="danger" className="mfs-auto">
            42
          </CBadge>
        </CDropdownItem>
        <CDropdownItem>
          <CIcon name="cil-comment-square" className="mfe-2" />
          Comments
          <CBadge color="warning" className="mfs-auto">
            42
          </CBadge>
        </CDropdownItem>
        <CDropdownItem header tag="div" color="light" className="text-center">
          <strong>Settings</strong>
        </CDropdownItem>
        <CDropdownItem>
          <CIcon name="cil-user" className="mfe-2" />
          Profile
        </CDropdownItem>
        <CDropdownItem>
          <CIcon name="cil-settings" className="mfe-2" />
          Settings
        </CDropdownItem>
        <CDropdownItem>
          <CIcon name="cil-credit-card" className="mfe-2" />
          Payments
          <CBadge color="secondary" className="mfs-auto">
            42
          </CBadge>
        </CDropdownItem>
        <CDropdownItem>
          <CIcon name="cil-file" className="mfe-2" />
          Projects
          <CBadge color="primary" className="mfs-auto">
            42
          </CBadge>
        </CDropdownItem> */}
        <CDropdownItem divider />
        <CDropdownItem
          className={classes.itemMenu}
          onClick={() => {
            setDataUser({
              user: {},
              profile: {},
              courses: {},
              token: "",
            });
            removeLocalStorage();
          }}
        >
          <i className="fas fa-sign-out-alt"></i>
          <span> Đăng xuất</span>
        </CDropdownItem>
      </CDropdownMenu>
    </CDropdown>
  );
};

export default TheHeaderDropdown;
