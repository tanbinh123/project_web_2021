import React from "react";
import axios, { post } from "axios";

class SimpleReactFileUpload extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      file: null,
    };
    this.onFormSubmit = this.onFormSubmit.bind(this);
    this.onChange = this.onChange.bind(this);
    this.fileUpload = this.fileUpload.bind(this);
  }

  onFormSubmit(e) {
    e.preventDefault(); // Stop form submit
    this.fileUpload(this.state.file).then((response) => {
      console.log(response.data);
    });
  }

  onChange(e) {
    this.setState({ file: e.target.files[0] });
  }

  async fileUpload(file) {
    const url = "http://192.168.0.222:8080/test/upload/filepart";
    const formData = new FormData();
    formData.append("file", file);
    formData.append("name", "sang");
    const config = {
      headers: {
        "content-type": "multipart/form-data",
      },
    };
    return post(url, formData, config);
  }

  render() {
    return (
      <form onSubmit={this.onFormSubmit}>
        <h1>File Upload</h1>
        <input type="text" name="name" />
        <input type="file" name="file" onChange={this.onChange} />
        <button type="submit">Upload</button>
      </form>
    );
  }
}

export default SimpleReactFileUpload;
