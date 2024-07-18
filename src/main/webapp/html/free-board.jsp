<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="format-detcntion" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="PC, 모바일, 콘솔 플랫폼을 아우르는 다양한 장르의 게임을 개발하는 게임 개발사입니다.">
    <meta name="keywords" content="넥슨게임즈">
    <meta property="og:title" content="넥슨게임즈">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://www.nexongames.co.kr">
    <meta property="og:site_name" content="넥슨게임즈">
    <meta property="og:description" content="넥슨게임즈">
    <link rel="shortcut icon" href="images/favicon/favicon.ico?v=2">
    <link rel="apple-touch-icon-precomposed" href="images/favicon/favicon.ico?v=2">
    <title>게시글 작성 | 넥슨게임즈</title>
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link rel="stylesheet" href="css/swiper-bundle.min.css">
    <link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/sub.css?v=<?php echo time(); ?>">
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/swiper-bundle.min.js"></script>
    <script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
  </head>
  <body>
    <div id="skip_navi">
      <a href="#container">본문 바로가기</a>
    </div>
    <div id="wrap">
      <header id="header">
        <h1 class="logo">
          <a href="index.jsp">
            <img src="images/main_logo.png" alt="메인로고">
          </a>
        </h1>
        <nav class="gnb_wrap">
          <ul class="gnb">
            <li>
              <a href="#">넥슨게임즈</a>
              <ul class="depth2">
                <li><a href="#">넥슨게임즈</a></li>
              </ul>
            </li>
            <li>
              <a href="#">게임</a>
              <ul class="depth2">
                <li><a href="#">V4</a></li>
                <li><a href="#">서든어택</a></li>
                <li><a href="#">블루 아카이브</a></li>
                <li><a href="#">히트2</a></li>
                <li><a href="#">퍼스트 디센던트</a></li>
                <li><a href="#">갓썸</a></li>
              </ul>
            </li>
            <li>
              <a href="#">인재채용</a>
              <ul class="depth2">
                <li><a href="#">기업문화</a></li>
                <li><a href="#">피플&컬쳐</a></li>
                <li><a href="#">복지</a></li>
                <li><a href="#">채용</a></li>
              </ul>
            </li>
            <li>
              <a href="corporate-governance.jsp">투자정보</a>
              <ul class="depth2">
                <li><a href="corporate-governance.jsp">기업지배구조</a></li>
                <li><a href="#">주가정보</a></li>
                <li><a href="#">재무정보</a></li>
                <li><a href="#">공시/실적</a></li>
                <li><a href="account-list.jsp">공고</a></li>
              </ul>
            </li>
            <li>
              <a href="#">미디어</a>
              <ul class="depth2">
                <li><a href="#">뉴스</a></li>
                <li><a href="#">보도자료</a></li>
                <li><a href="#">멀티미디어</a></li>
              </ul>
            </li>
          </ul>
        </nav>
        <div class="lang_wrap">
          <a href="#" class="blog"
            ><img src="images/blog_icon.png" alt="블로그"
         ></a>
          <a class="login" href="login.jsp">로그인</a>
          <ul class="lang">
            <li><a href="#" class="active">KOR</a></li>
            <li><a href="#" class="eng">ENG</a></li>
          </ul>
          <button type="button" class="open_btn">
            <span class="blind">메뉴 열기</span>
            <i class="fa-solid fa-bars"></i>
          </button>
        </div>
        <aside class="m_gnb_wrap">
          <div class="scroll">
            <ul class="m_gnb">
              <li>
                <a href="#">넥슨게임즈</a>
                <ul class="depth2">
                  <li><a href="#">넥슨게임즈</a></li>
                </ul>
              </li>
              <li>
                <a href="#">게임</a>
                <ul class="depth2">
                  <li><a href="#">V4</a></li>
                  <li><a href="#">서든어택</a></li>
                  <li><a href="#">블루 아카이브</a></li>
                  <li><a href="#">히트2</a></li>
                  <li><a href="#">퍼스트 디센던트</a></li>
                  <li><a href="#">갓썸</a></li>
                </ul>
              </li>
              <li>
                <a href="#">인재채용</a>
                <ul class="depth2">
                  <li><a href="#">기업문화</a></li>
                  <li><a href="#">피플&컬쳐</a></li>
                  <li><a href="#">복지</a></li>
                  <li><a href="#">채용</a></li>
                </ul>
              </li>
              <li>
                <a href="corporate-governance.jsp">투자정보</a>
                <ul class="depth2">
                  <li><a href="corporate-governance.jsp">기업지배구조</a></li>
                  <li><a href="#">주가정보</a></li>
                  <li><a href="#">재무정보</a></li>
                  <li><a href="#">공시/실적</a></li>
                  <li><a href="account-list.jsp">공고</a></li>
                </ul>
              </li>
              <li>
                <a href="#">미디어</a>
                <ul class="depth2">
                  <li><a href="#">뉴스</a></li>
                  <li><a href="#">보도자료</a></li>
                  <li><a href="#">멀티미디어</a></li>
                </ul>
              </li>
            </ul>
            <div class="m_lang_wrap">
              <ul class="m_lang">
                <li><a href="#" class="active">KOR</a></li>
                <li><a href="#" class="eng">ENG</a></li>
              </ul>
            </div>
          </div>
          <button type="button" class="close_btn">
            <span class="blind">메뉴 닫기</span>
            <i class="fa-solid fa-xmark"></i>
          </button>
        </aside>
      </header>
      <main id="container" class="account account_write sub_container">
        <div class="contents">
				<div class="inner">
					<div class="tit_wrap">
						<h3>자유게시판</h3>
					</div>
					<div class="board_list">
						<!-- 게시물 검색 폼 -->
						<form method="get">
							<table border="1" width="90%">
								<tr>
									<td align="center">
										<select name="searchField">
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="name">작성자</option>
										</select>
										<input type="text" name="searchWord" /> <input type="submit" value="검색하기" />
									</td>
								</tr>
							</table>
						</form>
						<!-- 게시물 목록 테이블 -->
						<table border="1" width="90%">
							<tr>
								<th width="10%">번호</th>
								<th width="*">제목</th>
								<th width="15%">작성자</th>
								<th width="10%">조회수</th>
								<th width="15%">작성일</th>
							</tr>
							<!-- 검색어 조건에 따라 게시물이 있는지 확인하기 위해 choose 태그 사용 -->
							<c:choose>
								<c:when test="${ empty boardLists }">
									<!-- List에 저장된 게시물이 없는 경우 -->
									<tr>
										<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${ boardLists }" var="row" varStatus="loop">
										<!-- 출력할 게시물이 있을때 -->
										<tr align="center">
											<td>
												<!-- 가상번호 -->
												${ map.totalCount - (((map.pageNum - 1) * map.pageSize)
		            						+ loop.index)}
											</td>
											<td align="left">
												<a href="../mvcboard/view.do?idx=${ row.idx }"> ${ row.title } </a>
											</td>
											<td>${ row.name }</td>
											<td>${ row.visitcount }</td>
											<td>${ row.postDate }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>

						<!-- 하단 메뉴(바로가기, 글쓰기) -->
						<table border="1" width="90%">
							<tr align="center">
								<td>
									<!-- 페이지바로가기 링크 출력 -->
									${ map.pagingImg }
								</td>
								<td width="100">
									<button type="button" onclick="location.href='../free-board-write.do';">글쓰기</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
      </main>
      <footer id="footer">
        <div class="inner">
          <div class="footer_top">
            <div class="col_left">
              <h2 class="logo">
                <a href="index.jsp">
                  <img src="images/footer_logo.png" alt="넥슨">
                </a>
              </h2>
              <div class="footer_info_wrap">
                <p class="address">
                  넥슨게임즈 SEOUL<br>
                  서울특별시 강남구 남부순환로 2621 디앤오 강남빌딩 5층
                </p>
                <p class="address">
                  넥슨게임즈 PANGYO<br>
                  경기 성남시 분당구 판교로 256번길 25 판교 테크노벨리
                </p>
                <a href="https://www.gdweb.co.kr/sub/view.asp?displayrow=60&Txt_key=all&Txt_word=&Txt_agnumber=&Txt_fgbn=5&Txt_bcode1=020810001&Txt_gbflag=&Txt_bcode2=&Txt_bcode3=&Txt_bcode4=&Txt_bcode5=&Page=1&str_no=17268" target="_blank" title="새창 열림" class="award">
                  <img src="images/winner_logo.jpg" alt="어워드">
                </a>
              </div>
            </div>
            <div class="col_right">
              <ul class="footer_menu">
                <li>
                  <a href="#">넥슨게임즈</a>
                  <ul class="menu_list">
                    <li><a href="#">넥슨게임즈</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#">게임</a>
                  <ul class="menu_list">
                    <li><a href="#">V4</a></li>
                    <li><a href="#">서든어택</a></li>
                    <li><a href="#">블루 아카이브</a></li>
                    <li><a href="#">히트2</a></li>
                    <li><a href="#">퍼스트 디센던트</a></li>
                    <li><a href="#">갓썸</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#">인재채용</a>
                  <ul class="menu_list">
                    <li><a href="#">기업문화</a></li>
                    <li><a href="#">피플&amp;컬처</a></li>
                    <li><a href="#">복지</a></li>
                    <li><a href="#">채용</a></li>
                  </ul>
                </li>
                <li>
                  <a href="corporate-governance.jsp">투자정보</a>
                  <ul class="menu_list">
                    <li>
                      <a href="corporate-governance.jsp">기업지배구조</a>
                    </li>
                    <li><a href="#">주가정보</a></li>
                    <li><a href="#">재무정보</a></li>
                    <li><a href="#">공시/실적</a></li>
                    <li><a href="account-list.jsp">공고</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#">미디어</a>
                  <ul class="menu_list">
                    <li><a href="#">뉴스</a></li>
                    <li><a href="#">보도자료</a></li>
                    <li><a href="#">멀티미디어</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
          <div class="footer_bottom">
            <p class="copyright">©NEXON Games All Rights Reserved.</p>
            <div class="family_wrap">
              <button type="button" class="family_btn">관련사이트</button>
              <ul class="family">
                <li><a href="#">넥슨코리아</a></li>
                <li><a href="#">넥슨</a></li>
                <li><a href="#">네오플</a></li>
                <li><a href="#">넥슨커뮤니케이션즈</a></li>
                <li><a href="#">엔미디어플랫폼</a></li>
                <li><a href="#">넥슨스페이스</a></li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </body>
</html>
