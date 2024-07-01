package com.one.san.user.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.one.san.user.UserService;
import com.one.san.user.UserVO;
import com.one.san.util.Pagination;
import com.one.san.util.PhoneVerification;
import com.one.san.util.VerificationCodeGenerator;

@Service("userService")
public class UserServiceImpl implements UserService {

   @Autowired
   private JavaMailSender mailSender;

   @Autowired
   private UserDAOMybatis userDAO;

   @Autowired
   private BCryptPasswordEncoder passwordEncoder; // 비밀번호 암호화를 위한 Encoder

//  유저 포인트 가져오기
   public UserVO getUserPoint(UserVO vo) {
      return userDAO.getUserPoint(vo);
   }

//유저 포인트 업데이트
   @Override
   public int updatePoint(UserVO vo) {
      return userDAO.updatePoint(vo);
   }

   @Override
   public int insertUser(UserVO vo) {
      String encryptedPassword = passwordEncoder.encode(vo.getU_pw()); // 비밀번호 암호화
      vo.setU_pw(encryptedPassword); // 암호화된 비밀번호로 설정
      return userDAO.insertUser(vo);
   }

   // 장바구니에서 회원정보 가져오기
   @Override
   public UserVO cartSelectUser(UserVO vo) {
      return userDAO.cartSelectUser(vo);
   }

   // 비밀번호 재설정에 사용했음
   @Override
   public int updateUser(UserVO vo) {
      String password = vo.getU_pw();
      password = passwordEncoder.encode(password);
      vo = getUser(vo);
      vo.setU_pw(password); // 암호화된 비밀번호로 설정
      int num = userDAO.updateUser(vo);
      return num;
   }

   // 회원정보수정
   @Override
   public int updateUserData(UserVO vo) {

      if (!(vo.getU_pw().equals(""))) {

         String password = vo.getU_pw();
         password = passwordEncoder.encode(password);
         vo = getUser(vo);
         vo.setU_pw(password);

      }

      int num = userDAO.updateUser(vo);
      return num;
   }

   @Override
   public int deleteUser(UserVO vo) {
      int num = userDAO.deleteUser(vo);
      return num;
   }

   // u_no 를 가지고 유저 정보들 가져옴.
   @Override
   public UserVO getUser(UserVO vo) {
      return userDAO.getUser(vo);
   }

   @Override
   public UserVO selectOne(String selId) {
      return userDAO.selectOne(selId);
   }

   @Override
   public List<UserVO> selectList(Pagination pg) {
      return userDAO.selectList(pg);
   }

   @Override
   public int userTotalCnt(Pagination pg) {
      return userDAO.userTotalCnt(pg);
   }

