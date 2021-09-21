import { useParams } from "react-router-dom";
import courseApi from "src/api/courseApi";
import "./DetailCourse.scss";
import BaseCourseForm from "./components/BaseCourseForm";
import { useEffect, useState } from "react";
import { Grid } from "@material-ui/core";
import PosterCourseForm from "./components/PosterCourseForm";
import DemoCourseForm from "./components/DemoCourseForm";
import LearningCourseForm from "./components/LearningCourseForm";
import PartCourseForm from "./components/PartCourseForm";

const DetailCourse = () => {
  const { id } = useParams();
  const [dataCourse, setDataCourse] = useState();
  useEffect(() => {
    (async () => {
      const res = await courseApi.get(id);
      // console.log(res);
      setDataCourse(res);
    })();
    return () => {
      setDataCourse();
    };
  }, []);
  const handleChangeDataCourse = (value) => {
    setDataCourse(value);
  };
  return (
    <>
      <Grid container className="root" spacing={3}>
        <Grid item xl={6} lg={6} md={6} xs={12} sm={12}>
          {dataCourse && (
            <BaseCourseForm
              dataCourse={dataCourse}
              changeDataCourse={handleChangeDataCourse}
            />
          )}
        </Grid>
        <Grid item xl={6} lg={6} md={6} xs={12} sm={12}>
          {dataCourse && (
            <LearningCourseForm
              dataCourse={dataCourse}
              changeDataCourse={handleChangeDataCourse}
            />
          )}
        </Grid>
        <Grid item xl={6} lg={6} md={6} xs={12} sm={12}>
          {dataCourse && (
            <PosterCourseForm
              dataCourse={dataCourse}
              changeDataCourse={handleChangeDataCourse}
            />
          )}
        </Grid>
        <Grid item xl={6} lg={6} md={6} xs={12} sm={12}>
          {dataCourse && (
            <DemoCourseForm
              dataCourse={dataCourse}
              changeDataCourse={handleChangeDataCourse}
            />
          )}
        </Grid>

        <Grid item xl={12} lg={12} md={12} xs={12} sm={12}>
          {dataCourse && (
            <PartCourseForm
              dataCourse={dataCourse}
              changeDataCourse={handleChangeDataCourse}
            />
          )}
        </Grid>
      </Grid>
    </>
  );
};

export default DetailCourse;
