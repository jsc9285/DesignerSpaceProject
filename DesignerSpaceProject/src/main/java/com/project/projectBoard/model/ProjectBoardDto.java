package com.project.projectBoard.model;

import java.util.Date;

public class ProjectBoardDto {
	
	private int project_board_no;
	private int project_board_mno;
	private String project_board_title;
	private String project_board_contents;
	private int project_board_views;
	private String project_board_category;
	private String project_board_del_flag; 
	private Date project_board_cre_date;	 
	private Date project_board_mod_date;
	
	public ProjectBoardDto() {
		super();
	}

	public ProjectBoardDto(int project_board_no, int project_board_mno, String project_board_title,
			String project_board_contents, int project_board_views, String project_board_category,
			String project_board_del_flag, Date project_board_cre_date, Date project_board_mod_date) {
		super();
		this.project_board_no = project_board_no;
		this.project_board_mno = project_board_mno;
		this.project_board_title = project_board_title;
		this.project_board_contents = project_board_contents;
		this.project_board_views = project_board_views;
		this.project_board_category = project_board_category;
		this.project_board_del_flag = project_board_del_flag;
		this.project_board_cre_date = project_board_cre_date;
		this.project_board_mod_date = project_board_mod_date;
	}

	public int getProject_board_no() {
		return project_board_no;
	}

	public void setProject_board_no(int project_board_no) {
		this.project_board_no = project_board_no;
	}

	public int getProject_board_mno() {
		return project_board_mno;
	}

	public void setProject_board_mno(int project_board_mno) {
		this.project_board_mno = project_board_mno;
	}

	public String getProject_board_title() {
		return project_board_title;
	}

	public void setProject_board_title(String project_board_title) {
		this.project_board_title = project_board_title;
	}

	public String getProject_board_contents() {
		return project_board_contents;
	}

	public void setProject_board_contents(String project_board_contents) {
		this.project_board_contents = project_board_contents;
	}

	public int getProject_board_views() {
		return project_board_views;
	}

	public void setProject_board_views(int project_board_views) {
		this.project_board_views = project_board_views;
	}

	public String getProject_board_category() {
		return project_board_category;
	}

	public void setProject_board_category(String project_board_category) {
		this.project_board_category = project_board_category;
	}

	public String getProject_board_del_flag() {
		return project_board_del_flag;
	}

	public void setProject_board_del_flag(String project_board_del_flag) {
		this.project_board_del_flag = project_board_del_flag;
	}

	public Date getProject_board_cre_date() {
		return project_board_cre_date;
	}

	public void setProject_board_cre_date(Date project_board_cre_date) {
		this.project_board_cre_date = project_board_cre_date;
	}

	public Date getProject_board_mod_date() {
		return project_board_mod_date;
	}

	public void setProject_board_mod_date(Date project_board_mod_date) {
		this.project_board_mod_date = project_board_mod_date;
	}

	@Override
	public String toString() {
		return "ProjectBoardDto [project_board_no=" + project_board_no + ", project_board_mno=" + project_board_mno
				+ ", project_board_title=" + project_board_title + ", project_board_contents=" + project_board_contents
				+ ", project_board_views=" + project_board_views + ", project_board_category=" + project_board_category
				+ ", project_board_del_flag=" + project_board_del_flag + ", project_board_cre_date="
				+ project_board_cre_date + ", project_board_mod_date=" + project_board_mod_date + "]";
	}
	
}