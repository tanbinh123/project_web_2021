import { CCard, CCardBody, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { Grid, makeStyles } from "@material-ui/core";
import { useSnackbar } from "notistack";
import React, { useState } from "react";
import { useEffect } from "react";
import { useForm } from "react-hook-form";
import { useHistory, useParams } from "react-router-dom";
import categoriesApi from "src/api/categoriesApi";
import CustomButton from "src/components/CustomButton";
import CustomInput from "src/components/CustomInput";
import { isEmpty } from "src/Tool/Tools";
import * as yup from "yup";
const scheme = yup.object().shape({
  name: yup.string().required("Vui lòng nhập tên thể loại"),
});

const CategorieDetailt = (props) => {
  const classes = makeStyles(() => ({
    footer: {
      display: "flex",
      justifyContent: "space-between",
    },
    visiable: {
      visibility: "hidden",
    },
    form: {
      marginBlock: "20px",
    },
    itemForm: {
      display: "flex",
      alignItems: "center",
      "&>span": {
        minWidth: "150px",
        textAlign: "right",
        marginRight: "20px",
      },
    },
    lastItem: {
      display: "flex",
      justifyContent: "center",
      marginBlock: "20px",
    },
  }))();

  const { id } = useParams();
  const { push } = useHistory();
  const { enqueueSnackbar } = useSnackbar();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      name: "",
    },
    resolver: yupResolver(scheme),
  });

  const handleOnSubmit = async (values) => {
    try {
      const res = await categoriesApi.update(id, values);
      if (!res.status) {
        enqueueSnackbar("Cập nhật thể loại thành công", { variant: "success" });
      }
    } catch (error) {
      enqueueSnackbar(error.message, { variant: "error" });
    }
  };
  let hasCategory = false;
  useEffect(() => {
    (async () => {
      const res = await categoriesApi.getAll();
      Array.from(res).map((item) => {
        if (item.id == id) {
          form.setValue("name", item.name);
          hasCategory = true;
        }
      });
      if (!hasCategory) push("/list/categories");
    })();
  }, [id]);
  return (
    <>
      <Grid container className={classes.root} spacing={3}>
        <Grid item xl={12} lg={12} md={12} xs={12} sm={12}>
          <CCard>
            <CCardHeader>
              <span className="title">Form thể loại</span>
            </CCardHeader>
            <CCardBody>
              <form
                className={classes.form}
                onSubmit={form.handleSubmit(handleOnSubmit)}
              >
                <div className={classes.itemForm}>
                  <span>Tên thể loại</span>
                  <CustomInput
                    name="name"
                    title="Tên thể loại"
                    label="Tên thể loại"
                    form={form}
                  />
                </div>

                <div className={classes.lastItem}>
                  <CustomButton type="submit" title="Gửi" />
                </div>
              </form>
            </CCardBody>
            {/* <CCardFooter></CCardFooter> */}
          </CCard>
        </Grid>
      </Grid>
    </>
  );
};

export default CategorieDetailt;
