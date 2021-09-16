import React, { useState } from "react";
import userApi from "src/api/userApi";
import CustomButton from "src/components/CustomButton";
import CustomDialogAction from "src/components/CustomDialogAction";

function UnBlockUser(props) {
  const { item, onUpdate = null } = props;
  const [isOpenDialog, setOpenDialog] = useState(false);
  const handleOpenDialog = () => {
    setOpenDialog(!isOpenDialog);
  };
  const handleBlockCourse = async () => {
    const res = await userApi.unBlockUser(item?.id);
    console.log(res);
    if (!!!res.status) {
      if (onUpdate) onUpdate();
    }
  };
  return (
    <>
      <CustomButton title="Bỏ chặn" onClick={handleOpenDialog} />
      <CustomDialogAction
        title={`Chặn tài khoản : ${item.userName}`}
        id={item.id}
        closeDialog={handleOpenDialog}
        isOpen={isOpenDialog}
        accepct={handleBlockCourse}
        content={
          <div>
            Bạn có thực sự muốn bỏ chặn tài khoản <b>{item.userName}</b> này
            không ?
          </div>
        }
      />
    </>
  );
}

export default UnBlockUser;
