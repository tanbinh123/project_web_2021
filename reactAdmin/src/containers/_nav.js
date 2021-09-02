import React from "react";
import CIcon from "@coreui/icons-react";
import { freeSet, cilBook } from "@coreui/icons";

const _nav = [
  {
    _tag: "CSidebarNavItem",
    name: "Thống Kê",
    to: "/dashboard",
    icon: <CIcon name="cil-speedometer" customClasses="c-sidebar-nav-icon" />,
    badge: {
      color: "info",
      text: "NEW",
    },
  },
  {
    _tag: "CSidebarNavTitle",
    _children: ["Danh Sách"],
  },
  {
    _tag: "CSidebarNavItem",
    name: "Khóa học",
    to: "/list/course",
    icon: (
      <CIcon content={freeSet.cilBook} customClasses="c-sidebar-nav-icon" />
    ),
  },
  {
    _tag: "CSidebarNavItem",
    name: "Thể loại",
    to: "/list/categories",
    icon: (
      <CIcon
        content={freeSet.cilMediaPlay}
        customClasses="c-sidebar-nav-icon"
      />
    ),
  },
  {
    _tag: "CSidebarNavItem",
    name: "Tài khoản",
    to: "/list/user",
    icon: (
      <CIcon content={freeSet.cilUser} customClasses="c-sidebar-nav-icon" />
    ),
  },
  {
    _tag: "CSidebarNavItem",
    name: "Hình nền trang chủ",
    to: "/list/image-background-home",
    icon: (
      <CIcon content={freeSet.cilImage} customClasses="c-sidebar-nav-icon" />
    ),
  },
  {
    _tag: "CSidebarNavTitle",
    _children: ["Form tạo mới"],
  },
  {
    _tag: "CSidebarNavItem",
    name: "Tạo mới khóa học",
    to: "/form/course",
    icon: (
      <CIcon content={freeSet.cilBook} customClasses="c-sidebar-nav-icon" />
    ),
  },
  {
    _tag: "CSidebarNavItem",
    name: "Tạo mới thể loại",
    to: "/form/categorie",
    icon: (
      <CIcon
        content={freeSet.cilMediaPlay}
        customClasses="c-sidebar-nav-icon"
      />
    ),
  },
  {
    _tag: "CSidebarNavItem",
    name: "Form upload hình nền trang chủ",
    to: "/form/image-background-home",
    icon: (
      <CIcon
        content={freeSet.cilMediaPlay}
        customClasses="c-sidebar-nav-icon"
      />
    ),
  },
];

export default _nav;