   @Override
      public String sendVerificationEmail(String email) {
          String verCode = VerificationCodeGenerator.generate();
          try {
              // 메시지 생성
              MimeMessage message = mailSender.createMimeMessage();
              MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8"); // true는 multipart message를 지원하기 위함입니다.
              message.setSubject("산들림 인증 메일");

              // HTML 형식의 내용을 작성합니다.
              String base64Logo = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAABkCAYAAACoy2Z3AAAACXBIWXMAAAsTAAALEwEAmpwYAAANSGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNi4wLWMwMDYgNzkuZGFiYWNiYiwgMjAyMS8wNC8xNC0wMDozOTo0NCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjQgKFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyNC0wNS0wOVQxMzowODo0MiswOTowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyNC0wNS0yMFQxNDo1MTo1MiswOTowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjQtMDUtMjBUMTQ6NTE6NTIrMDk6MDAiIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjdlNzhlNTYzLWNkOTQtMWU0YS1iYTJhLTU4NmQ3MDcwYThlMCIgeG1wTU06RG9jdW1lbnRJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmRjNjY5ZTQ2LTQxMzAtZTQ0OS04ODkyLTQxNDcxNDg1YWQwZCIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOmRiYzI0NDNlLTI2YzItNDY0ZC05MmZkLWZkYWIzMTg3OGM0NSIgdGlmZjpPcmllbnRhdGlvbj0iMSIgdGlmZjpYUmVzb2x1dGlvbj0iNzIwMDAwLzEwMDAwIiB0aWZmOllSZXNvbHV0aW9uPSI3MjAwMDAvMTAwMDAiIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiIGV4aWY6Q29sb3JTcGFjZT0iNjU1MzUiIGV4aWY6UGl4ZWxYRGltZW5zaW9uPSI0MDAiIGV4aWY6UGl4ZWxZRGltZW5zaW9uPSIxMDAiPiA8cGhvdG9zaG9wOlRleHRMYXllcnM+IDxyZGY6QmFnPiA8cmRmOmxpIHBob3Rvc2hvcDpMYXllck5hbWU9IlNBTkRMSU0sIiBwaG90b3Nob3A6TGF5ZXJUZXh0PSJTQU5ETElNLCIvPiA8cmRmOmxpIHBob3Rvc2hvcDpMYXllck5hbWU9IlNBTkRMSU0sIiBwaG90b3Nob3A6TGF5ZXJUZXh0PSJTQU5ETElNLCIvPiA8cmRmOmxpIHBob3Rvc2hvcDpMYXllck5hbWU9IlRIRSAgTE9VTkdFIiBwaG90b3Nob3A6TGF5ZXJUZXh0PSJUSEUgIExPVU5HRSIvPiA8L3JkZjpCYWc+IDwvcGhvdG9zaG9wOlRleHRMYXllcnM+IDxwaG90b3Nob3A6RG9jdW1lbnRBbmNlc3RvcnM+IDxyZGY6QmFnPiA8cmRmOmxpPjZDMjlGQjAzOTA3N0E0RTJEQUJCQTJFODVDQjExODc3PC9yZGY6bGk+IDxyZGY6bGk+N0QxMjc4MkZBMEUyNzI1QjkwOEM5QzNGMTIzQ0UwNkU8L3JkZjpsaT4gPHJkZjpsaT44NEVBQzMwOEJGMDM3RkFCQzkxODUzNEVERTRBRTM0RTwvcmRmOmxpPiA8cmRmOmxpPkY4NzRBQzlGNTk4RTZEQjM2QTA4QUEyMDk4MDIwMzAzPC9yZGY6bGk+IDxyZGY6bGk+YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjI4MjUxMTg4LTE0MzItNDQ0Yi1iNmQ3LTVkOTg4ZGMwYmJhMTwvcmRmOmxpPiA8cmRmOmxpPmFkb2JlOmRvY2lkOnBob3Rvc2hvcDo0N2QzOTllOC1mYzZmLWIzNGYtOWZhZC0yZTAzMjQxYjcyYjM8L3JkZjpsaT4gPC9yZGY6QmFnPiA8L3Bob3Rvc2hvcDpEb2N1bWVudEFuY2VzdG9ycz4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDpkYmMyNDQzZS0yNmMyLTQ2NGQtOTJmZC1mZGFiMzE4NzhjNDUiIHN0RXZ0OndoZW49IjIwMjQtMDUtMDlUMTM6MDg6NDIrMDk6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMi40IChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YmYxMTc3ZTEtMDU4OS0yNjQyLThhMjAtZTIwM2Y4ODRhMmFiIiBzdEV2dDp3aGVuPSIyMDI0LTA1LTA5VDE0OjM4OjExKzA5OjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjIuNCAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjE1N2I0N2ZmLWJhOWQtMjM0OC1iNjlmLTQ0YzE3NTk5YWZlNiIgc3RFdnQ6d2hlbj0iMjAyNC0wNS0yMFQxNDo1MTo1MiswOTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIyLjQgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjb252ZXJ0ZWQiIHN0RXZ0OnBhcmFtZXRlcnM9ImZyb20gYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCB0byBpbWFnZS9wbmciLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249ImRlcml2ZWQiIHN0RXZ0OnBhcmFtZXRlcnM9ImNvbnZlcnRlZCBmcm9tIGFwcGxpY2F0aW9uL3ZuZC5hZG9iZS5waG90b3Nob3AgdG8gaW1hZ2UvcG5nIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo3ZTc4ZTU2My1jZDk0LTFlNGEtYmEyYS01ODZkNzA3MGE4ZTAiIHN0RXZ0OndoZW49IjIwMjQtMDUtMjBUMTQ6NTE6NTIrMDk6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMi40IChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MTU3YjQ3ZmYtYmE5ZC0yMzQ4LWI2OWYtNDRjMTc1OTlhZmU2IiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6MzhlZTQ5MWItYjlmZS0yOTQ5LTg0YTktMTYwZjBkYzNmODFiIiBzdFJlZjpvcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6ZGJjMjQ0M2UtMjZjMi00NjRkLTkyZmQtZmRhYjMxODc4YzQ1Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Z23m9wAAF55JREFUeJztnU9WI7uSh3/0eRvgLsEMdOeuQTM3S6A20BxYArCBBpaADyvAS8BzJtfzq0F5Ce0lVA8yskinM51SKEKpNPGdw3mv6hYpKVNSKELx5+z379/o4uzsrPPvtXDOLQDMAJzTX50DmAPY0g8A7ABsvPebrJ0zDMMwAABNmXE2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";
              
              
              String htmlContent = "<div style='font-family: Arial, sans-serif; line-height: 1.6; text-align: center; width: 70%; margin: auto;'>";
              htmlContent += "<div style='background-color: #f9f9f9; padding: 20px; border: 1px solid #ddd; border-radius: 10px; width: 100%; margin: auto;'>";
              htmlContent += "<img src=" + base64Logo + " alt='산들림 로고' style='width: 200px; margin-bottom: 20px;'>";
              htmlContent += "<h1 style='color: black;'>산들림 아이디/비밀번호 찾기 인증 코드</h1>";
              htmlContent += "<br><br>";
              htmlContent += "<p>안녕하세요,</p>";
              htmlContent += "<p style='font-size: 1.1em;'>요청하신 아이디/비밀번호 찾기를 위한 인증 코드는 아래와 같습니다.</p>";
              htmlContent += "<div style='margin: 20px 0;'>";
              htmlContent += "<span style='font-size: 1.3em; color: #E74C3C; font-weight: bold;'>" + verCode + "</span>";
              htmlContent += "</div>";
              htmlContent += "<p style='font-size: 1.1em;'>인증 코드 유효 시간은 5분입니다.</p>";
              htmlContent += "<p style='font-size: 1.1em;'>감사합니다,<br/>산들림 팀</p>";
              htmlContent += "</div>";
              htmlContent += "<hr style='border: 0; border-top: 1px solid #ddd; margin: 40px 0;'/>";
              htmlContent += "<p style='font-size: 1em; color: #777;'>이 이메일은 발신 전용 이메일입니다. 문의사항은 홈페이지 내 고객센터를 이용해주세요.<br>Copyright © 산들림 All Rights Reserved.</p>";

              helper.setText(htmlContent, true); // true는 HTML 메일을 지원하기 위함입니다.
              message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

              // 메시지 전송
              mailSender.send(message);
          } catch (MessagingException e) {
              e.printStackTrace();
          }
          return verCode;
      }
   @Override
      public String sendVerificationEmailSign(String email) {
          String verCode = VerificationCodeGenerator.generate();
          try {
              // 메시지 생성
              MimeMessage message = mailSender.createMimeMessage();
              MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8"); // true는 multipart message를 지원하기 위함입니다.
              message.setSubject("산들림 회원가입 인증 메일");

              // HTML 형식의 내용을 작성합니다.
              
              String base64Logo = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAABkCAYAAACoy2Z3AAAACXBIWXMAAAsTAAALEwEAmpwYAAANSGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNi4wLWMwMDYgNzkuZGFiYWNiYiwgMjAyMS8wNC8xNC0wMDozOTo0NCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjQgKFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyNC0wNS0wOVQxMzowODo0MiswOTowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyNC0wNS0yMFQxNDo1MTo1MiswOTowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjQtMDUtMjBUMTQ6NTE6NTIrMDk6MDAiIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjdlNzhlNTYzLWNkOTQtMWU0YS1iYTJhLTU4NmQ3MDcwYThlMCIgeG1wTU06RG9jdW1lbnRJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmRjNjY5ZTQ2LTQxMzAtZTQ0OS04ODkyLTQxNDcxNDg1YWQwZCIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOmRiYzI0NDNlLTI2YzItNDY0ZC05MmZkLWZkYWIzMTg3OGM0NSIgdGlmZjpPcmllbnRhdGlvbj0iMSIgdGlmZjpYUmVzb2x1dGlvbj0iNzIwMDAwLzEwMDAwIiB0aWZmOllSZXNvbHV0aW9uPSI3MjAwMDAvMTAwMDAiIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiIGV4aWY6Q29sb3JTcGFjZT0iNjU1MzUiIGV4aWY6UGl4ZWxYRGltZW5zaW9uPSI0MDAiIGV4aWY6UGl4ZWxZRGltZW5zaW9uPSIxMDAiPiA8cGhvdG9zaG9wOlRleHRMYXllcnM+IDxyZGY6QmFnPiA8cmRmOmxpIHBob3Rvc2hvcDpMYXllck5hbWU9IlNBTkRMSU0sIiBwaG90b3Nob3A6TGF5ZXJUZXh0PSJTQU5ETElNLCIvPiA8cmRmOmxpIHBob3Rvc2hvcDpMYXllck5hbWU9IlNBTkRMSU0sIiBwaG90b3Nob3A6TGF5ZXJUZXh0PSJTQU5ETElNLCIvPiA8cmRmOmxpIHBob3Rvc2hvcDpMYXllck5hbWU9IlRIRSAgTE9VTkdFIiBwaG90b3Nob3A6TGF5ZXJUZXh0PSJUSEUgIExPVU5HRSIvPiA8L3JkZjpCYWc+IDwvcGhvdG9zaG9wOlRleHRMYXllcnM+IDxwaG90b3Nob3A6RG9jdW1lbnRBbmNlc3RvcnM+IDxyZGY6QmFnPiA8cmRmOmxpPjZDMjlGQjAzOTA3N0E0RTJEQUJCQTJFODVDQjExODc3PC9yZGY6bGk+IDxyZGY6bGk+N0QxMjc4MkZBMEUyNzI1QjkwOEM5QzNGMTIzQ0UwNkU8L3JkZjpsaT4gPHJkZjpsaT44NEVBQzMwOEJGMDM3RkFCQzkxODUzNEVERTRBRTM0RTwvcmRmOmxpPiA8cmRmOmxpPkY4NzRBQzlGNTk4RTZEQjM2QTA4QUEyMDk4MDIwMzAzPC9yZGY6bGk+IDxyZGY6bGk+YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjI4MjUxMTg4LTE0MzItNDQ0Yi1iNmQ3LTVkOTg4ZGMwYmJhMTwvcmRmOmxpPiA8cmRmOmxpPmFkb2JlOmRvY2lkOnBob3Rvc2hvcDo0N2QzOTllOC1mYzZmLWIzNGYtOWZhZC0yZTAzMjQxYjcyYjM8L3JkZjpsaT4gPC9yZGY6QmFnPiA8L3Bob3Rvc2hvcDpEb2N1bWVudEFuY2VzdG9ycz4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDpkYmMyNDQzZS0yNmMyLTQ2NGQtOTJmZC1mZGFiMzE4NzhjNDUiIHN0RXZ0OndoZW49IjIwMjQtMDUtMDlUMTM6MDg6NDIrMDk6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMi40IChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YmYxMTc3ZTEtMDU4OS0yNjQyLThhMjAtZTIwM2Y4ODRhMmFiIiBzdEV2dDp3aGVuPSIyMDI0LTA1LTA5VDE0OjM4OjExKzA5OjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjIuNCAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjE1N2I0N2ZmLWJhOWQtMjM0OC1iNjlmLTQ0YzE3NTk5YWZlNiIgc3RFdnQ6d2hlbj0iMjAyNC0wNS0yMFQxNDo1MTo1MiswOTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIyLjQgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjb252ZXJ0ZWQiIHN0RXZ0OnBhcmFtZXRlcnM9ImZyb20gYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCB0byBpbWFnZS9wbmciLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249ImRlcml2ZWQiIHN0RXZ0OnBhcmFtZXRlcnM9ImNvbnZlcnRlZCBmcm9tIGFwcGxpY2F0aW9uL3ZuZC5hZG9iZS5waG90b3Nob3AgdG8gaW1hZ2UvcG5nIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo3ZTc4ZTU2My1jZDk0LTFlNGEtYmEyYS01ODZkNzA3MGE4ZTAiIHN0RXZ0OndoZW49IjIwMjQtMDUtMjBUMTQ6NTE6NTIrMDk6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMi40IChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MTU3YjQ3ZmYtYmE5ZC0yMzQ4LWI2OWYtNDRjMTc1OTlhZmU2IiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6MzhlZTQ5MWItYjlmZS0yOTQ5LTg0YTktMTYwZjBkYzNmODFiIiBzdFJlZjpvcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6ZGJjMjQ0M2UtMjZjMi00NjRkLTkyZmQtZmRhYjMxODc4YzQ1Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Z23m9wAAF55JREFUeJztnU9WI7uSh3/0eRvgLsEMdOeuQTM3S6A20BxYArCBBpaADyvAS8BzJtfzq0F5Ce0lVA8yskinM51SKEKpNPGdw3mv6hYpKVNSKELx5+z379/o4uzsrPPvtXDOLQDMAJzTX50DmAPY0g8A7ABsvPebrJ0zDMMwAABNmXE2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";
              
              String htmlContent = "<div style='font-family: Arial, sans-serif; line-height: 1.6; text-align: center; width: 70%; margin: auto;'>";
              htmlContent += "<div style='background-color: #f9f9f9; padding: 20px; border: 1px solid #ddd; border-radius: 10px; width: 100%; margin: auto;'>";
              htmlContent += "<img src=" + base64Logo + " alt='산들림 로고' style='width: 200px; margin-bottom: 20px;'>";
              htmlContent += "<h1 style='color: black;'>산들림 회원가입 인증 코드</h1>";
              htmlContent += "<br><br>";
              htmlContent += "<p>안녕하세요,</p>";
              htmlContent += "<p style='font-size: 1.1em;'>산들림에 가입해주셔서 감사합니다! 아래의 인증 코드를 사용하여 회원가입을 완료해주세요.</p>";
              htmlContent += "<div style='margin: 20px 0;'>";
              htmlContent += "<span style='font-size: 1.3em; color: #E74C3C; font-weight: bold;'>" + verCode + "</span>";
              htmlContent += "</div>";
              htmlContent += "<p style='font-size: 1.1em;'>인증 코드 유효 시간은 3분입니다.</p>";
              htmlContent += "<p style='font-size: 1.1em;'>감사합니다,<br/>산들림 팀</p>";
              htmlContent += "</div>";
              htmlContent += "<hr style='border: 0; border-top: 1px solid #ddd; margin: 40px 0;'/>";
              htmlContent += "<p style='font-size: 1em; color: #777;'>이 이메일은 발신 전용 이메일입니다. 문의사항은 홈페이지 내 고객센터를 이용해주세요.<br>Copyright © 산들림 All Rights Reserved.</p>";

              helper.setText(htmlContent, true); // true는 HTML 메일을 지원하기 위함입니다.
              message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

              // 메시지 전송
              mailSender.send(message);
          } catch (MessagingException e) {
              e.printStackTrace();
          }
          return verCode;
      }
   public boolean verifyEmailCode(String inputCode, String emailCode) {
      return emailCode.equals(inputCode);
   }

