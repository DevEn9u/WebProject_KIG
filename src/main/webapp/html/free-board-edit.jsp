<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<c:import url="/include/common_head.jsp"></c:import>
<c:import url="/include/common_body_header.jsp" var="body_header"></c:import>
<c:import url="/include/common_body_footer.jsp" var="body_footer"></c:import>
<c:import url="/include/common_board_write_validate_form.jsp"></c:import>
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
              <span>Home</span><span>커뮤니티</span><span>자유게시판</span>
            </p>
            <h2>자유게시판</h2>
            <div class="board_category_wrap">
              <ul class="board_category">
                <li class="active"><a href="../free-board/list.do">자유게시판</a></li>
                <li><a href="../qna-board/list.do">QnA</a></li>
                <li><a href="../download-board/list.do">자료실</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="contents">
          <div class="inner">
            <div class="tit_wrap">
              <h3>게시글 수정</h3>
              <p><i class="required"></i>는 필수 입력사항입니다.</p>
            </div>
            <div class="board_write">
              <form name="writeFrm" method="post" action="../free-board/edit.do"
             	 onsubmit="return validateForm(this)">
               <input type="hid-den" name="idx" value="${ dto.idx }" />             	 
               <table>
                 <caption class="nohead">게시글 작성</caption>
                 <tr>
                   <th>이름<i class="required"></i></th>
                   <td><input type="text" name="name" readonly="readonly" value="${ UserName }"></td>
                 </tr>
                 <tr>
                 </tr>
                 <tr>
                   <th>제목<i class="required"></i></th>
                   <td><input type="text" name="title" placeholder="제목을 입력해주세요." value="${ dto.title }"></td>
                 </tr>
                 <tr>
                   <th class="t_area">내용<i class="required"></i></th>
                   <td>
                     <textarea cols="30" rows="20" name="content"
                     	placeholder="필수 입력사항을 작성하고 입력해주세요.&#10;비방, 욕설, 도배글 등은 서비스 이용 제한의 사유가 됩니다.">${ dto.content }</textarea>
                   </td>
                 </tr>
               </table>
               <div class="btn_wrap">
                 <button type="submit" class="write_btn">수정하기</button>
                 <button type="reset" class="write_btn cancel_btn">다시쓰기</button>
                 <button type="button" onclick="location.href='../free-board/list.do';" class="write_btn cancel_btn">목록</button>
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
