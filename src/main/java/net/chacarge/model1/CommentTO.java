package net.chacarge.model1;

public class CommentTO {
	private String comment_seq;
	private String comment_content;
	private String comment_wdate;
	private String user_seq;
	private String user_id;
	private String board_seq;
	
	public String getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(String comment_seq) {
		this.comment_seq = comment_seq;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_wdate() {
		return comment_wdate;
	}
	public void setComment_wdate(String comment_wdate) {
		this.comment_wdate = comment_wdate;
	}
	public String getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}
	
}
