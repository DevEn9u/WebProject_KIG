<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<c:import url="/include/common_head.jsp"></c:import>
<c:import url="/include/common_body_header.jsp" var="body_header"></c:import>
<c:import url="/include/common_body_footer.jsp" var="body_footer"></c:import>
<c:import url="isLoggedIn.jsp"></c:import>
<c:import url="/include/common_board_write_validate_form.jsp"></c:import>
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
              <span>Home</span><span>커뮤니티</span><span>자유게시판</span>
            </p>
            <h2>자료실</h2>
            <div class="board_category_wrap">
              <ul class="board_category">
                <li><a href="../free-board/list.do">자유게시판</a></li>
                <li><a href="../qna-board/list.do">QnA</a></li>
                <li class="active"><a href="../download-board/list.do">자료실</a></li>
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
              <form name="writeFrm" method="post" enctype="multipart/form-data"
              	 action="../download-board/write.do"
             	 onsubmit="return validateForm(this)">
              <table>
                <caption class="nohead">게시글 작성</caption>
                <tr>
                  <th>이름<i class="required"></i></th>
                  <td><input type="text" name="name" readonly="readonly" value="${ UserName }"></td>
                </tr>
                <tr>
                  <th>제목<i class="required"></i></th>
                  <td><input type="text" name="title" placeholder="제목을 입력해주세요."></td>
                </tr>
                <tr>
                  <th class="t_area">내용<i class="required"></i></th>
                  <td>
                    <textarea cols="30" rows="20" name="content"
                      placeholder="필수 입력사항을 작성하고 입력해주세요.&#10;비방, 욕설, 도배글 등은 서비스 이용 제한의 사유가 됩니다."></textarea>
                  </td>
                </tr>
                <tr>
                  <th>첨부파일</th>
                  <td class="td_flex">
                    <div class="file_wrap">
<!-- 					<input type="text" class="file_name" readonly> -->
                      <input type="file" class="file_name" id="upload" name="ofile">
                      <label for="upload">파일선택</label>
                    </div>
                    <p class="file_note">이미지 파일은 10MB 이하 jpg, png, gif, webp 확장자 파일만 올릴 수 있습니다.</p>
                  </td>
                </tr>
              </table>
              <div class="btn_wrap">
                 <button type="submit" class="write_btn">등록</button>
                 <button type="reset" class="write_btn cancel_btn">다시쓰기</button>
                 <button type="button" onclick="location.href='../download-board/list.do';" class="write_btn cancel_btn">목록</button>
              </div>
              </form>
            </div>
          </div>
        </div>
      </main>
      ${ body_footer }
    </div>
  </body>
</html>
