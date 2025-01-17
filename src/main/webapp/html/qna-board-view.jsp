<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<c:import url="/include/common_head.jsp"></c:import>
<c:import url="/include/common_body_header.jsp" var="body_header"></c:import>
<c:import url="/include/common_body_footer.jsp" var="body_footer"></c:import>
 <script>
//게시물 삭제를 위해 정의한 함수
 function deletePost() {
     let confirmed = confirm("게시물을 삭제하겠습니까?"); 
     if (confirmed) {
         let form = document.deleteFrm;
         form.submit(); 
     }
 }
 function deleteComment() {
     let confirmed = confirm("댓글을 삭제하겠습니까?"); 
     if (confirmed) {
         let form = document.commentDelFrm;
         form.submit(); 
     }
 }
 </script>
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
              <span>Home</span><span>커뮤니티</span><span>QnA</span>
            </p>
            <h2>QnA</h2>
            <div class="board_category_wrap">
              <ul class="board_category">
                <li><a href="../free-board/list.do">자유게시판</a></li>
                <li class="active"><a href="../qna-board/list.do">QnA</a></li>
                <li><a href="../download-board/list.do">자료실</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="contents">
          <div class="inner">
            <div class="board_view">
              <div class="tit_wrap">
                <h3>${ dto.title }</h3>
                <p class="date">${ dto.postDate }</p>
                <p class="date">작성자 : ${ dto.name }</p>
                <p class="date">조회수 : ${ dto.visitcount }</p>
                <form name="deleteFrm" method="post"
                	 action="../qna-board/delete.do?idx=${ dto.idx }">
                	<input type="hidden" name="idx" value="${ dto.idx }" />
                </form>
              </div>
              
              <!-- 작성글 -->
              <div class="view_con">
              	<form name="commentDelFrm" method="post" action="../qna-board/comment_delete.do?commIdx=${ commentDTO.commIdx }"></form>
                <span>${ dto.content }</span>
              </div>
			 <div class="btn_wrap">
              	<!-- session에 저장된 UserId와 게시물 작성자와 동일할때만 수정&삭제 버튼 출력 -->
              	<c:if test="${ UserId != null && UserId.toString().equals(dto.getId())}">
					<button type="button" class="list_btn"
						onclick="location.href='../qna-board/edit.do?idx=${ param.idx }';">
	                	수정하기
	            	</button>
		            <button type="button" class="list_btn"
						onclick="deletePost();">
		                삭제하기
		            </button>
              	</c:if>
                <button type="button"
                	onclick="location.href='../qna-board/list.do';"
                	class="list_btn">목록으로</button>
              </div>
            </div>
            <div class="comment_section">
                    <h3>댓글 작성하기</h3>
                    <form name="commentFrm" method="post" action="../qna-board/comment_write.do">
                        <input type="hidden" name="boardIdx" value="${ dto.idx }" /> <!-- 게시물 ID -->
                         작성자 : <input type="text" name="name" value="${ UserName }" readonly="readonly" /> 
                        <textarea name="commCon" rows="4" cols="50" placeholder="댓글을 입력하세요"></textarea>
                        <br/>
                        <button type="submit">댓글 작성</button>
                    </form>
                
                
                <!-- 댓글 목록 -->
                <div class="view_con comment_list">
                    <h3>댓글 목록</h3>
                    <c:forEach var="comment" items="${ commentsList }">
                        <div class="comment_item">
                        	<form action="../qna-board/comment-delete.do?commIdx=${ comment.commIdx }"></form>
                        	<input type="hidden" name="commIdx" value="${ comment.commIdx }" />
                            <p>${ comment.name } (${ comment.postDate })</p>
                            <p>${ comment.content }</p>
                            <button type="button" class="list_btn"
								onclick="location.href='../qna-board/comment-edit.do?idx=${ param.idx }';">
	                			수정하기
	            			</button>
				            <button type="button" class="list_btn"
								onclick="deleteComment();">
				                삭제하기
				            </button>
                        </div>
                    </c:forEach>
                    <c:if test="${ empty commentsList }">
                        <p>등록된 댓글이 없습니다.</p>
                    </c:if>
                     <table border="1">
						<tr align="center">
	            			<td>페이징 : ${ map.pagingImg }</td>
	        			</tr>
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
