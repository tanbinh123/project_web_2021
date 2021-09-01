import { Tooltip } from '@material-ui/core';
import React from 'react';
import { Link } from 'react-router-dom';
import Tool, { validateEmail } from '../tools/Tools';

function Footer() {
  return (
    <div className="footer">
      <div className="center">
        <div className="card">
          <img className="logo" src="./assets/images/Logo.png" />
          <p className="text">
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Illum,
            doloremque?
          </p>
          <p className="title">Theo dõi chúng tôi</p>
          <div className="social">
            <ul>
              <li className="blue">
                <a
                  href="http://fb.com/nguyenhuythanhsang"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  <i className="fab fa-facebook"></i>
                </a>
              </li>
              <li className="red">
                <a href="mailto:anonkill1999@gmail.com">
                  <i className="fas fa-envelope"></i>
                </a>
              </li>
              <li className="green">
                <a href="tel:+84375094399">
                  <i className="fab fa-whatsapp"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div className="left">
          <div className="student">
            <div className="icon">
              <i className="fas fa-user-graduate"></i>
            </div>
            <div className="student-right">
              <div className="title">Số lượng học viên</div>
              <div className="text">10+ học viên</div>
            </div>
          </div>
          <div className="link">
            <h3>Liên kết thường sử dụng</h3>
            <ul>
              <li>
                <Link to="/abc">Trang Chủ</Link>
              </li>
              <li>
                <Link to="/abc">Khóa học</Link>
              </li>
              <li>
                <Link to="/abc">Đăng kí</Link>
              </li>
            </ul>
          </div>
        </div>
        <div className="right">
          <a href="tel:+0375094399" className="phone">
            <div className="icon">
              <i className="fas fa-phone"></i>
            </div>
            <div className="phone-right">
              <div className="title">037 509 4399</div>
              <div className="text">Gọi cho chúng tôi</div>
            </div>
          </a>
          <div className="subcribe">
            <h3 className="title">Liên hệ qua mail</h3>
            <p className="description">Hãy liên hệ chúng tôi qua email.</p>
            <form
              className="input-email"
              onSubmit={(e) => {
                e.preventDefault();
                const content = e.target[0].value;
                if (validateEmail(content)) {
                  window.location.href = `mailto:anonkill1999@gmail.com?subject=Subcribe&body=${content}`;
                  e.target[0].value = '';
                }
              }}
            >
              <input type="text" placeholder="Email của bạn" />
              <button className="btn-email" type="submit">
                <i className="fas fa-paper-plane"></i>
              </button>
            </form>
          </div>
        </div>
      </div>
      <div className="bottom">
        <div className="copyright">
          Copyright @2021. Đây là sản phẩm học tập
        </div>
        <div className="social">
          <ul>
            <li>
              <a
                href="http://Fb.com/nguyenhuythanhsang"
                target="_blank"
                rel="noopener noreferrer"
              >
                <i className="fab fa-facebook blue"></i>
                <span>Fb.com/nguyenhuythanhsang</span>
              </a>
            </li>
            <li>
              <a
                href="http://fb.com/Hearter.Zouest"
                target="_blank"
                rel="noopener noreferrer"
              >
                <i className="fab fa-facebook green"></i>
                <span>Fb.com/Hearter.Zouest</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  );
}

export default Footer;
