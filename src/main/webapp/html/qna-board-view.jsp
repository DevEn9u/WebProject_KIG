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
      <main id="container" class="account account_view sub_container">
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
            <div class="board_view">
              <div class="tit_wrap">
                <h3>제9기 결산공고</h3>
                <p class="date">2024.03.28</p>
              </div>
              <div class="view_con">
                <span>게시물 내용</span>
              </div>
              <dl class="file_down">
                <dt>첨부파일 :</dt>
                <dd><a href="#">제9기 넥슨게임즈 결산공고별도.pdf</a></dd>
              </dl>
              <dl class="file_down">
                <dt>첨부파일 :</dt>
                <dd><a href="#">제9기 넥슨게임즈 결산공고연결.pdf</a></dd>
              </dl>
              <ul class="paging">
                <li class="prev_paging">
                  <em>이전글</em>
                  <p>등록된 게시물이 없습니다.</p>
                </li>
                <li class="next_paging">
                  <a href="#">제8기 결산공고</a>
                  <em>다음글</em>
                </li>
              </ul>
              <div class="btn_wrap">
                <a href="account-list.jsp" class="list_btn">목록으로</a>
              </div>
            </div>
          </div>
        </div>
      </main>
      ${ body_footer }
    </div>
  </body>
</html>
