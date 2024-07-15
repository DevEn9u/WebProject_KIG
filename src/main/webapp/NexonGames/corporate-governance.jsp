<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <title>기업지배구조 | 넥슨게임즈</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
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
          <li>
            <a href="#">커뮤니티</a>
            <ul class="depth2">
              <li><a href="free-board.jsp">자유게시판</a></li>
              <li><a href="qna-board.jsp">QnA</a></li>
              <li><a href="download-board.jsp">자료실</a></li>
            </ul>
          </li>
        </ul>
      </nav>
      <div class="lang_wrap">
        <a href="#" class="blog"><img src="images/blog_icon.png" alt="블로그"></a>
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
              <a href="#">투자정보</a>
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
            <li>
              <a href="#">커뮤니티</a>
              <ul class="depth2">
                <li><a href="free-board.jsp">자유게시판</a></li>
                <li><a href="qna-board.jsp">QnA</a></li>
                <li><a href="download-board.jsp">자료실</a></li>
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
    <main id="container" class="governance sub_container">
      <div class="sub_top">
        <div class="inner">
          <p class="location">
            <span>Home</span><span>투자정보</span><span>기업지배구조</span>
          </p>
          <h2>기업지배구조</h2>
        </div>
      </div>
      <div class="contents">
        <div class="inner">     
          <div class="tit_wrap">
            <h3>주주 구성</h3>
            <div class="stock_total">
              <p>총 발행주식 수</p>
              <strong>65,794,770</strong>
            </div>
          </div>
          <div class="stock_wrap">
            <div class="tit_wrap stock_holder_total">
              <h3>주주 현황</h3>
              <div class="date">
                <p>2023.12.31 기준</p>
              </div>
            </div>
            <div class="tbl">
              <table>
                <caption>주요 주주</caption>
                <thead>
                  <tr>
                    <th class="col1">주요 주주</th>
                    <th class="col2">주식 수</th>
                    <th class="col3">비율</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>넥슨코리아</td>
                    <td>39,524,879</td>
                    <td>60.07%</td>
                  </tr>
                  <tr>
                    <td>박용현</td>
                    <td>2,215,549</td>
                    <td>3.37%</td>
                  </tr>
                  <tr>
                    <td>자기주식</td>
                    <td>1,951,939</td>
                    <td>2.97%</td>
                  </tr>
                  <tr>
                    <td>기타</td>
                    <td>22,102,403</td>
                    <td>33.59%</td>
                  </tr>
                  <tr class="total">
                    <td>합계</td>
                    <td>65,794,770</td>
                    <td>100%</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="tit_wrap council">
              <h3>이사회 구성</h3>
            </div>
            <div class="tbl council">
              <table>
                <caption>이사회 구성</caption>
                <thead>
                  <tr>
                    <th class="col1">구분</th>
                    <th class="col2">성명</th>
                    <th class="col3">담당업무</th>
                    <th class="col4">약력</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>사내이사(대표이사)</td>
                    <td>박용현</td>
                    <td>대표이사(이사회 의장)</td>
                    <td>
                      <span>(주)엔씨소프트 실장</span>
                      <span>(주)블루홀스튜디오 실장</span>
                      <span>(주)CJ라다스튜디오 PD</span>
                      <span>現) (주)중앙판교개발 대표이사</span>
                      <span>現) (주)넥슨게임즈 대표이사</span>
                    </td>
                  </tr>
                  <tr>
                    <td>사내이사</td>
                    <td>강인수</td>
                    <td>CFO</td>
                    <td>
                      <span>(주)넥슨코리아 지원본부장</span>
                      <span>(주)넥슨커뮤니케이션즈 대표이사</span>
                      <span>(주)엔미디어플랫폼 대표이사</span>
                      <span>現) (주)중앙판교개발 대표이사</span>
                      <span>現) (주)넥슨게임즈 CFO</span>
                    </td>
                  </tr>
                  <tr>
                    <td>사내이사</td>
                    <td>김명현</td>
                    <td>개발이사</td>
                    <td>
                      <span>(주)넥슨 개발팀장</span>
                      <span>넥슨지티(주) 개발실장</span>
                      <span>(주)네오플 대표이사</span>
                      <span>現) (주)넥슨게임즈 개발이사</span>
                    </td>
                  </tr>
                  <tr>
                    <td>사외이사</td>
                    <td>이남주</td>
                    <td>주요사항 결정</td>
                    <td>
                      <span>법무법인(유) 세종 공인회계사</span>
                      <span>회계법인 세종 공인회계사</span>
                      <span>現) 법무법인(유) 세종 선임 공인회계사</span>
                      <span>現) (주)넥슨게임즈 사외이사</span>
                    </td>
                  </tr>
                  <tr>
                    <td>감사</td>
                    <td>양안수</td>
                    <td>감사</td>
                    <td>
                      <span>KPMG삼정회계법인</span>
                      <span>EY한영회계법인 이사</span>
                      <span>호연회계법인 대표이사</span>
                      <span>現) (주)디앤씨미디어 감사</span>
                      <span>現) 지우회계법인 대표이사</span>
                      <span>現) (주)넥슨게임즈 감사</span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
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
              <a class="award" href="https://www.gdweb.co.kr/sub/view.asp?displayrow=60&Txt_key=all&Txt_word=&Txt_agnumber=&Txt_fgbn=5&Txt_bcode1=020810001&Txt_gbflag=&Txt_bcode2=&Txt_bcode3=&Txt_bcode4=&Txt_bcode5=&Page=1&str_no=17268" target="_blank" title="새창 열림">
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
                  <li><a href="corporate-governance.jsp">기업지배구조</a></li>
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
          <button type="button" class="family_btn">
            관련사이트
          </button>
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