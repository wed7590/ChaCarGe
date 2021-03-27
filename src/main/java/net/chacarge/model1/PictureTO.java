package net.chacarge.model1;

public class PictureTO {
	private String board_pic_seq;	// 파일 번호
	private String o_pic_name;		// 원본 파일명
	private String u_pic_name;		// 업로드 파일명
	private String board_seq;		// 게시판 번호
	
	public String getBoard_pic_seq() {
		return board_pic_seq;
	}
	public void setBoard_pic_seq(String board_pic_seq) {
		this.board_pic_seq = board_pic_seq;
	}
	public String getO_pic_name() {
		return o_pic_name;
	}
	public void setO_pic_name(String o_pic_name) {
		this.o_pic_name = o_pic_name;
	}
	public String getU_pic_name() {
		return u_pic_name;
	}
	public void setU_pic_name(String u_pic_name) {
		this.u_pic_name = u_pic_name;
	}
	public String getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}
	
}
