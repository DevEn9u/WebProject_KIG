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
      <main id="container" class="board account sub_container">
        <div class="sub_top">
          <div class="inner">
            <p class="location">
              <span>Home</span><span>커뮤니티</span><span>QnA</span>
            </p>
            <h2>QnA</h2>
            <a href="../qna-board/write.do" class="write_btn">게시물 작성하기</a>
            <div class="board_category_wrap">
              <ul class="board_category">
                <li><a href="../free-board/list.do">자유게시판</a></li>
                <li class="active"><a href="../qna-board/list.do">QnA</a></li>
                <li><a href="../download-board/list.do">자료실</a></li>
              </ul>
            </div>
				<form method="get">
					<table border="1" width="90%">
						<tr>
							<td align="center">
								<select name="searchField">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="name">작성자</option>
								</select>
								<input type="text" name="searchWord" />
								<input type="submit" value="검색하기" />
							</td>
						</tr>
					</table>
				</form>
			</div>
        </div>
        <div class="contents">
          <div class="inner">
            <div class="board_list">
              <table>
                <caption>QnA</caption>
                <thead>
                  <tr>
                    <th class="col1">번호</th>
                    <th class="col2">제목</th>
                    <th class="col3">작성자</th>
                    <th class="col4">조회수</th>
                    <th class="col5">작성일</th>
                  </tr>
                </thead>
				<c:choose>
					<c:when test="${ empty boardLists }">
						<tr>
							<td colspan="5" class="col2">등록된 게시물이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ boardLists }" var="row" varStatus="loop">
							<tr align="center">
					            <td>
					            	<!-- 가상번호 -->
					            	${ map.totalCount - (((map.pageNum - 1) * map.pageSize)
					            		+ loop.index)}
					            </td>
					            <td align="left">
					                <a href="../qna-board/view.do?idx=${ row.idx }">
					                	${ row.title }
					                </a>
					            </td> 
					            <td>${ row.name }</td>
					            <td>${ row.visitcount }</td>
					            <td>${ row.postDate }</td>
					    	</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
              </table>
			  <table border="1">
				<tr align="center">
            		<td>${ map.pagingImg }</td>
            		<td>
            			<button type="button" onclick="location.href='../qna-board/write.do';">글쓰기</button>
            		</td>
        		</tr>
			  </table>
            </div>
          </div>
        </div>
      </main>
      ${ body_footer }
    </div>
  </body>
</html>
