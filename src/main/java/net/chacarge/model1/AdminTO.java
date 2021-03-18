package net.chacarge.model1;

public class AdminTO {
	private int user_seq;
	private String user_id;
	private String user_password;
	private String user_email;
	private String user_name;
	private String user_join_date;
	private String user_grade;
	private String user_token;
	
	private int user_count;
	private int user_sum_count;
	
	private int visit_seq;
	private String visit_date;

	private int visit_count;
	private int visit_sum_count;
	
	private int board_seq;
	private String board_subject;
	private String board_content;
	private int board_hit;
	private String board_wdate;
	
	private int post_count;
	private int post_sum_count;
	
	private int comment_seq;
	private String comment_content;
	private String comment_wdate;
	
	public int getVisit_count() {
		return visit_count;
	}
	public void setVisit_count(int visit_count) {
		this.visit_count = visit_count;
	}
	public int getPost_count() {
		return post_count;
	}
	public void setPost_count(int post_count) {
		this.post_count = post_count;
	}
	public int getUser_sum_count() {
		return user_sum_count;
	}
	public void setUser_sum_count(int user_sum_count) {
		this.user_sum_count = user_sum_count;
	}
	public int getVisit_sum_count() {
		return visit_sum_count;
	}
	public void setVisit_sum_count(int visit_sum_count) {
		this.visit_sum_count = visit_sum_count;
	}
	public int getPost_sum_count() {
		return post_sum_count;
	}
	public void setPost_sum_count(int post_sum_count) {
		this.post_sum_count = post_sum_count;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_join_date() {
		return user_join_date;
	}
	public void setUser_join_date(String user_join_date) {
		this.user_join_date = user_join_date;
	}
	public String getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}
	public String getUser_token() {
		return user_token;
	}
	public void setUser_token(String user_token) {
		this.user_token = user_token;
	}
	public int getUser_count() {
		return user_count;
	}
	public void setUser_count(int user_count) {
		this.user_count = user_count;
	}
	public int getVisit_seq() {
		return visit_seq;
	}
	public void setVisit_seq(int visit_seq) {
		this.visit_seq = visit_seq;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public String getBoard_wdate() {
		return board_wdate;
	}
	public void setBoard_wdate(String board_wdate) {
		this.board_wdate = board_wdate;
	}
	public int getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(int comment_seq) {
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
	
}
