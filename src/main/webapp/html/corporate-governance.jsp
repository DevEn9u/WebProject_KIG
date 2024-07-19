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
    ${ body_footer }
  </div>
</body>
</html>