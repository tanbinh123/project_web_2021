import React from "react";

function VideoLecture(props) {
  const { video } = props;
  console.log("video", video);
  return (
    <div className="videoRoot">
      <span>
        <i className="fas fa-angle-double-left"></i> Xem danh sách bài học
      </span>

      <video
        autoPlay
        //  muted
        loop
        className="video"
        controls
      >
        <source src={video} type="video/mp4"></source>
      </video>
    </div>
  );
}

export default VideoLecture;
