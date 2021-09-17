import { makeStyles } from "@material-ui/core";
import { useSnackbar } from "notistack";
import React, { useState } from "react";
import categoriesApi from "src/api/categoriesApi";
import notificationApi from "src/api/notificationApi";
import CustomButtonRed from "src/components/CustomButtonRed";
import CustomDialogAction from "src/components/CustomDialogAction";

function DeleteNotification(props) {
  const { item, onUpdate } = props;
  const [isOpenDialog, setOpenDialog] = useState(false);
  const { enqueueSnackbar } = useSnackbar();
  const handleOpenDialog = () => {
    setOpenDialog(!isOpenDialog);
  };
  const handleBlockCourse = async () => {
    const res = await notificationApi.deleteNotification(item?.id);
    if (!!!res.status) {
      onUpdate();
      enqueueSnackbar("Xóa thông báo thành công", { variant: "success" });
    } else {
      enqueueSnackbar(res?.data?.message?.en, { variant: "error" });
    }
  };
  return (
    <>
      <CustomButtonRed title="Xóa" onClick={handleOpenDialog} />
      <CustomDialogAction
        title={`Xóa thông báo : ${item.name}`}
        id={item.id}
        closeDialog={handleOpenDialog}
        isOpen={isOpenDialog}
        accepct={handleBlockCourse}
        content={
          <div>
            Bạn có thực sự muốn xóa thông báo <b>{item.name}</b> này không ?
          </div>
        }
      />
    </>
  );
}

export default DeleteNotification;
