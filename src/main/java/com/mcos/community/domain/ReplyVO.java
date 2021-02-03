package com.mcos.community.domain;

import java.sql.Timestamp;

import com.project.maos.vo.MemberVO;

public class ReplyVO {
	
	private int comid;				//게시글 번호
	private int replyid; 			//댓글 번호
	private String username; 		//작성자
	private String userid;			//사원번호
	private String replyContent;	 		//댓글 내용
	private Timestamp writeDate; 	//댓글 작성 날짜
	
	private MemberVO memberVO;
	
	public int getComid() {
		return comid;
	}
	public void setComid(int comid) {
		this.comid = comid;
	}
	public int getReplyid() {
		return replyid;
	}
	public void setReplyid(int replyid) {
		this.replyid = replyid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getreplyContent() {
		return replyContent;
	}
	public void setreplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "ReplyVO [comid=" + comid + ", replyid=" + replyid + ", username=" + username + ", userid=" + userid
				+ ", replyContent=" + replyContent + ", writeDate=" + writeDate + "]";
	}
	
	
	
}
