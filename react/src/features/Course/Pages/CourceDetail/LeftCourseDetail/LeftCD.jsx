import { Grid } from "@material-ui/core";
import { CheckCircle, FiberManualRecord } from "@material-ui/icons";
import React from "react";
import IconBreadcrumbs from "../../../../../components/Breadcrumbs/Breadcrumbs";
import SimpleAccordion from "../../../../../components/SimpleAccordion/SimpleAccordion";
import LeftCDCSS from "./CSSLeftCD";

LeftCD.propTypes = {};

function LeftCD(props) {
  const classes = LeftCDCSS();
  return (
    <div className={classes.root}>
      <Grid container spacing={3}>
        <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
          <IconBreadcrumbs />
        </Grid>
        <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
          <div className={classes.introduce}>
            <h1>Kiến thức cơ bản, cốt lõi dân IT cần học trước</h1>
            <span>
              Khóa học này sẽ giúp bạn nắm chắc tư tưởng cốt lõi của việc xây
              dựng giao diện website responsive và áp dụng trong thực tế
            </span>
            <h2>Bạn sẽ học được gì</h2>
            <ul>
              <li>
                <CheckCircle />
                <span>Các kiến thức cơ bản, nền móng của ngành IT</span>
              </li>
              <li>
                <CheckCircle />
                <span>
                  Các khái niệm, thuật ngữ cốt lõi khi triển khai ứng dụng
                </span>
              </li>
              <li>
                <CheckCircle />
                <span>
                  Các mô hình, kiến trúc cơ bản khi triển khai ứng dụng
                </span>
              </li>
              <li>
                <CheckCircle />
                <span>Hiểu hơn về cách internet và máy vi tính hoạt động</span>
              </li>
            </ul>
          </div>
        </Grid>
        <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
          <div className={classes.contentCourse}>
            <h2>Nội dung khóa học</h2>
            <ul>
              <li>? phần</li>
              <li>
                <FiberManualRecord />
              </li>
              <li>? bài học</li>
              <li>
                <FiberManualRecord />
              </li>
              <li>thời lượng ? giờ ? phút</li>
            </ul>
          </div>
          <SimpleAccordion />
        </Grid>
      </Grid>
    </div>
  );
}

export default LeftCD;
