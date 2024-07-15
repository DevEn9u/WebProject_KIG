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
  <title>넥슨게임즈</title>
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
              <li><a href="../free-board.jsp">자유게시판</a></li>
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
    <main id="container">
      <section class="main_video">
        <h2 class="blind">메인 비디오</h2>
        <div class="swiper">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <video src="video/Hit2.mp4" muted autoplay playsinline></video>
            </div>
            <div class="swiper-slide">
              <video src="video/BlueArchive.mp4" muted autoplay playsinline></video>
            </div>
            <div class="swiper-slide">
              <video src="video/FirstDescendant.mp4" muted playsinline></video>
            </div>
          </div>
          <div class="pagination_wrap">
            <!-- 간단한 태그(.page_num) 작성 가능하여 2개의 pagination 작성하는 대신 1개 작성 -->
            <!-- <div class="swiper-pagination pagination_number"></div> -->
            <div class="page_num">
              <span class="current">01</span>
              /
              <span class="total">03</span>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-scrollbar"></div>
          </div>
        </div>
      </section>
      <section class="main_intro">
        <div class="tit_wrap">
          <h2>
            <span>We Make Games Better</span>
            <strong>NEXON Games</strong>
          </h2>
        </div>
        <div class="inner">
          <div class="col_left">
            <p>우리는 더 좋은 게임(Better Game)을<br>만들고 세상에 보여주기 위해 모였습니다.</p>
            <p>유저가 더 즐겁게 게임을 즐길 수 있도록,<br>세상보다 먼저 한 발자국 더 나아갑니다.</p>
            <p>넥슨게임즈의 방식으로<br>더 좋은 게임을 만듭니다.</p>
          </div>
          <div class="col_right">
            <img src="images/main_mid_img_01_new.png" alt="메인 이미지">
          </div>
        </div>
      </section>
      <section class="main_worker">
        <div class="inner">
          <h2>Who we are</h2>
          <div class="swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <div class="col_left">
                  <img src="images/yoon.png" alt="윤진홍 님">
                </div>
                <div class="col_right">
                  <div class="tit_wrap">
                    <span>interviewee.</span>
                    <h3>
                      <strong>윤진홍 님</strong>
                      <span>서든어택실 비전파트</span>
                    </h3>
                  </div>
                  <div class="txt_wrap">
                    <strong>“제안하고 논의하며 성장합니다.”</strong>
                    <p class>
                      우리는 같은 장르, 전형적인 룰로 게임을 만들지 않아요.<br>
                      타 장르의 재미요소와 게임 외 재미들을 융합해 새로운 재미를 만듭니다.<br>
                      제 아이디어가 개발로 이어지기도, 이어지지 않기도 하지만,<br>
                      뛰어난 동료들과 함께 논의하는 과정에서 매일 한 걸음 씩 더 성장함을 느껴요.
                      </p>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="col_left">
                  <img src="images/jo.png" alt="조정위 님">
                </div>
                <div class="col_right">
                  <div class="tit_wrap">
                    <span>interviewee.</span>
                    <h3>
                      <strong>조정위 님</strong>
                      <span>매그넘스튜디오 아트실</span>
                    </h3>
                  </div>
                  <div class="txt_wrap">
                    <strong>“믿고 갈 수 있습니다.”</strong>
                    <p>
                      넥슨게임즈는 신규 프로젝트들을 신중히 시작하고,<br>
                      한번 시작하면 필요한 지원을 아끼지 않아요.<br>
                      이후 과정에 시행착오가 있더라도 중단하지 않고 최선을 다할 것이라는 믿음이 있습니다.<br>
                      개발자 한 명 한 명의 커리어를 소중히 여기는 회사에 대한 믿음으로<br>
                      개발에만 더욱 몰입할 수 있습니다.
                    </p>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="col_left">
                  <img src="images/kim.png" alt="김다란 님">
                </div>
                <div class="col_right">
                  <div class="tit_wrap">
                    <span>interviewee.</span>
                    <h3>
                      <strong>김다란 님</strong>
                      <span>DX스튜디오 개발관리실</span>
                    </h3>
                  </div>
                  <div class="txt_wrap">
                    <strong>“함께 만들어 나가고 있습니다.”</strong>
                    <p>
                      넥슨게임즈는 실무자의 의견과 제안을 적극적으로 수렴합니다.<br>
                      전사의 업무용 메신저를 선택할 때도 실무 리더인 PM들이 모여<br>
                      논의하고 결정했던 경험이 기억에 남아요.<br>
                      회사가 구성원들을 깊이 존중함을 느꼈던 경험입니다.<br>
                      우리는 함께 회사를 만든다는 자부심으로 일합니다.
                      </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="btn_wrap">
              <div class="swiper-button-prev arrow_btn">prev</div>
              <span class="bar"></span>
              <div class="swiper-button-next arrow_btn">next</div>
            </div>
          </div>
        </div>
      </section>
      <section class="main_news">
        <div class="inner">
          <h2>News</h2>
          <ul class="news">
            <li>
              <a href="https://theviewers.co.kr/View.aspx?No=3199613" target="_blank" title="새창 열림">
                <div class="img_wrap">
                  <img src="images/news_01.jpg" alt="#">
                </div>
              </a>
              <div class="txt_wrap">
                <div class="category">
                  <a href="#">넥슨게임즈</a>
                  <span>2024.04.18</span>
                </div>
                <a class="tit" href="https://theviewers.co.kr/View.aspx?No=3199613" target="_blank" title="새창 열림">
                  넥슨게임즈, ‘블루 아카이브-히트2’ 日 쌍끌이 흥행
                </a>
                <p class="txt">
                  ‘블루 아카이브’와 MMORPG ‘히트2’가 일본에서 나란히 매출 TOP10에 진입했다. 기존 게임과 신작 모두 흥행을 이어가는 모양새다.
                </p>
              </div>
            </li>
            <li>
              <a href="https://theviewers.co.kr/View.aspx?No=3199613" target="_blank" title="새창 열림">
                <div class="img_wrap">
                  <img src="images/news_02.jpg" alt="#">
                </div>
              </a>
              <div class="txt_wrap">
                <div class="category">
                  <a href="#">퍼스트 디센던트</a>
                  <span>2024.04.18</span>
                </div>
                <a class="tit" href="https://theviewers.co.kr/View.aspx?No=3199613" target="_blank" title="새창 열림">
                  넥슨게임즈에게 '퍼스트 디센던트'란? "글로벌 속 해답지"
                </a>
                <p class="txt">
                  넥슨의 올해 첫 글로벌 선봉장 역할을 맡은 타이틀은 넥슨게임즈가 개발한 ‘퍼스트 디센던트’다. 3인칭 루트슈터 장르로 지난해 두 번의 테스트를 거쳐 올해 여름 출시를 확정 지은 상태다.
                </p>
              </div>
            </li>
            <li>
              <a href="https://theviewers.co.kr/View.aspx?No=3199613" target="_blank" title="새창 열림">
                <div class="img_wrap">
                  <img src="images/news_03.png" alt="#">
                </div>
              </a>
              <div class="txt_wrap">
                <div class="category">
                  <a href="#">넥슨게임즈</a>
                  <span>2024.04.15</span>
                </div>
                <a class="tit" href="https://theviewers.co.kr/View.aspx?No=3199613" target="_blank" title="새창 열림">
                  '미다스의 손' 박용현 넥슨게임즈 CEO, 그룹 존재감 UP...개발부사장 '겸직'
                </a>
                <p class="txt">
                  게임업계 '미다스의 손'으로 불리는 박용현 넥슨게임즈 대표가 넥슨 그룹 전체의 개발 컨트롤타워를 맡게 돼 이목이 쏠린다.
                </p>
              </div>
            </li>
          </ul>
          <a href="#" class="more_btn">more</a>
        </div>
      </section>
      <section class="main_careers">
        <div class="inner">
          <h2>Careers</h2>
          <img src="images/careers_visual.jpg" alt="커리어">
          <div class="txt_box">
            <p>
              새로운 재미, 교류와 공감의 세계를 창조할<br>
              게이머들과 함께하고 싶습니다.
            </p>
          </div>
          <a href="#" class="more_btn">지원하기</a>
        </div>
      </section>
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
        <a href="#" class="top_btn">
          <span class="blind">위로 이동</span>
          TOP
        </a>
      </div>
    </footer>
  </div>
</body>
</html>