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
      <main id="container" class="account sub_container">
        <div class="sub_top">
          <div class="inner">
            <p class="location">
              <span>Home</span><span>투자정보</span><span>공고</span>
            </p>
            <h2>공고</h2>
            <a href="account-write.jsp" class="write_btn">게시물 작성하기</a>
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
            <div class="board_list">
              <table>
                <caption>공고</caption>
                <thead>
                  <tr>
                    <th class="col1">공고제목</th>
                    <th class="col2">등록일</th>
                  </tr>
                  <tr>
                    <td><a href="account-view.jsp">제9기 결산공고</a></td>
                    <td>2024.03.28</td>
                  </tr>
                  <tr>
                    <td><a href="#">제8기 결산공고</a></td>
                    <td>2023.03.24</td>
                  </tr>
                  <tr>
                    <td><a href="#">제7기 결산공고</a></td>
                    <td>2022.03.25</td>
                  </tr>
                  <tr>
                    <td><a href="#">제6기 결산공고</a></td>
                    <td>2021.03.25</td>
                  </tr>
                  <tr>
                    <td><a href="#">제5기 결산공고</a></td>
                    <td>2020.03.27</td>
                  </tr>
                  <tr>
                    <td><a href="#">제4기 결산공고</a></td>
                    <td>2019.03.27</td>
                  </tr>
                  <tr>
                    <td><a href="#">제3기 결산공고</a></td>
                    <td>2018.03.22</td>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
      </main>
      ${ body_footer }
    </div>
  </body>
</html>
