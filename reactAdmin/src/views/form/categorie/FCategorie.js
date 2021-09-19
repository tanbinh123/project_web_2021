import { CCard, CCardBody, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { Grid, makeStyles } from "@material-ui/core";
import { useSnackbar } from "notistack";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import categoriesApi from "src/api/categoriesApi";
import CustomButton from "src/components/CustomButton";
import CustomInput from "src/components/CustomInput";
import * as yup from "yup";
const scheme = yup.object().shape({
  name: yup.string().required("Vui lòng nhập tên thể loại"),
});

const FCategorie = (props) => {
  const { onUpdate } = props;
  const { enqueueSnackbar } = useSnackbar();
  const classes = makeStyles((theme) => ({
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
        fontSize: 16,
      },
    },
    lastItem: {
      display: "flex",
      justifyContent: "center",
      marginBlock: "20px",
    },
    [theme.breakpoints.down("md")]: {
      itemForm: {
        display: "unset",
      },
    },
  }))();
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      name: "",
    },
    resolver: yupResolver(scheme),
  });

  const handleOnSubmit = async (values) => {
    try {
      const res = await categoriesApi.add(values);
      console.log(res);
      if (!res.status) {
        enqueueSnackbar("Tạo thể loại thành công", {
          variant: "success",
          autoHideDuration: 1000,
        });
        if (onUpdate) onUpdate();
        form.reset();
      }
    } catch (error) {
      enqueueSnackbar(error.message, { variant: "error" });
    }
  };
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

export default FCategorie;
