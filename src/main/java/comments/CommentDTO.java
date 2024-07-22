package comments;

public class CommentDTO {

	private String commIdx; // 댓글의 일련번호
	private String boardIdx; // 댓글 작성된 게시글의 일련번호
	private String name; // 댓글 작성자
	private String content; // 댓글 내용
	private String id; // 댓글 작성자의 id
	private java.sql.Date postDate; 

	
	public String getCommIdx() {
		return commIdx;
	}

	public void setCommIdx(String commIdx) {
		this.commIdx = commIdx;
	}

	public String getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(String idx) {
		this.boardIdx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public java.sql.Date getPostDate() {
		return postDate;
	}

	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}

}
