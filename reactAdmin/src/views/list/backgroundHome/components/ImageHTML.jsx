import React, { useState } from "react";
import CustomDialog from "src/components/CustomDialog";

function ImageHTML(props) {
  const { image = {} } = props;
  const [openDialog, setOpenDialog] = useState(false);

  const handleClickOpenDialog = () => {
    setOpenDialog(!openDialog);
  };
  return (
    <td className="tdCenter">
      <img
        className="row_image"
        src={image.image}
        onClick={handleClickOpenDialog}
      />
      <CustomDialog
        closeDialog={handleClickOpenDialog}
        isOpen={openDialog}
        id={image.id}
        title="Hình ảnh thumbnail"
        content={
          <div>
            <img className="img_thumbnail" src={image.image} />
          </div>
        }
      />
    </td>
  );
}

export default ImageHTML;
