import { makeStyles } from "@material-ui/core";
import React, { useState } from "react";
import courseApi from "src/api/courseApi";
import imageApi from "src/api/imageApi";
import CustomButtonRed from "src/components/CustomButtonRed";
import CustomDialogAction from "src/components/CustomDialogAction";

function DeleteImageBgHome(props) {
  const { item, onReload = null } = props;
  const [isOpenDialog, setOpenDialog] = useState(false);
  const handleOpenDialog = () => {
    setOpenDialog(!isOpenDialog);
  };
  const handleDeleteImage = async () => {
    const res = await imageApi.delete(item.id);
    console.log(res);
    if (onReload) onReload();
  };
  return (
    <>
      <CustomButtonRed title="Xóa" onClick={handleOpenDialog} />
      <CustomDialogAction
        title={`Xóa hình nền trang chủ`}
        id={item.id}
        closeDialog={handleOpenDialog}
        isOpen={isOpenDialog}
        accepct={handleDeleteImage}
        content={
          <div>
            Bạn có thực sự muốn xóa tấm hình này hay không ?
            <br />
            <br />
            Hình sễ bị xóa và không thể khôi phục
          </div>
        }
      />
    </>
  );
}

export default DeleteImageBgHome;
