<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<c:import url="/include/common_head.jsp"></c:import>
<c:import url="/include/common_body_header.jsp" var="body_header"></c:import>
<c:import url="/include/common_body_footer.jsp" var="body_footer"></c:import>
  <body>
    <div id="skip_navi">
      <a href="#container">본문 바로가기</a>
    </div>
    <div id="wrap">
      ${ body_header }
      <main id="container" class="account account_write sub_container">
        <div class="sub_top">
          <div class="inner">
            <p class="location">
              <span>Home</span><span>투자정보</span><span>공고</span>
            </p>
            <h2>공고</h2>
            <div class="board_category_wrap">
              <ul class="board_category">
                <li class="active"><a href="#">결산공고</a></li>
                <li><a href="#">기타공고</a></li>
                <li><a href="#">중앙판교개발</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="contents">
          <div class="inner">
            <div class="tit_wrap">
              <h3>게시글 작성</h3>
              <p><i class="required"></i>는 필수 입력사항입니다.</p>
            </div>
            <div class="board_write">
              <table>
                <!-- thead가 없을 때 caption의 position이 absolute이면 th와 td의 width가 지정이 안되는 버그가 생기므로 common.css에서 caption.nohead에서 position을 statice으로 만들어 주었음 -->
                <caption class="nohead">게시글 작성</caption>
                <tr>
                  <th>이름<i class="required"></i></th>
                  <td><input type="text" required placeholder="김현우"></td>
                </tr>
                <tr>
                  <th>비밀번호<i class="required"></i></th>
                  <td><input type="password" placeholder="****"></td>
                </tr>
                <tr>
                  <th>이메일</th>
                  <td class="email">
                    <input type="text" placeholder="nexonuser"> @
                    <input type="text" placeholder="도메인">
                    <div class="select_wrap">
                      <select name="이메일">
                        <option value="직접입력">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="kakao.com">kakao.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>제목<i class="required"></i></th>
                  <td><input type="text" placeholder="제목을 입력해주세요."></td>
                </tr>
                <tr>
                  <th class="t_area">내용<i class="required"></i></th>
                  <td>
                    <textarea cols="30" rows="20"
                      placeholder="필수 입력사항을 작성하고 입력해주세요.&#10;비방, 욕설, 도배글 등은 서비스 이용 제한의 사유가 됩니다."></textarea>
                  </td>
                </tr>
                <tr>
                  <th>첨부파일</th>
                  <td class="td_flex">
                    <div class="file_wrap">
                      <input type="text" class="file_name" readonly>
                      <input type="file" id="upload" class="blind">
                      <label for="upload">파일선택</label>
                    </div>
                    <p class="file_note">이미지 파일은 10MB 이하 jpg, png, gif, webp 확장자 파일만 올릴 수 있습니다.</p>
                  </td>
                </tr>
              </table>
              <div class="btn_wrap">
                <a href="#" class="write_btn">등록</a>
                <a href="account-list.jsp" class="write_btn cancel_btn">취소</a>
              </div>
            </div>
          </div>
        </div>
      </main>
      ${ body_footer }
    </div>
  </body>
</html>
