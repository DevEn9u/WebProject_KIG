<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header id="header">
      <h1 class="logo">
        <a href="../main/index.do">
          <img src="../images/main_logo.png" alt="메인로고">
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
            <a href="../html/corporate-governance.jsp">투자정보</a>
            <ul class="depth2">
              <li><a href="../html/corporate-governance.jsp">기업지배구조</a></li>
              <li><a href="#">주가정보</a></li>
              <li><a href="#">재무정보</a></li>
              <li><a href="#">공시/실적</a></li>
              <li><a href="../html/account-list.jsp">공고</a></li>
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
            <a href="../free-board/list.do">커뮤니티</a>
            <ul class="depth2">
              <li><a href="../free-board/list.do">자유게시판</a></li>
              <li><a href="../qna-board/list.do">QnA</a></li>
              <li><a href="../download-board/list.do">자료실</a></li>
            </ul>
          </li>
        </ul>
      </nav>
      <div class="lang_wrap">
        <a href="#" class="blog"><img src="../images/blog_icon.png" alt="블로그"></a>
        <c:choose>
        	<c:when test="${ empty UserId }">
		        <a class="login" href="../member/login.do">로그인</a>        	
        	</c:when>
        	<c:otherwise>	
        		<a class="login" href="../member/mypage.do">마이페이지</a>       
        		<a class="login" href="../member/logout.do">로그아웃</a>       
        	</c:otherwise>
        </c:choose>
        
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
              <li><a href="../html/corporate-governance.jsp">기업지배구조</a></li>
              <li><a href="#">주가정보</a></li>
              <li><a href="#">재무정보</a></li>
              <li><a href="#">공시/실적</a></li>
              <li><a href="../html/account-list.jsp">공고</a></li>
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
              <li><a href="../free-board/list.do">자유게시판</a></li>
              <li><a href="../qna-board/list.do">QnA</a></li>
              <li><a href="../download-board/list.do">자료실</a></li>
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