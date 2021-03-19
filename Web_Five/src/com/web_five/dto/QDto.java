package com.web_five.dto;

public class QDto {
	// field
		int qSeqno;
		String qTitle;
		String qContent;
		String qFile;
		String qUserDate;
		String user_userId;
		String qChapter;
		String qComment;
		
		public QDto() {
			// TODO Auto-generated constructor stub
		}
		
		public QDto(int qSeqno, String qTitle, String qContent, String qFile, String qUserDate, String user_userId,
				String qChapter) {
			super();
			this.qSeqno = qSeqno;
			this.qTitle = qTitle;
			this.qContent = qContent;
			this.qFile = qFile;
			this.qUserDate = qUserDate;
			this.user_userId = user_userId;
			this.qChapter = qChapter;
		}
		
		public QDto(int qSeqno, String qTitle, String qContent, String qFile, String qUserDate, String user_userId,
				String qChapter, String qComment) {
			super();
			this.qSeqno = qSeqno;
			this.qTitle = qTitle;
			this.qContent = qContent;
			this.qFile = qFile;
			this.qUserDate = qUserDate;
			this.user_userId = user_userId;
			this.qChapter = qChapter;
			this.qComment = qComment;
		}

		public int getqSeqno() {
			return qSeqno;
		}
		public void setqSeqno(int qSeqno) {
			this.qSeqno = qSeqno;
		}
		public String getqTitle() {
			return qTitle;
		}
		public void setqTitle(String qTitle) {
			this.qTitle = qTitle;
		}
		public String getqContent() {
			return qContent;
		}
		public void setqContent(String qContent) {
			this.qContent = qContent;
		}
		public String getqFile() {
			return qFile;
		}
		public void setqFile(String qFile) {
			this.qFile = qFile;
		}
		public String getqUserDate() {
			return qUserDate;
		}
		public void setqUserDate(String qUserDate) {
			this.qUserDate = qUserDate;
		}
		public String getUser_userId() {
			return user_userId;
		}
		public void setUser_userId(String user_userId) {
			this.user_userId = user_userId;
		}
		public String getqChapter() {
			return qChapter;
		}
		public void setqChapter(String qChapter) {
			this.qChapter = qChapter;
		}

		public String getqComment() {
			return qComment;
		}

		public void setqComment(String qComment) {
			this.qComment = qComment;
		}
		
		

}
