package com.sloth.entity;

import java.util.Date;

public class Appointment {

	private long bookId;//ͼ��ID
	
	private long studentId;//ѧ��id
	
	private Date appointTime;//ԤԼʱ��
	
	// ���һ�ĸ�������
	
	private Book book;

	public long getBookId() {
		return bookId;
	}

	public void setBookId(long bookId) {
		this.bookId = bookId;
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public Date getAppointTime() {
		return appointTime;
	}

	public void setAppointTime(Date appointTime) {
		this.appointTime = appointTime;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
}
