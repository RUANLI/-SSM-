package com.student.entity;

public class Student {
	private Integer stuNo;//学生学号
	private String stuName;//学生名字
	private String stuClass ;//学生班级
	private int stuChinese;//语文成绩
	private int stuMath;//数学成绩
	private int stuEnglish;//英语成绩
	public Student() {
	
	}
	public Student(Integer stuNo, String stuName, String stuClass, int stuChinese, int stuMath, int stuEnglish) {
		super();
		this.stuNo = stuNo;
		this.stuName = stuName;
		this.stuClass = stuClass;
		this.stuChinese = stuChinese;
		this.stuMath = stuMath;
		this.stuEnglish = stuEnglish;
	}

	public Integer getStuNo() {
		return stuNo;
	}
	public void setStuNo(Integer stuNo) {
		this.stuNo = stuNo;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getStuClass() {
		return stuClass;
	}
	public void setStuClass(String stuClass) {
		this.stuClass = stuClass;
	}
	public int getStuChinese() {
		return stuChinese;
	}
	public void setStuChinese(int stuChinese) {
		this.stuChinese = stuChinese;
	}
	public int getStuMath() {
		return stuMath;
	}
	public void setStuMath(int stuMath) {
		this.stuMath = stuMath;
	}
	public int getStuEnglish() {
		return stuEnglish;
	}
	public void setStuEnglish(int stuEnglish) {
		this.stuEnglish = stuEnglish;
	}

	@Override
	public String toString() {
		return "Student [stuNo=" + stuNo + ", stuName=" + stuName + ", stuClass=" + stuClass + ", stuChinese="
				+ stuChinese + ", stuMath=" + stuMath + ", stuEnglish=" + stuEnglish + "]";
	}
	
	
}
