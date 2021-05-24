import React from "react";
import PropTypes from "prop-types";

HomeAdmin.propTypes = {};

function HomeAdmin(props) {
  return (
    <div>
      Home Admin
      <br />
      <ul>
        <li>
          Click <a href="http://localhost:25001/admin">Link</a> to jsp
        </li>
        <li>
          Click <a href="http://localhost:25001/admin/charts">Link</a> to Charts
        </li>
      
      </ul>
    </div>
  );
}

export default HomeAdmin;