   @Override
   public String findIdOutput(String name, String email) {
      // findUser에 보내주려고 맵형식으로 만들어줌
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("u_name", name);
      map.put("u_email", email);

      String uId = null;
      uId = userDAO.findUser(map);

      return uId;
   }

   @Override
   public UserVO selectPhno(String selId) {
      return userDAO.selectPhno(selId);
   }

   @Override
   public UserVO selectEmail(String selId) {
      return userDAO.selectEmail(selId);
   }

   @Override
   public UserVO selectPhno(String id, String phno) {

      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("u_id", id);
      map.put("u_phno", phno);

      return userDAO.selectPhno2(map);
   }

   @Override
   public UserVO selectEmail(String id, String email) {

      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("u_id", id);
      map.put("u_email", email);

      return userDAO.selectEmail2(map);
   }

   @Override
   public String sendsms(String phno) {

        String random = VerificationCodeGenerator.generate();
         String api_key = "NCS665AHFZ154SIC";
         String api_secret = "XN4S35RRONVXBNYLEPFLP0UUPXMMJBPC";
         
         PhoneVerification ph = new PhoneVerification(phno);
         
         ph.phoneVerfMethod(random, api_key, api_secret);

        return random;/* 비교를 위해 인증 번호를 돌려받아야함 */

   }

   // 로그인용
   @Override
   public UserVO getLogin(UserVO vo) {
      UserVO user = userDAO.getUser(vo);

      if (user != null) {
         boolean isMatch = passwordEncoder.matches(vo.getU_pw(), user.getU_pw());
         if (isMatch) {
            return user;
         }
      }

      return null;
   }

   public UserVO chkSocialLogin(UserVO vo) {

      return userDAO.getUser(vo);
   }
   
   @Override
    public boolean selectPw(String id, String pw) {
       boolean isMatch = passwordEncoder.matches(pw,userDAO.findUserPw(id));
       return isMatch;
    }
   
   @Override
   public Map<String, Long> selectSignUpStatistics() {
      return userDAO.selectSignUpStatistics();
   }
   
   @Override
   public void updateUserStatus() {
      userDAO.updateUserStatus();
   }
   
   @Override
   public Map<String, BigDecimal> selectAgeStatistics() {
      return userDAO.selectAgeStatistics();
   }

}