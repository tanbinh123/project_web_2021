import { CCard, CCardBody, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import CustomButton from "src/components/CustomButton";
import CustomInput from "src/components/CustomInput";
import * as yup from "yup";
import Accordion from "@material-ui/core/Accordion";
import AccordionSummary from "@material-ui/core/AccordionSummary";
import AccordionDetails from "@material-ui/core/AccordionDetails";
import Typography from "@material-ui/core/Typography";
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import CustomSelectForm from "src/components/form/CustomSelectForm";
import FormParts from "./PartCourse/FormParts";
import FormCreateLesson from "./PartCourse/FormCreateLesson";
import FormUploadLesson from "./PartCourse/FormUpdateLesson";
import courseApi from "src/api/courseApi";
const useStyles = makeStyles((theme) => ({
  formAddPart: {
    display: "flex",
    alignItems: "center",
    "& > span": {
      minWidth: "150px",
      fontSize: " 16px",
    },
    "& > button": {
      marginLeft: "15px",
    },
    marginBottom: "30px",
    marginTop: "30px",
  },
  contentPart: {
    "& .MuiAccordionDetails-root": {
      display: "flex",
      flexFlow: "column",
    },
    "&>.MuiPaper-elevation1": {
      boxShadow:
        "0px 2px 1px -1px rgba(44, 62, 80,1.0), 0px 1px 1px 0px rgba(44, 62, 80,1.0), 0px 1px 3px 0px rgba(44, 62, 80,1.0)",
    },
  },
  heading: {
    fontSize: "16px",
    fontWeight: 600,
    color: "var(--colorBlack1)",
  },
  accordion: {},
  [theme.breakpoints.down("md")]: {},
}));
const schema = yup.object().shape({
  // firstName: yup.string().required(),
});
function PartCourseForm(props) {
  const classes = useStyles();
  const { dataCourse = {}, changeDataCourse = null } = props;
  let indexLesson = 1;
  const formAddPart = useForm({
    mode: "onBlur",
    defaultValues: {
      namepart: "",
      //idCourse: dataCourse?.id
    },
    resolver: yupResolver(schema),
  });

  const handleOnSubmit = (values) => {
    console.log("PartPost",values);

    (async () => {
      // const formData = new FormData();
      // formData.append("image", values.image);
      const rp = await courseApi.postPart(dataCourse.id, values);
      if (!rp.status) {
        console.log(rp);

        //setDataLearning(rp.learnings);
        //setUpdate(true);
      }
    })();
  };
  const [indexPart, setIndexPart] = useState(() => {
    return Array.from(dataCourse.parts).map((item, index) => ({
      value: index + 1,
      title: index + 1,
    }));
  });
  console.log(indexPart);
  return (
    <CCard>
      <CCardHeader>
        <span className="title">Chỉnh sửa khóa học</span>
      </CCardHeader>
      <CCardBody>
        <div className={classes.contentPart}>
          {Array.from(dataCourse.parts).map((item, index) => (
            <Accordion key={item.id} className={classes.accordion}>
              <AccordionSummary expandIcon={<ExpandMoreIcon />}>
                <span className={classes.heading}>
                  Phần {index + 1} : {item.title}
                </span>
              </AccordionSummary>
              <AccordionDetails>
                {Array.from(item.lessons).map((item1, index1) => (
                  <Accordion key={item1.id}>
                    <AccordionSummary expandIcon={<ExpandMoreIcon />}>
                      <Typography className={classes.heading}>
                        Bài {indexLesson++} : {item1.description}
                      </Typography>
                    </AccordionSummary>
                    <AccordionDetails>
                      <FormUploadLesson dataCourse={dataCourse} item={item1} />
                    </AccordionDetails>
                  </Accordion>
                ))}
                <FormParts
                  dataCourse={dataCourse}
                  item={item}
                  index={index + 1}
                  indexPart={indexPart}
                  onSubmit={handleOnSubmit}
                />
                <FormCreateLesson
                  dataCourse={dataCourse}
                  item={item}
                  index={index + 1}
                  indexPart={indexPart}
                  onSubmit={handleOnSubmit}
                />
              </AccordionDetails>
            </Accordion>
          ))}
        </div>
        <form
          className={classes.formAddPart}
          onSubmit={formAddPart.handleSubmit(handleOnSubmit)}
        >
          <span>Thêm phần khóa học</span>
          <CustomInput
            name="namepart"
            title="Tên phần học"
            label="Tên phần học"
            form={formAddPart}
          />
          <CustomButton type="submit" title="Thêm" />
        </form>
      </CCardBody>
      {/* <CCardFooter></CCardFooter> */}
    </CCard>
  );
}

export default PartCourseForm;
