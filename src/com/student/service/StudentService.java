package com.student.service;


import java.util.List;

import com.student.entity.Page;
import com.student.entity.Student;


public interface StudentService {
	//增加学生
	void addStudent(Student student);
	//存储过程增加学生
	void addStudentWithProcedure(Student student);
	//根据学号删除学生
	void deleteStudentByNo(int stuNo);
	//存储过程删除学生
	void deleteStudentWithPaocedure(int stuNo);
	//批量删除学生
    int falseDelete(String[] checkedId);
	//根据学号修改学生
	int uploadStudentByNo(Student student);
	//根据学号查询学生
	List<Student> queryStudentByNo(int stuNo);
	//查询全部学生
	List<Student> queryStudents();
	//查询学生总数
	int getTotalCount();
	//分页查询 
	List<Student> queryStudentByPage(Page page, Student student);
	//List<Object> queryStudentByPage(Page page, Student student);
}
