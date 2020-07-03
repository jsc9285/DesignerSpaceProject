package com.project.qnaBoard.model;

import java.util.Date;

public class QnaBoardDto {
	
	private int QNA_BOARD_NO = 0;
    private int QNA_BOARD_MNO = 0;
    private String QNA_BOARD_TITLE = "";
    private String QNA_BOARD_CONTENTS = "";
    private Date QNA_BOARD_CRE_DATE = null;
    private Date QNA_BOARD_MOD_DATE = null;
    private Date QNA_BOARD_ANSWER_DATE = null;
    private String QNA_BOARD_ANSWER_STATUS = "";
    
    private int MEMBER_NO = 0;
    private String MEMBER_NAME = "";
    private String MEMBER_NICK = "";
    private String MEMBER_EMAIL = "";
    private String MEMBER_PWD = "";
    private String MEMBER_PHONE = "";
    private int MEMBER_CHECK_QUESTION = 0;
    private String MEMBER_CHECK_ANSWER = "";
    private String MEMBER_COMMENTS = "";
    private Date MEMBER_CRE_DATE = null;
    private Date MEMBER_MOD_DATE = null;
    private String MEMBER_SIGN_CHECK = "";
    private int MEMBER_GRADE = 0;
    private String MEMBER_DEL_FLAG = "";
	
    public QnaBoardDto() {
		super();
	}

	public QnaBoardDto(int qNA_BOARD_NO, int qNA_BOARD_MNO, String qNA_BOARD_TITLE, String qNA_BOARD_CONTENTS,
			Date qNA_BOARD_CRE_DATE, Date qNA_BOARD_MOD_DATE, Date qNA_BOARD_ANSWER_DATE,
			String qNA_BOARD_ANSWER_STATUS, int mEMBER_NO, String mEMBER_NAME, String mEMBER_NICK, String mEMBER_EMAIL,
			String mEMBER_PWD, String mEMBER_PHONE, int mEMBER_CHECK_QUESTION, String mEMBER_CHECK_ANSWER,
			String mEMBER_COMMENTS, Date mEMBER_CRE_DATE, Date mEMBER_MOD_DATE, String mEMBER_SIGN_CHECK,
			int mEMBER_GRADE, String mEMBER_DEL_FLAG) {
		super();
		QNA_BOARD_NO = qNA_BOARD_NO;
		QNA_BOARD_MNO = qNA_BOARD_MNO;
		QNA_BOARD_TITLE = qNA_BOARD_TITLE;
		QNA_BOARD_CONTENTS = qNA_BOARD_CONTENTS;
		QNA_BOARD_CRE_DATE = qNA_BOARD_CRE_DATE;
		QNA_BOARD_MOD_DATE = qNA_BOARD_MOD_DATE;
		QNA_BOARD_ANSWER_DATE = qNA_BOARD_ANSWER_DATE;
		QNA_BOARD_ANSWER_STATUS = qNA_BOARD_ANSWER_STATUS;
		MEMBER_NO = mEMBER_NO;
		MEMBER_NAME = mEMBER_NAME;
		MEMBER_NICK = mEMBER_NICK;
		MEMBER_EMAIL = mEMBER_EMAIL;
		MEMBER_PWD = mEMBER_PWD;
		MEMBER_PHONE = mEMBER_PHONE;
		MEMBER_CHECK_QUESTION = mEMBER_CHECK_QUESTION;
		MEMBER_CHECK_ANSWER = mEMBER_CHECK_ANSWER;
		MEMBER_COMMENTS = mEMBER_COMMENTS;
		MEMBER_CRE_DATE = mEMBER_CRE_DATE;
		MEMBER_MOD_DATE = mEMBER_MOD_DATE;
		MEMBER_SIGN_CHECK = mEMBER_SIGN_CHECK;
		MEMBER_GRADE = mEMBER_GRADE;
		MEMBER_DEL_FLAG = mEMBER_DEL_FLAG;
	}

	public int getQNA_BOARD_NO() {
		return QNA_BOARD_NO;
	}

	public void setQNA_BOARD_NO(int qNA_BOARD_NO) {
		QNA_BOARD_NO = qNA_BOARD_NO;
	}

	public int getQNA_BOARD_MNO() {
		return QNA_BOARD_MNO;
	}

	public void setQNA_BOARD_MNO(int qNA_BOARD_MNO) {
		QNA_BOARD_MNO = qNA_BOARD_MNO;
	}

	public String getQNA_BOARD_TITLE() {
		return QNA_BOARD_TITLE;
	}

	public void setQNA_BOARD_TITLE(String qNA_BOARD_TITLE) {
		QNA_BOARD_TITLE = qNA_BOARD_TITLE;
	}

	public String getQNA_BOARD_CONTENTS() {
		return QNA_BOARD_CONTENTS;
	}

	public void setQNA_BOARD_CONTENTS(String qNA_BOARD_CONTENTS) {
		QNA_BOARD_CONTENTS = qNA_BOARD_CONTENTS;
	}

	public Date getQNA_BOARD_CRE_DATE() {
		return QNA_BOARD_CRE_DATE;
	}

	public void setQNA_BOARD_CRE_DATE(Date qNA_BOARD_CRE_DATE) {
		QNA_BOARD_CRE_DATE = qNA_BOARD_CRE_DATE;
	}

	public Date getQNA_BOARD_MOD_DATE() {
		return QNA_BOARD_MOD_DATE;
	}

	public void setQNA_BOARD_MOD_DATE(Date qNA_BOARD_MOD_DATE) {
		QNA_BOARD_MOD_DATE = qNA_BOARD_MOD_DATE;
	}

