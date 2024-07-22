package utils;

public class BoardPagination {
	
	public static String pagingStr(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqURL, String searchField, String searchWord) {
		
		// 페이지 바로가기 링크를 저장할 문자열 변수
		StringBuilder pagingStr = new StringBuilder();
		
		// 전체 페이지 수 계산
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));
		
		// 현재 페이지 블럭에서 사용할 첫번째 페이지 번호 계산
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		
		// pageTemp가 1(첫번째 페이지 블록)이 아닐때만 이전블럭 바로가기 링크 출력
		if(pageTemp != 1) {
			pagingStr.append("<a href='").append(reqURL).append("?pageNum=1");
			if (searchField != null && searchWord != null) {
				pagingStr.append("&searchField=").append("searchField")
					.append("&searchWord=").append("searchWord");
			}
			pagingStr.append("'> [첫 페이지]</a>");
			pagingStr.append("&nbsp;");
			pagingStr.append("<a href='").append(reqURL).append("?pageNum=").append(pageTemp - 1);
			if (searchField != null && searchWord != null) {
				pagingStr.append("&searchField=").append(searchField)
						.append("&searchWord=").append(searchWord);
			}
			pagingStr.append("'> [이전 블럭]</a>");
		}
		
		/* 각 페이지 번호 바로가기 링크 출력, 앞에서 계산한 pageTemp를
		 blockPage만큼 반복해서 출력하고 이때 1씩 증가시겨 한 블럭당 5페이지 출력 */
		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages) {
			if (pageTemp == pageNum) {
				// 현재 페이지라면 링크를 걸지 않는다.
				pagingStr.append("&nbsp;").append(pageTemp).append("&nbsp;");
			} else {
				// 현재 페이지가 아닌 경우에만 링크를 추가한다.
				pagingStr.append("&nbsp;<a href='").append(reqURL).append("?pageNum=").append(pageTemp);
				if (searchField != null && searchWord != null) {
					pagingStr.append("&searchField=").append(searchField)
							.append("&searchWord=").append(searchWord);
				}
				pagingStr.append("'>").append(pageTemp).append("</a>&nbsp;");
			}
			// 반복하면서 1씩 증가시켜 순차적인 페이지번호를 출력한다.
			pageTemp++;
			blockCount++;
		}
		
		// 다음 페이지 블럭 바로가기 링크 추가, 마지막 페이지에는 출력하지 않음.
		if (pageTemp <= totalPages) {
			pagingStr.append("<a href='").append(reqURL).append("?pageNum=").append(pageTemp);
			if (searchField != null && searchWord != null) {
				pagingStr.append("&searchField=").append(searchField)
						.append("&searchWord=").append(searchWord);
			}
			pagingStr.append("'>[다음 블럭]</a>");
			pagingStr.append("&nbsp;");
			pagingStr.append("<a href='").append(reqURL).append("?pageNum=").append(totalPages);
			if (searchField != null && searchWord != null) {
				pagingStr.append("&searchField=").append(searchField)
						.append("&searchWord=").append(searchWord);
			}
			pagingStr.append("'>[마지막 페이지]</a>");
		}
		return pagingStr.toString();
	}
	// 검색어 없는 댓글창 페이징
	public static String pagingStrComm(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqURL) {
		
		// 페이지 바로가기 링크를 저장할 문자열 변수
		StringBuilder pagingStr = new StringBuilder();
		
		// 전체 페이지 수 계산
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));
		
		// 현재 페이지 블럭에서 사용할 첫번째 페이지 번호 계산
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		
		// pageTemp가 1(첫번째 페이지 블록)이 아닐때만 이전블럭 바로가기 링크 출력
		if(pageTemp != 1) {
			pagingStr.append("<a href='").append(reqURL).append("?pageNum=1");
			pagingStr.append("'> [첫 페이지]</a>");
			pagingStr.append("&nbsp;");
			pagingStr.append("<a href='").append(reqURL).append("?pageNum=").append(pageTemp - 1);
			pagingStr.append("'> [이전 블럭]</a>");
		}
		
		/* 각 페이지 번호 바로가기 링크 출력, 앞에서 계산한 pageTemp를
		 blockPage만큼 반복해서 출력하고 이때 1씩 증가시겨 한 블럭당 5페이지 출력 */
		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages) {
			if (pageTemp == pageNum) {
				// 현재 페이지라면 링크를 걸지 않는다.
				pagingStr.append("&nbsp;").append(pageTemp).append("&nbsp;");
			} else {
				// 현재 페이지가 아닌 경우에만 링크를 추가한다.
				pagingStr.append("&nbsp;<a href='").append(reqURL).append("?pageNum=").append(pageTemp);
				pagingStr.append("'>").append(pageTemp).append("</a>&nbsp;");
			}
			// 반복하면서 1씩 증가시켜 순차적인 페이지번호를 출력한다.
			pageTemp++;
			blockCount++;
		}
		
		// 다음 페이지 블럭 바로가기 링크 추가, 마지막 페이지에는 출력하지 않음.
		if (pageTemp <= totalPages) {
			pagingStr.append("<a href='").append(reqURL).append("?pageNum=").append(pageTemp);
			pagingStr.append("'>[다음 블럭]</a>");
			pagingStr.append("&nbsp;");
			pagingStr.append("<a href='").append(reqURL).append("?pageNum=").append(totalPages);
			pagingStr.append("'>[마지막 페이지]</a>");
		}
		return pagingStr.toString();
	}
}
