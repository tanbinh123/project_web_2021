import { makeStyles } from "@material-ui/core";
import { useSnackbar } from "notistack";
import React, { useState } from "react";
import categoriesApi from "src/api/categoriesApi";
import CustomButtonRed from "src/components/CustomButtonRed";
import CustomDialogAction from "src/components/CustomDialogAction";

function DeleteCategory(props) {
  const { item, onUpdate } = props;
  const [isOpenDialog, setOpenDialog] = useState(false);
  const { enqueueSnackbar } = useSnackbar();
  const handleOpenDialog = () => {
    setOpenDialog(!isOpenDialog);
  };
  const handleBlockCourse = async () => {
    const res = await categoriesApi.update(item.id, { deleted: true });
    if (!!!res.status) {
      onUpdate();
      enqueueSnackbar("Xóa thành công thể loại", { variant: "success" });
    } else {
      enqueueSnackbar(res?.data?.message?.en, { variant: "error" });
    }
  };
  return (
    <>
      <CustomButtonRed title="Xóa" onClick={handleOpenDialog} />
      <CustomDialogAction
        title={`Xóa thể loại : ${item.name}`}
        id={item.id}
        closeDialog={handleOpenDialog}
        isOpen={isOpenDialog}
        accepct={handleBlockCourse}
        content={
          <div>
            Bạn có thực sự muốn xóa thể loại <b>{item.name}</b> này không ?
          </div>
        }
      />
    </>
  );
}

export default DeleteCategory;
