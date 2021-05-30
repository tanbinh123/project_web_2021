import { yupResolver } from "@hookform/resolvers/yup";
import { Avatar, Grid } from "@material-ui/core";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import { useRecoilState } from "recoil";
import * as yup from "yup";
import { DataUser } from "../../../app/DataUser";
import ButtonUploadFW from "../../../components/Button/ButtonUploadFW";
import CustomButton from "../../../components/Button/CustomButton";
import CustomRadioForm from "../../../components/Form/CustomRadioForm";
import CustomDatePicker from "../../../components/Input/CustomDatePicker";
import CustomInput from "../../../components/Input/CustomInput";
import { toDate } from "../../../components/tools/Tools";
import "././css/Actived.css";
import EditCss from "./css/EditCss";

Edit.propTypes = {};
const schema = yup.object().shape({
  fullName: yup.string().required("Vui lòng nhập tên đầy đủ"),
  email: yup
    .string()
    .required("Vui lòng nhập email")
    .email("Vui lòng nhập đúng email"),
  // location: yup.string(),
  // facebook: yup.string().required("Vui lòng nhập địa chỉ Facebook"),
  // description: yup.string().required(),
});
function Edit(props) {
  const classes = EditCss();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { user, profile } = dataUser;
  console.log(profile);
  const [date, setDate] = useState(toDate(profile.birthDay));
  const [imgAvatar, setImageAvatar] = useState(profile.avatar.image);
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      fullName: profile.fullName,
      email: profile.email,
      birthDay: date,
      gender: profile.gender,
      location: profile.lacation,
      facebook: profile.facebook,
      description: profile.description,
      phone: profile.phone,
      avatar: imgAvatar,
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = async (value) => {
    console.log(value);
  };
  const handleChangeAvatar = () => {
    const inputFile = document.getElementById("input-avatar");
    inputFile.click();
  };
  const handleOnChangeFile = (event) => {
    const file = event.target.files[0];
    console.log(file);
    const avatarTmp = URL.createObjectURL(file);
    setImageAvatar(avatarTmp);
    form.setValue("avatar", file);
  };
  return (
    <Grid container className={classes.rightRoot}>
      <Grid
        item
        xl={12}
        lg={12}
        md={12}
        sm={12}
        xs={12}
        className="backround__header"
      >
        <ul>
          <li>
            <span>Edit Profile</span>
          </li>
          <li>
            <span>Chỉnh sửa thông tin cá nhân</span>
          </li>
        </ul>
      </Grid>
      <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
        <form onSubmit={form.handleSubmit(handleOnSubmit)}>
          <div className={classes.flexRow}>
            <div className={classes.bgAvatar}>
              <Avatar
                className={classes.Avatar}
                src={imgAvatar}
                onClick={handleChangeAvatar}
              />

              <input
                accept="image/*"
                type="file"
                name="avatar"
                id="input-avatar"
                onChange={handleOnChangeFile}
                hidden
              />
              <CustomButton
                title="upload"
                css={true}
                onClick={handleChangeAvatar}
              />
            </div>
            {/* <Avatar className={classes.Avatar} src={profile.avatar.image} /> */}
            <div className={classes.flexColumn}>
              <div className={classes.rowEdit}>
                <span>Họ và tên</span>
                <CustomInput
                  title="Họ và Tên"
                  name="fullName"
                  label="Họ và tên"
                  form={form}
                />
              </div>
              <div className={classes.rowEdit}>
                <span>Email</span>
                <CustomInput
                  title="Email"
                  name="email"
                  label="Email"
                  form={form}
                />
              </div>
              <div className={classes.rowEdit}>
                <span>Ngày sinh</span>
                <CustomDatePicker
                  name="birthDay"
                  value={date}
                  onChange={(value) => {
                    setDate(value);
                    form.setValue("birthDay", value);
                  }}
                />
              </div>
              <div className={classes.rowEdit}>
                <span>Giới tính</span>
                <CustomRadioForm
                  name="gender"
                  form={form}
                  data={[
                    { title: "Nam", value: "NAM" },
                    { title: "Nữ", value: "NU" },
                  ]}
                />
              </div>
              <div className={classes.rowEdit}>
                <span>Địa chỉ</span>
                <CustomInput
                  title="Địa chỉ"
                  name="location"
                  label="Địa chỉ"
                  form={form}
                />
              </div>
              <div className={classes.rowEdit}>
                <span>Số điện thoại</span>
                <CustomInput
                  type="number"
                  title="Number"
                  name="phone"
                  label="Phone"
                  form={form}
                />
              </div>
              <div className={classes.rowEdit}>
                <span>Facebook</span>
                <CustomInput
                  title="Facebook"
                  name="facebook"
                  label="Facebook"
                  form={form}
                />
              </div>
              <div className={classes.rowEdit}>
                <span>Mô tả</span>
                <CustomInput
                  title="Mô tả"
                  name="description"
                  label="Mô tả"
                  multiline={true}
                  rows={4}
                  form={form}
                />
              </div>
            </div>
          </div>
          <div className={classes.bottomEdit}>
            <CustomButton title="Gửi" css={true} type="submit" />
          </div>
        </form>
      </Grid>
    </Grid>
  );
}
export default Edit;
