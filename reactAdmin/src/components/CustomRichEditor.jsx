import React, { Component } from "react";
import { EditorState, convertToRaw, ContentState } from "draft-js";
import { Editor } from "react-draft-wysiwyg";
import draftToHtml from "draftjs-to-html";
import htmlToDraft from "html-to-draftjs";
import "../../node_modules/react-draft-wysiwyg/dist/react-draft-wysiwyg.css";
import { isEmpty } from "src/Tool/Tools";
// import ReactHtmlParser from 'react-html-parser';

class CustomRichEditor extends Component {
  constructor(props) {
    super(props);
    const { value } = props;
    const html = isEmpty(value) ? "" : value;
    const contentBlock = htmlToDraft(html);
    if (contentBlock) {
      const contentState = ContentState.createFromBlockArray(
        contentBlock.contentBlocks
      );
      const editorState = EditorState.createWithContent(contentState);
      this.state = {
        editorState,
      };
    }
  }

  onEditorStateChange = (editorState) => {
    if (this.props.onChange)
      this.props.onChange(
        draftToHtml(convertToRaw(editorState.getCurrentContent()))
      );
    this.setState({
      editorState,
    });
  };

  render() {
    const { editorState } = this.state;
    return (
      <div>
        <Editor
          editorState={editorState}
          wrapperClassName="demo-wrapper"
          editorClassName="demo-editor"
          onEditorStateChange={this.onEditorStateChange}
        />
        {/* <h3>Preview:</h3> */}
        {/*ReactHtmlParser(draftToHtml(convertToRaw(editorState.getCurrentContent())))*/}
        {/* {draftToHtml(convertToRaw(editorState.getCurrentContent()))} */}
      </div>
    );
  }
}

export default CustomRichEditor;
