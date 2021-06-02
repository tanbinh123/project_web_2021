import { CCard, CCardBody, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import CustomButton from "src/components/CustomButton";
import CustomButtonRed from "src/components/CustomButtonRed";
import CustomInput from "src/components/CustomInput";
import * as yup from "yup";
const useStyles = makeStyles((theme) => ({
  form: {
    "& > div": {
      display: "flex",
      alignItems: "center",
      "& > span": {
        minWidth: "150px",
        fontSize: " 16px",
      },
      marginBottom: "30px",
      "&>button": {
        marginLeft: "15px",
      },
    },
    "& > div:last-of-type": {
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
  },

  [theme.breakpoints.down("md")]: {
    form: {
      "& > div": {
        display: "flex",
        flexFlow: "column",
        alignItems: "start",
        "& > span": {
          marginBottom: "15px",
        },
        "&>button": {
          marginLeft: "0px",
          marginTop: "10px",
        },
      },
      "& > div:last-of-type": {},
    },
  },
}));
const schema = yup.object().shape({
  // firstName: yup.string().required(),
});
// {
//   courseId,
//   [
//     {id,deleted,learning},
//   {id,deleted,learning},
//   {id,deleted,learning},
//   {deleted,learning},
//   ]
//   }
function LearningCourseForm(props) {
  const classes = useStyles();
  const { dataCourse = null, changeDataCourse = null } = props;
  const [dataLearning, setDataLearning] = useState(dataCourse.learning);
  const [isUpdate, setUpdate] = useState(false);
  console.log(dataLearning);
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      courseId: dataCourse.id,
      data: [],
    },
    resolver: yupResolver(schema),
  });
  useEffect(() => {
    console.log("useEffect");
    Array.from(dataLearning).map((item, index) => {
      form.setValue(`data[${index}]`, item);
    });
    return () => {
      form.setValue(`data`, []);
    };
  }, [dataLearning, isUpdate]);
  const handleOnSubmit = (value) => {
    console.log(value);
  };
  return (
    <CCard>
      <CCardHeader>
        <span className="title">Form: Sẽ học được gì</span>
      </CCardHeader>
      <CCardBody>
        <form
          className={classes.form}
          onSubmit={form.handleSubmit(handleOnSubmit)}
        >
          {Array.from(dataLearning).map(
            (item, index) =>
              !item.deleted && (
                <div key={index}>
                  <span>Học được {index + 1}</span>
                  <CustomInput
                    name={`data[${index}].learning`}
                    title={`Học được ${index + 1}`}
                    label={`Học được ${index + 1}`}
                    form={form}
                  />
                  <CustomButtonRed
                    title="Delete"
                    onClick={() => {
                      const tmpData = form.getValues("data");
                      console.log(tmpData);
                      if (item.id) {
                        tmpData[index].deleted = true;
                        setDataLearning(tmpData);
                        setUpdate(!isUpdate);
                      } else {
                        tmpData.splice(index, 1);
                        form.reset({ courseId: dataCourse.id, data: [] });
                        let tmpData12 = form.getValues("data");
                        form.setValue("data", tmpData);
                        console.log(tmpData12);
                        setDataLearning(tmpData);
                        setUpdate(!isUpdate);
                      }
                    }}
                  />
                </div>
              )
          )}
          <div>
            <CustomButton
              title="Thêm"
              onClick={() => {
                const tmpData = form.getValues("data");
                console.log(tmpData);
                setDataLearning([
                  ...tmpData,
                  {
                    courseId: 171,
                    deleted: false,
                    learning: "",
                  },
                ]);
                setUpdate(!isUpdate);
              }}
            />
          </div>
          <div>
            <CustomButton type="submit" title="Gửi" />
          </div>
        </form>
      </CCardBody>
      {/* <CCardFooter></CCardFooter> */}
    </CCard>
  );
}

export default LearningCourseForm;
