import { unwrapResult } from "@reduxjs/toolkit";
import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory } from "react-router-dom";
import fileUploadApi from "../../../api/fileUploadApi";
import FormUploadOne from "./Form/FormUploadOne";

UploadOneFile.propTypes = {};

function UploadOneFile(props) {
  const dispatch = useDispatch();
  const { push } = useHistory();

  const handleOnSubmit = async (values) => {
    try {
      const formData = new FormData();
      formData.append("name", values.name);
      formData.append("file", values.file);
      const data = await fileUploadApi.upload(formData);
      console.log("Upload File", data);
    } catch (error) {
      console.log(error);
    }
  };

  return <FormUploadOne onSubmit={handleOnSubmit} />;
}

export default UploadOneFile;