	public Date getQNA_BOARD_ANSWER_DATE() {
		return QNA_BOARD_ANSWER_DATE;
	}

	public void setQNA_BOARD_ANSWER_DATE(Date qNA_BOARD_ANSWER_DATE) {
		QNA_BOARD_ANSWER_DATE = qNA_BOARD_ANSWER_DATE;
	}

	public String getQNA_BOARD_ANSWER_STATUS() {
		return QNA_BOARD_ANSWER_STATUS;
	}

	public void setQNA_BOARD_ANSWER_STATUS(String qNA_BOARD_ANSWER_STATUS) {
		QNA_BOARD_ANSWER_STATUS = qNA_BOARD_ANSWER_STATUS;
	}

	public int getMEMBER_NO() {
		return MEMBER_NO;
	}

	public void setMEMBER_NO(int mEMBER_NO) {
		MEMBER_NO = mEMBER_NO;
	}

	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}

	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}

	public String getMEMBER_NICK() {
		return MEMBER_NICK;
	}

	public void setMEMBER_NICK(String mEMBER_NICK) {
		MEMBER_NICK = mEMBER_NICK;
	}

	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}

	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}

	public String getMEMBER_PWD() {
		return MEMBER_PWD;
	}

	public void setMEMBER_PWD(String mEMBER_PWD) {
		MEMBER_PWD = mEMBER_PWD;
	}

	public String getMEMBER_PHONE() {
		return MEMBER_PHONE;
	}

	public void setMEMBER_PHONE(String mEMBER_PHONE) {
		MEMBER_PHONE = mEMBER_PHONE;
	}

	public int getMEMBER_CHECK_QUESTION() {
		return MEMBER_CHECK_QUESTION;
	}

	public void setMEMBER_CHECK_QUESTION(int mEMBER_CHECK_QUESTION) {
		MEMBER_CHECK_QUESTION = mEMBER_CHECK_QUESTION;
	}

	public String getMEMBER_CHECK_ANSWER() {
		return MEMBER_CHECK_ANSWER;
	}

	public void setMEMBER_CHECK_ANSWER(String mEMBER_CHECK_ANSWER) {
		MEMBER_CHECK_ANSWER = mEMBER_CHECK_ANSWER;
	}

	public String getMEMBER_COMMENTS() {
		return MEMBER_COMMENTS;
	}

	public void setMEMBER_COMMENTS(String mEMBER_COMMENTS) {
		MEMBER_COMMENTS = mEMBER_COMMENTS;
	}

	public Date getMEMBER_CRE_DATE() {
		return MEMBER_CRE_DATE;
	}

	public void setMEMBER_CRE_DATE(Date mEMBER_CRE_DATE) {
		MEMBER_CRE_DATE = mEMBER_CRE_DATE;
	}

	public Date getMEMBER_MOD_DATE() {
		return MEMBER_MOD_DATE;
	}

	public void setMEMBER_MOD_DATE(Date mEMBER_MOD_DATE) {
		MEMBER_MOD_DATE = mEMBER_MOD_DATE;
	}

	public String getMEMBER_SIGN_CHECK() {
		return MEMBER_SIGN_CHECK;
	}

	public void setMEMBER_SIGN_CHECK(String mEMBER_SIGN_CHECK) {
		MEMBER_SIGN_CHECK = mEMBER_SIGN_CHECK;
	}

	public int getMEMBER_GRADE() {
		return MEMBER_GRADE;
	}

	public void setMEMBER_GRADE(int mEMBER_GRADE) {
		MEMBER_GRADE = mEMBER_GRADE;
	}

	public String getMEMBER_DEL_FLAG() {
		return MEMBER_DEL_FLAG;
	}

	public void setMEMBER_DEL_FLAG(String mEMBER_DEL_FLAG) {
		MEMBER_DEL_FLAG = mEMBER_DEL_FLAG;
	}

	@Override
	public String toString() {
		return "QnaBoardDto [QNA_BOARD_NO=" + QNA_BOARD_NO + ", QNA_BOARD_MNO=" + QNA_BOARD_MNO + ", QNA_BOARD_TITLE="
				+ QNA_BOARD_TITLE + ", QNA_BOARD_CONTENTS=" + QNA_BOARD_CONTENTS + ", QNA_BOARD_CRE_DATE="
				+ QNA_BOARD_CRE_DATE + ", QNA_BOARD_MOD_DATE=" + QNA_BOARD_MOD_DATE + ", QNA_BOARD_ANSWER_DATE="
				+ QNA_BOARD_ANSWER_DATE + ", QNA_BOARD_ANSWER_STATUS=" + QNA_BOARD_ANSWER_STATUS + ", MEMBER_NO="
				+ MEMBER_NO + ", MEMBER_NAME=" + MEMBER_NAME + ", MEMBER_NICK=" + MEMBER_NICK + ", MEMBER_EMAIL="
				+ MEMBER_EMAIL + ", MEMBER_PWD=" + MEMBER_PWD + ", MEMBER_PHONE=" + MEMBER_PHONE
				+ ", MEMBER_CHECK_QUESTION=" + MEMBER_CHECK_QUESTION + ", MEMBER_CHECK_ANSWER=" + MEMBER_CHECK_ANSWER
				+ ", MEMBER_COMMENTS=" + MEMBER_COMMENTS + ", MEMBER_CRE_DATE=" + MEMBER_CRE_DATE + ", MEMBER_MOD_DATE="
				+ MEMBER_MOD_DATE + ", MEMBER_SIGN_CHECK=" + MEMBER_SIGN_CHECK + ", MEMBER_GRADE=" + MEMBER_GRADE
				+ ", MEMBER_DEL_FLAG=" + MEMBER_DEL_FLAG + "]";
	}

	
    
    

}
